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

    @RequestMapping(
            value = {"/admin/login"},
            method = {RequestMethod.GET}
    )
    public String login() {
        return "admin/login";
    }


    @RequestMapping(value = "/blogs" , method = {RequestMethod.GET})
    public String blogs() {

        return "redirect:/blogs.do?pageNum=0";
    }
    @RequestMapping(value = "/blogs.do")
    public String showBlogs(
            @RequestParam("pageNum") int page,
            ModelMap modelMap) {
        List<BlogEntity> blogList = this.blogRepository.findbydate();
        int size = blogList.size();
        int allpages = (size-1)/5;
        List<BlogEntity> returnlist = new ArrayList<BlogEntity>();
        if (page<=size/5)
        {
            for (int i = page*5;i<page*5+5&&i<size;i++){
                returnlist.add(blogList.get(i));
            }
        }

        modelMap.addAttribute("blogList",returnlist);
        modelMap.addAttribute("allpages",allpages+1);
        modelMap.addAttribute("currentp",page);
        if (page>0) {
            modelMap.addAttribute("lastp", page-1);
        }else {
            modelMap.addAttribute("lastp", 0);
        }
        if (page<allpages) {
            modelMap.addAttribute("nextp", page+1);
        }else {
            modelMap.addAttribute("nextp", allpages);
        }
        return "admin/blogs";
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


    // 查看博文详情，默认使用GET方法时，method可以缺省
    @RequestMapping("/blogs/showArticle.do")
    public String showBlog(@RequestParam("id") int id, ModelMap modelMap) {
        BlogEntity blog = blogRepository.findOne(id);
        modelMap.addAttribute("blog", blog);
        List<BlogEntity> blogList = this.blogRepository.findbydate();
        modelMap.addAttribute("firstid", blogList.get(0));
        modelMap.addAttribute("lastid", blogList.get(blogList.size() - 1));
        for (int i = 0; i < blogList.size(); i++) {
            if (blogList.get(i).getId() == id) {
                if (i+1<blogList.size()) {
                    modelMap.addAttribute("ntitle", blogList.get(i + 1).getTitle());
                    modelMap.addAttribute("ntitleid", blogList.get(i + 1).getId());
                }
                if (i-1>=0) {
                    modelMap.addAttribute("ltitle", blogList.get(i - 1).getTitle());
                    modelMap.addAttribute("ltitleid", blogList.get(i - 1).getId());
                }
            }

        }
        return "admin/blogDetail";
    }

    @RequestMapping("/admin/blogs/delete/{id}")
    public String deleteBlog(@PathVariable("id") int id) {
        blogRepository.delete(id);
        blogRepository.flush();
        return "redirect:/blogs";
    }
}
