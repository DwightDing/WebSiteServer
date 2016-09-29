package com.dwightd.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dwightd.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.dwightd.model.UserEntity;

/**
 * Created by Dwight on 16/6/3.
 */


@Controller

public class LoginController {
    //成功与失败字段
    private String successView;
    private String failView;
    @Autowired
    UserRepository userRepository;

    @RequestMapping(
            value = {"/admin/login"},
            method = {RequestMethod.GET}
    )
    public String login() {
        return "admin/login";
    }

    @RequestMapping(
            value = {"/admin/logout"},
            method = {RequestMethod.GET}
    )
    public String logout() {
        return "admin/logout";
    }

    @RequestMapping(
            value = {"/admin/manager"},
            method = {RequestMethod.GET}
    )
    public String manager() {
        return "admin/manager";
    }

    @RequestMapping(
            value = {"/login.do"},
            method = {RequestMethod.POST}
    )
    public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //不应该是这样写，但是这样看起来比较容易理解
        String username = request.getParameter("login-name");
        String password = request.getParameter("login-pass");
        UserEntity user = getUser(username, password);
        //保存相应的参数，通过ModelAndView返回
        Map<String, Object> model = new HashMap<String, Object>();
        if (user != null) {
            request.getSession().setAttribute("user",user);
            request.getSession().setAttribute("username",user.getNickname());
            return new ModelAndView("/admin/manager", model);
        } else {
            model.put("error", "用户名或密码输入错误！！！");
            return new ModelAndView("admin/login", model);
        }
    }

    //验证用户登陆
    public UserEntity getUser(String username, String password) {
        UserEntity user = this.userRepository.findUserbynameandpass(username, password);
        if (user != null) {
            return user;
        } else {
            return null;
        }
    }
}
