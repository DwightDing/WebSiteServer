package com.dwightd.controller;

import com.dwightd.model.UserEntity;
import com.dwightd.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by Dwight on 16/6/3.
 */
@Controller
public class ManageController {
    @Autowired
    UserRepository userRepository;
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
}
