package com.tao.springboot.xfyun.example.util;

import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.tao.springboot.xfyun.example.dto.ResponseMsg;
import com.tao.springboot.xfyun.example.dto.StatusResp;
import com.tao.springboot.xfyun.example.dto.SummaryResp;
import com.tao.springboot.xfyun.example.dto.UploadResp;
import com.tao.springboot.xfyun.example.dto.chat.ChatExtends;
import com.tao.springboot.xfyun.example.dto.chat.ChatMessage;
import com.tao.springboot.xfyun.example.dto.chat.ChatRequest;
import okhttp3.*;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * Test
 *
 * @author mlxu11
 * @version 2024/08/29 13:59
 **/
public class ChatDocUtil {

    private final static OkHttpClient client = new OkHttpClient().newBuilder()
            .connectionPool(new ConnectionPool(100, 5, TimeUnit.MINUTES))
            .readTimeout(60*10, TimeUnit.SECONDS)
            .build();

    public UploadResp upload(String filePath, String url, String appId, String secret) {
        File file = new File(filePath);

        MultipartBody.Builder builder = new MultipartBody.Builder();
        builder.setType(MultipartBody.FORM);
        builder.addFormDataPart("file", file.getName(),
                RequestBody.create(MediaType.parse("multipart/form-data"), file));
        builder.addFormDataPart("fileType", "wiki");
        RequestBody body = builder.build();
        long ts = System.currentTimeMillis() / 1000;
        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .addHeader("appId", appId)
                .addHeader("timestamp", String.valueOf(ts))
                .addHeader("signature", ApiAuthUtil.getSignature(appId, secret, ts))
                .build();
        try {
            Response response = client.newCall(request).execute();
            if (Objects.equals(response.code(), 200)) {
                String respBody = response.body().string();
                return JSONUtil.toBean(respBody, UploadResp.class);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return null;
    }


    public StatusResp status(String statusUrl, String fileId, String appId, String secret) {
        RequestBody body = new MultipartBody.Builder().setType(MultipartBody.FORM)
                .addFormDataPart("fileIds", fileId)
                .build();
        long ts = System.currentTimeMillis() / 1000;
        Request request = new Request.Builder()
                .url(statusUrl)
                .method("POST",body)
                .addHeader("appId", appId)
                .addHeader("timestamp", String.valueOf(ts))
                .addHeader("signature", ApiAuthUtil.getSignature(appId, secret, ts))
                .build();
        try {
            Response response = client.newCall(request).execute();
            if (Objects.equals(response.code(), 200)) {
                String respBody = response.body().string();
                //System.out.println(respBody);
                return JSONUtil.toBean(respBody, StatusResp.class);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return null;

    }

    public StatusResp queryList(String statusUrl, String appId, String secret) {
        // 准备请求体的内容
//        String json = "{\"currentPage\":\"1\"}";
//        RequestBody requestBody = RequestBody.create(MediaType.parse("application/json; charset=utf-8"), json);
        RequestBody body = new MultipartBody.Builder().setType(MultipartBody.FORM)
                .addFormDataPart("currentPage", "1")
                .addFormDataPart("pageSize", "10")
                .build();
        long ts = System.currentTimeMillis() / 1000;
        Request request = new Request.Builder()
                .url(statusUrl)
                .method("POST",body)
                .addHeader("Content-Type", "application/json; charset=utf-8")
                .addHeader("appId", appId)
                .addHeader("timestamp", String.valueOf(ts))
                .addHeader("signature", ApiAuthUtil.getSignature(appId, secret, ts))
                .build();
        try {
            Response response = client.newCall(request).execute();
            if (Objects.equals(response.code(), 200)) {
                String respBody = response.body().string();
                //System.out.println(respBody);
                return JSONUtil.toBean(respBody, StatusResp.class);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return null;

    }


    public void chat(String chatUrl, String fileId, String question, String appId, String secret) {
        ChatMessage message = new ChatMessage();
        message.setRole("user");
        message.setContent(question);
        // 请求内容
        //自定义扩展字段 用户问题未匹配到文档内容时，大模型兜底回答问题。
        ChatExtends chatExtends = ChatExtends.builder()
                .spark(true)
                .build();
        ChatRequest request = ChatRequest.builder()
                .fileIds(Collections.singletonList(fileId))
                .topN(3)
                .messages(Collections.singletonList(message))
                //.chatExtends(chatExtends) //注意：此处并未使用扩展字段，用户可根据自身需求参考接口文档进行设置
                .build();

        // 构造url鉴权
        long ts = System.currentTimeMillis() / 1000;
        String signature = ApiAuthUtil.getSignature(appId, secret, ts);
        String requestUrl = chatUrl + "?" + "appId=" + appId + "&timestamp=" + ts + "&signature=" + signature;
        // ws
        Request wsRequest = (new Request.Builder()).url(requestUrl).build();
        OkHttpClient okHttpClient = new OkHttpClient().newBuilder().build();
        StringBuffer buffer = new StringBuffer();
        WebSocket webSocket = okHttpClient.newWebSocket(wsRequest, new WebSocketListener() {
            @Override
            public void onClosed(@NotNull WebSocket webSocket, int code, @NotNull String reason) {
                super.onClosed(webSocket, code, reason);
                webSocket.close(1002, "websocket finish");
                okHttpClient.connectionPool().evictAll();
            }

            @Override
            public void onFailure(@NotNull WebSocket webSocket, @NotNull Throwable t, @Nullable Response response) {
                super.onFailure(webSocket, t, response);
                webSocket.close(1001, "websocket finish");
                okHttpClient.connectionPool().evictAll();
            }

            @Override
            public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
                System.out.println(text);
                JSONObject jsonObject = JSONUtil.parseObj(text);
                String content = jsonObject.getStr("content");
                if (StrUtil.isNotEmpty(content)) {
                    buffer.append(content);
                }
                if (Objects.equals(jsonObject.getInt("status"), 2)) {
                    System.out.println("回答内容：" + buffer);
                    webSocket.close(1000, "websocket finish");
                    okHttpClient.connectionPool().evictAll();
                    System.exit(0);
                }
            }
        });
        webSocket.send(JSONUtil.toJsonStr(request));
    }

    public ResponseMsg start(String SummaryStartUrl, String fileId, String appId, String secret) {

        RequestBody body = new MultipartBody.Builder().setType(MultipartBody.FORM)
                .addFormDataPart("fileId", fileId)
                .build();
        long ts = System.currentTimeMillis() / 1000;
        Request request = new Request.Builder()
                .url(SummaryStartUrl)
                .method("POST",body)
                .addHeader("appId", appId)
                .addHeader("timestamp", String.valueOf(ts))
                .addHeader("signature", ApiAuthUtil.getSignature(appId, secret, ts))
                .build();
        try {
            Response response = client.newCall(request).execute();
            //System.err.println(response);
            if (Objects.equals(response.code(), 200)) {
                String respBody = response.body().string();
                //System.out.println(respBody);
                return JSONUtil.toBean(respBody, ResponseMsg.class);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return null;

    }

    public SummaryResp query(String SummaryStartUrl, String fileId, String appId, String secret) {
        RequestBody body = new MultipartBody.Builder().setType(MultipartBody.FORM)
                .addFormDataPart("fileId", fileId)
                .build();
        long ts = System.currentTimeMillis() / 1000;
        Request request = new Request.Builder()
                .url(SummaryStartUrl)
                .method("POST",body)
                .addHeader("appId", appId)
                .addHeader("timestamp", String.valueOf(ts))
                .addHeader("signature", ApiAuthUtil.getSignature(appId, secret, ts))
                .build();
        try {
            Response response = client.newCall(request).execute();
            //System.err.println(response);
            if (Objects.equals(response.code(), 200)) {
                String respBody = response.body().string();
                //System.out.println(respBody);
                return JSONUtil.toBean(respBody, SummaryResp.class);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return null;

    }
}