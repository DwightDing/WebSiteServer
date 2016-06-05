package com.dwightd.controller;

/**
 * Created by Dwight on 16/6/3.
 */


        import com.dwightd.model.UserEntity;
        import com.dwightd.repository.BlogRepository;
        import com.dwightd.repository.UserRepository;
        import java.util.List;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.ModelMap;
        import org.springframework.web.bind.annotation.ModelAttribute;
        import org.springframework.web.bind.annotation.PathVariable;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    BlogRepository blogRepository;

    public MainController() {
    }

    @RequestMapping(
            value = {"/"},
            method = {RequestMethod.GET}
    )
    public String index() {
        return "redirect:/index.do";
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
    @RequestMapping(
            value = {"/index.do"},
            method = {RequestMethod.GET}
    )
    public String callback(ModelMap modelMap) {
        List blogList = this.blogRepository.findAll();
        modelMap.addAttribute("blogList", blogList);
        return "index";
    }

}
