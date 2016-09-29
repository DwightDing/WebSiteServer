<%--
  Created by IntelliJ IDEA.
  User: Dwight
  Date: 2016/9/29
  Time: 下午11:08
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
    <title>注销中，请稍等</title>
    <link href="/css/vendor/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/flat-ui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/com.css"/>
    <script src="/js/vendor/jquery.min.js"></script>
    <script src="/js/vendor/video.js"></script>
    <script src="/js/flat-ui.min.js"></script>
    <script src="/js/side-bar.js" ></script>
</head>
<body style="padding-top:160px; padding-bottom: 100px; ">
<jsp:include page="../content/header.jsp"></jsp:include>
<div class="container">
    <%
        response.setHeader("refresh", "2;URL=/admin/login");
        request.getSession().invalidate();
    %>
    <div class="col-sm-12">
        注销中。。。请等待
    </div>
</div>
<jsp:include page="../content/footer.jsp"></jsp:include>
</body>
</html>
