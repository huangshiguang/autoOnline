package com.tao.springboot.xfyun.example;
import com.tao.springboot.xfyun.example.dto.ResponseMsg;
import com.tao.springboot.xfyun.example.dto.StatusResp;
import com.tao.springboot.xfyun.example.dto.SummaryResp;
import com.tao.springboot.xfyun.example.dto.UploadResp;
import com.tao.springboot.xfyun.example.util.ChatDocUtil;

import java.util.List;

/**
 * Test
 * 详细接口文档请查看 https://www.xfyun.cn/doc/spark/ChatDoc-API.html
 *
 * @author mlxu11
 * @version 2024/08/29 13:59
 **/
public class Main {
    private static final String appId = "5b6be9b3";//控制台获取
    private static final String secret = "713d5ee705273638c433ad7d5127c579";//控制台获取
    private static final String uploadUrl = "https://chatdoc.xfyun.cn/openapi/v1/file/upload";
    private static final String chatUrl = "wss://chatdoc.xfyun.cn/openapi/chat";
    private static final String statusUrl = "https://chatdoc.xfyun.cn/openapi/v1/file/status";
    private static final String SummaryStartUrl = "https://chatdoc.xfyun.cn/openapi/v1/file/summary/start";
    private static final String SummaryQueryUrl = "https://chatdoc.xfyun.cn/openapi/v1/file/summary/query";
    private static final String fileRepoListUrl = "https://chatdoc.xfyun.cn/openapi/v1/repo/file/list";
    private static final String repoListUrl ="https://chatdoc.xfyun.cn/openapi/v1/repo/list";
    private static final String fileListUrl = "https://chatdoc.xfyun.cn/openapi/v1/file/list";

    public static void main(String[] args) {
        ChatDocUtil chatDocUtil = new ChatDocUtil();
        // 1、上传。注意：demo采用文件形式上传；如果以文件url形式上传，需要填写fileName
        UploadResp uploadResp = chatDocUtil.upload(Main.class.getResource("/").getPath() + "test.txt", uploadUrl, appId, secret);
        System.out.println("请求sid=" + uploadResp.getSid());
        System.out.println("文件id=" + uploadResp.getData().getFileId());

        //2、文档状态查询,如果查询多个文档的状态，需要将fileId用英文逗号分割
        String statusFileId = uploadResp.getData().getFileId();
        StatusResp status = chatDocUtil.status(statusUrl, statusFileId, appId, secret);
        List<StatusResp.Datas> datasList = status.getData();
        for (StatusResp.Datas datas : datasList) {
            System.out.println("文件id=" + datas.getFileId() + " 文件状态=" + datas.getFileStatus());
        }

        // 3、问答。上传文件状态为vectored时才可以问答，文件状态可以调用上面的接口查询
        String chatFileId = uploadResp.getData().getFileId();
        String question = "故事一讲了什么内容";
        chatDocUtil.chat(chatUrl, chatFileId, question, appId, secret);

        //4、文档总结 + 5、获取文档总结/概要信息。这里采用轮询的方式，文档总结完成后获取总结内容
        String SummaryFileId = uploadResp.getData().getFileId();
        ResponseMsg responseMsg = chatDocUtil.start(SummaryStartUrl, SummaryFileId, appId, secret);
        while (true) {
            if (responseMsg.getCode() != 0) {
                System.out.println("文档总结发起失败，请重新发起,code=" + responseMsg.getCode() + " sid =" + responseMsg.getSid());
                break;
            }
            SummaryResp summaryResp = chatDocUtil.query(SummaryQueryUrl, SummaryFileId, appId, secret);
            if (summaryResp.getData().getSummaryStatus().equals("done")) {
                System.out.println("文档总结最终结果： " + summaryResp.getData().getSummary());
                break;
            } else if (summaryResp.getData().getSummaryStatus().equals("failed")) {
                System.out.println("总结失败");
                break;
            } else if (summaryResp.getData().getSummaryStatus().equals("illegal")) {
                System.out.println("内容敏感");
                break;
            } else {
                System.out.println("总结中");
            }
        }
    }


}