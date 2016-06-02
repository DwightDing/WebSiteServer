<%--
  Created by IntelliJ IDEA.
  User: Dwight
  Date: 16/4/29
  Time: 下午1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript">
        //iOS Web APP中点击链接跳转到Safari 浏览器新标签页的问题
        if(("standalone" in window.navigator) && window.navigator.standalone){
            var noddy, remotes = false;
            document.addEventListener('click', function(event) {
                noddy = event.target;
                while(noddy.nodeName !== "A" && noddy.nodeName !== "HTML") {
                    noddy = noddy.parentNode;
                }
                if('href' in noddy && noddy.href.indexOf('http') !== -1 && (noddy.href.indexOf(document.location.host) !== -1 || remotes))
                {
                    event.preventDefault();
                    document.location.href = noddy.href;
                }
            },false);
        }
    </script>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1, user-scalable=no">
    <title>用户登录</title>
    <link href="css/vendor/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/flat-ui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/com.css"/>
    <script src="js/vendor/jquery.min.js"></script>
    <script src="js/vendor/video.js"></script>
    <script src="js/flat-ui.min.js"></script>
    <script src="/js/side-bar.js" ></script>
</head>
<body style="padding-top:160px; padding-bottom: 100px; " class="back">
<jsp:include page="../content/header.jsp"></jsp:include>
<div class="container">
<div class="row">

    <div class="col-xs-0 col-md-4 col-lg-4">

    </div>
    <!-- /video -->

    <div class="col-xs-12 col-md-4 col-lg-4" align="center">


        <form class="login-form" action="login.do" method="post">
            <div style="height: 100px;width: 100px;border-radius: 50px;overflow: hidden;margin-bottom: 20px">
                <img style="height: 100px;width: 100px;"src="images/avatar.jpg" rel="avatar">
            </div>
            <div class="form-group">
                <input type="text" class="form-control login-field" value=""
                       placeholder="账号ID/邮箱" name="login-name"> <label
                    class="login-field-icon fui-user" ></label>
            </div>

            <div class="form-group">
                <input type="password" class="form-control login-field" value=""
                       placeholder="密码" name="login-pass"> <label
                    class="login-field-icon fui-lock" ></label>
            </div>

            <input type="submit" class="btn btn-primary btn-lg btn-block"
                   value="登录"> <a class="login-link" href="signin_user.jsp">没有账号?点击注册</a>
        </form>

    </div>
    <div class="col-xs-0 col-md-4 col-lg-4">

    </div>
</div>
    </div>
<jsp:include page="../content/footer.jsp"></jsp:include>
</body>
</html>
