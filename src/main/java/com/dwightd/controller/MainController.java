package com.dwightd.controller;

/**
 * Created by Dwight on 16/6/3.
 */


import com.dwightd.model.BlogEntity;
import com.dwightd.model.UserEntity;
import com.dwightd.model.blogModel;
import com.dwightd.repository.BlogRepository;
import com.dwightd.repository.UserRepository;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.deploy.net.HttpResponse;
import com.sun.tools.internal.ws.wsdl.document.jaxws.Exception;
import com.sun.tracing.dtrace.Attributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MainController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    BlogRepository blogRepository;

    public MainController() {
    }

    @RequestMapping(
            value = {"/404"},
            method = {RequestMethod.GET}
    )
    public String error() {
        return "/404";
    }

    @RequestMapping(
            value = {"/"},
            method = {RequestMethod.GET}
    )
    public String index() {
        return "welcome";
    }

    @RequestMapping(
            value = {"/index.do"},
            method = {RequestMethod.GET}
    )
    public String callback(ModelMap modelMap) {
        return "index_new";
    }


    @RequestMapping(
            value = {"/support"},
            method = {RequestMethod.GET}
    )
    public String support() {
        return "support";
    }

    @RequestMapping(
            value = {"/private"},
            method = {RequestMethod.GET}
    )
    public String pri() {
        return "private";
    }


    @RequestMapping("/controller")
    public String control() {
        return "controller";
    }

    //==================博文相关=========================
    //    重定向
    @RequestMapping(value = "/blogs", method = {RequestMethod.GET})
    public String blogs() {

        return "redirect:/blogs.do?pageNum=0";
    }

    @RequestMapping(value = "/blogs.do")
    public String showBlogs(
            @RequestParam("pageNum") int page,
            ModelMap modelMap) {
        List<BlogEntity> blogList = this.blogRepository.findbydate();
        int size = blogList.size();
        int allpages = (size - 1) / 5;
        List<BlogEntity> returnlist = new ArrayList<BlogEntity>();
        if (page <= size / 5) {
            for (int i = page * 5; i < page * 5 + 5 && i < size; i++) {
                returnlist.add(blogList.get(i));
            }
        }

        modelMap.addAttribute("blogList", returnlist);
        modelMap.addAttribute("allpages", allpages + 1);
        modelMap.addAttribute("currentp", page);
        if (page > 0) {
            modelMap.addAttribute("lastp", page - 1);
        } else {
            modelMap.addAttribute("lastp", 0);
        }
        if (page < allpages) {
            modelMap.addAttribute("nextp", page + 1);
        } else {
            modelMap.addAttribute("nextp", allpages);
        }
        return "admin/blogs";
    }

    //显示文章详细内容
    @RequestMapping("/blogs/showArticle.do")
    public String showBlog(@RequestParam("id") int id, ModelMap modelMap) {
        BlogEntity blog = blogRepository.findOne(id);
        modelMap.addAttribute("blog", blog);
        List<BlogEntity> blogList = this.blogRepository.findbydate();
        modelMap.addAttribute("firstid", blogList.get(0));
        modelMap.addAttribute("lastid", blogList.get(blogList.size() - 1));
        for (int i = 0; i < blogList.size(); i++) {
            if (blogList.get(i).getId() == id) {
                if (i + 1 < blogList.size()) {
                    modelMap.addAttribute("ntitle", blogList.get(i + 1).getTitle());
                    modelMap.addAttribute("ntitleid", blogList.get(i + 1).getId());
                }
                if (i - 1 >= 0) {
                    modelMap.addAttribute("ltitle", blogList.get(i - 1).getTitle());
                    modelMap.addAttribute("ltitleid", blogList.get(i - 1).getId());
                }
            }

        }
        return "admin/blogDetail";
    }

    //=============文章转json=================
    @RequestMapping(
            value = {"/api/getbloglist.do"},//拦截器
            method = {RequestMethod.GET}
    )

    public void blog(HttpServletResponse response) {
        response.setHeader("ContentType", "text／plain;charset=UTF-8");//设置返回json数据的编码
        response.setCharacterEncoding("UTF-8");//设置编码
        List<blogModel> list = new ArrayList<blogModel>();//获取所有博文内容
        List<BlogEntity> blogList = this.blogRepository.findAll();//查询所有博文
        for (BlogEntity obj : blogList) {
            blogModel in = new blogModel();//模型匹配
            in.setTitle(obj.getTitle());
            in.setDescribe(obj.getDescription());
            list.add(in);
        }
        Gson gson = new GsonBuilder().create();
        try {

            response.getWriter().write(gson.toJson(list));//Gson可解析的博文内容
        } catch (IOException e) {

        }
    }
}
