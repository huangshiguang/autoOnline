package com.tao.springboot.xfyun.example.dto.chat;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class ChatExtends {
    private String wikiPromptTpl;

    private Boolean spark;

}
