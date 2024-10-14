package com.tao.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: JiantaoYan
 * @Description:
 * @Date: 20:53 2018/11/27
 */
@Controller
public class MainController extends BaseController{

    @RequestMapping(value = "/")
    public String main(ModelAndView model) {
        return "/admin/index";
    }

    @RequestMapping(value = "/admin/welcome", method = RequestMethod.GET)
    public String welcome(ModelAndView model) {
        return "/admin/welcome";
    }



}
