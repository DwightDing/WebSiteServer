package com.dwightd.controller;

import com.dwightd.model.BlogEntity;
import com.dwightd.model.UserEntity;
import com.dwightd.repository.BlogRepository;
import com.dwightd.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Dwight on 16/6/3.
 */
@Controller
public class ManageController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    BlogRepository blogRepository;
    @RequestMapping(
            value = {"/admin/users"},
            method = {RequestMethod.GET}
    )
    public String getUsers(ModelMap modelMap) {
        List userList = this.userRepository.findAll();
        modelMap.addAttribute("userList", userList);
        return "admin/users";
    }

    @RequestMapping(
            value = {"/admin/users/add"},
            method = {RequestMethod.GET}
    )
    public String addUser() {
        return "admin/addUser";
    }

    @RequestMapping(
            value = {"/admin/users/addP"},
            method = {RequestMethod.POST}
    )
    public String addUserPost(@ModelAttribute("user") UserEntity userEntity) {
        this.userRepository.saveAndFlush(userEntity);
        return "redirect:/admin/users";
    }

    @RequestMapping(
            value = {"/admin/users/show/{id}"},
            method = {RequestMethod.GET}
    )
    public String showUser(@PathVariable("id") Integer userId, ModelMap modelMap) {
        UserEntity userEntity = (UserEntity)this.userRepository.findOne(userId);
        modelMap.addAttribute("user", userEntity);
        return "admin/userDetail";
    }

    @RequestMapping(
            value = {"/admin/users/update/{id}"},
            method = {RequestMethod.GET}
    )
    public String updateUser(@PathVariable("id") Integer userId, ModelMap modelMap) {
        UserEntity userEntity = (UserEntity)this.userRepository.findOne(userId);
        modelMap.addAttribute("user", userEntity);
        return "admin/updateUser";
    }

    @RequestMapping(
            value = {"/admin/users/updateP"},
            method = {RequestMethod.POST}
    )
    public String updateUserPost(@ModelAttribute("userP") UserEntity user) {
        this.userRepository.updateUser(user.getNickname(), user.getFirstName(), user.getLastName(), user.getPassword(), Integer.valueOf(user.getId()));
        this.userRepository.flush();
        return "redirect:/admin/users";
    }

    @RequestMapping(
            value = {"/admin/users/delete/{id}"},
            method = {RequestMethod.GET}
    )
    public String deleteUser(@PathVariable("id") Integer userId) {
        this.userRepository.delete(userId);
        this.userRepository.flush();
        return "redirect:/admin/users";
    }



    // 添加博文
    @RequestMapping(value = "/admin/blogs/add", method = RequestMethod.GET)
    public String addBlog(ModelMap modelMap) {
        List userList = this.userRepository.findAll();
        modelMap.addAttribute("userList", userList);
        return "admin/addBlog";
    }

    // 添加博文，POST请求，重定向为查看博客页面
    @RequestMapping(value = "/admin/blogs/addP", method = RequestMethod.POST)
    public String addBlogPost(@ModelAttribute("blog") BlogEntity blogEntity) {
        this.blogRepository.saveAndFlush(blogEntity);
        // 重定向地址
        return "redirect:/blogs";
    }




    @RequestMapping(
            value = {"/admin/blogs/update/{id}"},
            method = {RequestMethod.GET}
    )
    public String updateBlogs(@PathVariable("id") Integer BlogId, ModelMap modelMap) {
        BlogEntity blogEntity = (BlogEntity)this.blogRepository.findOne(BlogId);
        modelMap.addAttribute("blog", blogEntity);
        List userList = this.userRepository.findAll();
        modelMap.addAttribute("userList", userList);
        return "admin/updateBlogs";
    }

    @RequestMapping(
            value = {"/admin/blogs/updateP"},
            method = {RequestMethod.POST}
    )
    public String updateBlogsPost(@ModelAttribute("blogP") BlogEntity blog) {
        this.blogRepository.updateBlog(blog.getTitle(),blog.getUserByUserId().getId(),blog.getContent(),blog.getPubDate(),Integer.valueOf(blog.getId()));
        this.blogRepository.flush();
        return "redirect:/blogs";
    }

    @RequestMapping("/admin/blogs/delete/{id}")
    public String deleteBlog(@PathVariable("id") int id) {
        blogRepository.delete(id);
        blogRepository.flush();
        return "redirect:/blogs";
    }
}
