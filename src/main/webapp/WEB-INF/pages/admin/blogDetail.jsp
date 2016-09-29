<%--
  Created by IntelliJ IDEA.
  User: Dwight
  Date: 16/7/3
  Time: 下午10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//zh-CN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <title>${blog.title} |如风的少年</title>
    <link href="/css/vendor/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/screen.css" rel="stylesheet"/>
    <link href="/css/flat-ui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/css/com.css"/>
    <script src="/js/vendor/jquery.min.js"></script>
    <script src="/js/vendor/video.js"></script>
    <script src="/js/flat-ui.min.js"></script>
    <script src="/js/side-bar.js"></script>
</head>
<body style="padding-bottom: 40px;background-color: #fbfbfb;height:100%">
<jsp:include page="../content/header.jsp"></jsp:include>


<div class="container" style="padding-top: 100px">
    <div class="row">
        <article id="${blog.id}" class="post">
            <div class="post-head">
                <h5>${blog.title}</h5>
                <div class="post-meta">
                    <span class="author">作者：${blog.userByUserId.nickname}</span> •
                    <time class="post-date">${blog.pubDate}</time>
                    <div align="center">
                        <c:if test="${blog.id!=firstid.id&&blog.id!=lastid.id}">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <a href="/blogs/showArticle.do?id=${ltitleid}">上一篇:${ltitle}</a>
                                </div>
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <a href="/blogs/showArticle.do?id=${ntitleid}">下一篇:${ntitle}</a>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${blog.id==firstid.id&&blog.id!=lastid.id}">
                            <a href="/blogs/showArticle.do?id=${ntitleid}">下一篇:${ntitle}</a>
                        </c:if>
                        <c:if test="${blog.id!=firstid.id&&blog.id==lastid.id}">
                            <a href="/blogs/showArticle.do?id=${ltitleid}">上一篇:${ltitle}</a>
                        </c:if>
                        <c:if test="${blog.id==firstid.id&&blog.id==lastid.id}">
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="post-content">
                ${blog.content}
            </div>
            <div class="ds-thread" data-thread-key="${blog.id}" data-title="${blog.title}" data-url="<%=request.getScheme()+"://"+request.getServerName()+new UrlPathHelper().getOriginatingRequestUri(request)%>"></div>
            <!-- 多说评论框 end -->
            <!-- 多说公共JS代码 start (一个网页只需插入一次) -->
            <script type="text/javascript">
                var duoshuoQuery = {short_name:"hidwight"};
                (function() {
                    var ds = document.createElement('script');
                    ds.type = 'text/javascript';ds.async = true;
                    ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
                    ds.charset = 'UTF-8';
                    (document.getElementsByTagName('head')[0]
                    || document.getElementsByTagName('body')[0]).appendChild(ds);
                })();
            </script>
            <!-- 多说公共JS代码 end -->
        </article>
        <!-- 多说评论框 start -->


    </div>
</div>

<jsp:include page="../content/footer.jsp"></jsp:include>
</body>
</html>