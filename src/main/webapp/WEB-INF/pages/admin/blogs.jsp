<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Blog|如风的少年</title>
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
        <c:if test="${!empty blogList}">

            <c:forEach items="${blogList}" var="blog">
                <article id="${blog.id}" class="post">
                    <div class="post-head">
                        <h5>${blog.title}</h5>
                        <div class="post-meta">
                            <span class="author">作者：${blog.userByUserId.nickname}</span> •
                            <time class="post-date">${blog.pubDate}</time>
                        </div>
                    </div>
                    <div class="post-content">
                            ${blog.description}
                        <div align="center">
                            <a href="/blogs/showArticle.do?id=${blog.id}">-点击阅读全文-</a>
                        </div>
                    </div>
                </article>

            </c:forEach>
        </c:if>

    </div>
    <div align="center">
        <div class="pagination">
            <ul>
                <li class="previous"><a href="/blogs.do?pageNum=${lastp}" class="fui-arrow-left"></a></li>
                <c:forEach begin="1" end="${allpages}" varStatus="status">
                    <c:if test="${currentp+1==status.index}">
                        <li class="active"><a href="/blogs.do?pageNum=${status.index-1}">${status.index}</a></li>
                    </c:if>
                    <c:if test="${currentp+1!=status.index}">
                        <li class=""><a href="/blogs.do?pageNum=${status.index-1}">${status.index}</a></li>
                    </c:if>

                </c:forEach>

                <li class="next"><a href="/blogs.do?pageNum=${nextp}" class="fui-arrow-right"></a></li>
            </ul>
        </div>
    </div>

</div>

<jsp:include page="../content/footer.jsp"></jsp:include>
</body>
</html>