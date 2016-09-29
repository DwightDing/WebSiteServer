<%@ page import="com.dwightd.model.UserEntity" %><%--
  Created by IntelliJ IDEA.
  User: Dwight
  Date: 2016/9/29
  Time: 下午4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript">
        //iOS Web APP中点击链接跳转到Safari 浏览器新标签页的问题
        if (("standalone" in window.navigator) && window.navigator.standalone) {
            var noddy, remotes = false;
            document.addEventListener('click', function (event) {
                noddy = event.target;
                while (noddy.nodeName !== "A" && noddy.nodeName !== "HTML") {
                    noddy = noddy.parentNode;
                }
                if ('href' in noddy && noddy.href.indexOf('http') !== -1 && (noddy.href.indexOf(document.location.host) !== -1 || remotes)) {
                    event.preventDefault();
                    document.location.href = noddy.href;
                }
            }, false);
        }
    </script>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport"
          content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1, user-scalable=no">
    <title>用户登录</title>
    <link href="/css/vendor/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/flat-ui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/com.css"/>
    <script src="/js/vendor/jquery.min.js"></script>
    <script src="/js/vendor/video.js"></script>
    <script src="/js/flat-ui.min.js"></script>
    <script src="/js/side-bar.js"></script>
</head>
<body style="padding-top:160px; padding-bottom: 100px; ">
<style>
    /*
 * Base structure
 */

    /* Move down content because we have a fixed navbar that is 50px tall */
    body {
        padding-top: 50px;
    }

    /*
     * Global add-ons
     */

    .sub-header {
        padding-bottom: 10px;
        border-bottom: 1px solid #eee;
    }

    /*
     * Top navigation
     * Hide default border to remove 1px line.
     */
    .navbar-fixed-top {
        border: 0;
    }

    /*
     * Sidebar
     */

    /* Hide for mobile, show later */
    .sidebar {
        display: none;
    }

    @media (min-width: 768px) {
        .sidebar {
            position: fixed;
            top: 51px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            display: block;
            padding: 20px;
            overflow-x: hidden;
            overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            background-color: #f5f5f5;
            border-right: 1px solid #eee;
        }
    }

    /* Sidebar navigation */
    .nav-sidebar {
        margin-right: -21px; /* 20px padding + 1px border */
        margin-bottom: 20px;
        margin-left: -20px;
    }

    .nav-sidebar > li > a {
        padding-right: 20px;
        padding-left: 20px;
    }

    .nav-sidebar > .active > a,
    .nav-sidebar > .active > a:hover,
    .nav-sidebar > .active > a:focus {
        color: #fff;
        background-color: #428bca;
    }

    /*
     * Main content
     */

    .main {
        padding: 20px;
    }

    @media (min-width: 768px) {
        .main {
            padding-right: 40px;
            padding-left: 40px;
        }
    }

    .main .page-header {
        margin-top: 0;
    }

    /*
     * Placeholder dashboard ideas
     */

    .placeholders {
        margin-bottom: 30px;
        text-align: center;
    }

    .placeholders h4 {
        margin-bottom: 0;
    }

    .placeholder {
        margin-bottom: 20px;
    }

    .placeholder img {
        display: inline-block;
        border-radius: 50%;
    }


</style>
<jsp:include page="../content/header.jsp"></jsp:include>
<div class="container">
    <div class="row">

        <%
            if (request.getSession().getAttribute("username") != null) {
                UserEntity user = (UserEntity) request.getSession().getAttribute("user");
        %>

        <div class="container-fluid">

            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">

                    <div align="center"><span
                            class="login-field-icon fui-user">  <%=request.getSession().getAttribute("username").toString()%><a
                            href="/admin/logout"> 注销</a></span></div>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="#">用户信息 <span class="sr-only">(current)</span></a></li>

                    </ul>

                </div>

            </div>

            <%
            } else {
                response.setHeader("refresh", "1;URL=/admin/login");

            %>
            您未登陆
            <%
                }
                ;
            %>


        </div>
    </div>
    <jsp:include page="../content/footer.jsp"></jsp:include>
</body>
</html>
