<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//CH" "http://www.w3.org/TR/html4/loose.dtd">
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
    <title>404 Error</title>
    <link href="/css/vendor/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/flat-ui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/com.css"/>
    <script src="/js/vendor/jquery.min.js"></script>
    <script src="/js/vendor/video.js"></script>
    <script src="/js/flat-ui.min.js"></script>
    <script src="/js/side-bar.js" ></script>
</head>
<body style="padding-top: 52px; padding-bottom: 100px;background: url(/images/404.png) top center no-repeat;">
<jsp:include page="content/header.jsp"></jsp:include>


<jsp:include page="content/footer.jsp"></jsp:include>
<script src="/js/vendor/jquery.min.js"></script>
<script src="/js/vendor/video.js"></script>
<script src="/js/flat-ui.min.js"></script>
<script>
    videojs.options.flash.swf = "js/vendors/video-js.swf"
</script>
</body>
</html>