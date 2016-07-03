package com.dwightd.controller;

/**
 * Created by Dwight on 16/6/3.
 */


        import com.dwightd.model.BlogEntity;
        import com.dwightd.model.UserEntity;
        import com.dwightd.model.blogModel;
        import com.dwightd.repository.BlogRepository;
        import com.dwightd.repository.UserRepository;

        import java.io.IOException;
        import java.util.ArrayList;
        import java.util.List;

        import com.google.gson.Gson;
        import com.google.gson.GsonBuilder;
        import com.sun.deploy.net.HttpResponse;
        import com.sun.tools.internal.ws.wsdl.document.jaxws.Exception;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.ModelMap;
        import org.springframework.web.bind.annotation.ModelAttribute;
        import org.springframework.web.bind.annotation.PathVariable;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.RequestMethod;

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
//    @RequestMapping(
//            value = {"/new"},
//            method = {RequestMethod.GET}
//    )
//    public void htmlView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        // ...
//        request.getRequestDispatcher("/WEB-INF/pages/index_new.html").forward(request, response);
//        //response.sendRedirect("http://www.baidu.com");
//    }
    @RequestMapping(
            value = {"/index.do"},
            method = {RequestMethod.GET}
    )
    public String callback(ModelMap modelMap) {
        return "index_new";
    }
    @RequestMapping(
            value = {"/api/getbloglist.do"},//拦截器
            method = {RequestMethod.GET}
    )

    public void blog(HttpServletResponse response) {
        response.setHeader("ContentType","text／plain;charset=UTF-8");//设置返回json数据的编码
        response.setCharacterEncoding("UTF-8");//设置编码
        List <blogModel> list = new ArrayList<blogModel>();//获取所有博文内容
        List <BlogEntity> blogList = this.blogRepository.findAll();//查询所有博文
        for (BlogEntity obj:blogList){
            blogModel in = new blogModel();//模型匹配
            in.setTitle(obj.getTitle());
            in.setContent(obj.getContent());
            list.add(in);
        }
        Gson gson = new GsonBuilder().create();
        try {

            response.getWriter().write(gson.toJson(list));//Gson可解析的博文内容
        }catch (IOException e){

        }
    }
    @RequestMapping(value = "/admin/blogs", method = RequestMethod.GET)
    public String showBlogs(ModelMap modelMap) {
        List<BlogEntity> blogList = this.blogRepository.findAll();
        modelMap.addAttribute("blogList", blogList);
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
        // 打印博客标题
        System.out.println(blogEntity.getTitle());
        // 打印博客作者
        System.out.println(blogEntity.getUserByUserId().getNickname());
        // 存库
        blogRepository.saveAndFlush(blogEntity);
        // 重定向地址
        return "redirect:/admin/blogs";
    }
    // 查看博文详情，默认使用GET方法时，method可以缺省
    @RequestMapping("/admin/blogs/show/{id}")
    public String showBlog(@PathVariable("id") int id, ModelMap modelMap) {
        BlogEntity blog = blogRepository.findOne(id);
        modelMap.addAttribute("blog", blog);
        return "admin/blogDetail";
    }

    @RequestMapping("/admin/blogs/delete/{id}")
    public String deleteBlog(@PathVariable("id") int id) {
        blogRepository.delete(id);
        blogRepository.flush();
        return "redirect:/admin/blogs";
    }
}
