<%--
  Created by IntelliJ IDEA.
  User: Dwight
  Date: 16/4/29
  Time: 下午1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--导航开始-->
<div class="container">
    <div class="row demo-row">
        <div class="col-xs-12">
            <nav class="navbar navbar-inverse  navbar-fixed-top"
                 role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#navbar-collapse-01">
                        <span class="sr-only"></span>
                    </button>
                    <a class="navbar-brand" href="index.do">Likewind</a>
                </div>
                <div class="collapse navbar-collapse" id="navbar-collapse-01">
                    <ul class="nav navbar-nav navbar-left">
                        <li><a href="../index.do">首页</a></li>
                        <li><a href="http://blog.dwightding.cn">我的博客</a></li>
                        <li><a href="http://www.github.com/DwightDing">我的GitHub</a></li>
                        <li><a href="http://www.dwightding.cn:9090">Openfire服务器</a></li>
                        <li><a href="http://www.dwightding.cn/BmobServer">BmobServer</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/admin/login">登录</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
<!--导航结束-->
