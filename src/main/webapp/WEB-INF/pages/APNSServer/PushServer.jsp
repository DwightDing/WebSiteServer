<%--
  Created by IntelliJ IDEA.
  User: Dwight
  Date: 2016/10/25
  Time: 下午8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>APNS服务 | 如风的少年</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1, user-scalable=no">
    <title>404 Error</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="page-header">
                <h1>
                    APNS_Test for JAVA <span style="font-size: 20px">powered by Chenguang</span>
                </h1>
            </div>
            <div class="row-fluid">
                <form class="form-horizontal" role="form" action="/apnspush.do" method="post" >
                    <div class="form-group">
                        <label for="DeviceToken" class="col-sm-2 control-label">DeviceToken</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="DeviceToken" name="DeviceToken" placeholder="DeviceToken">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Title" class="col-sm-2 control-label">Title</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Title" name="Title" placeholder="Title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Body" class="col-sm-2 control-label">Body</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Body" name="Body" placeholder="Body">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="badge" class="col-sm-2 control-label">badge</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="badge" name="badge" placeholder="badge">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Sound" class="col-sm-2 control-label">Sound</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Sound" name="Sound" placeholder="Sound">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="category" class="col-sm-2 control-label">category</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="category" name="category" placeholder="category">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Json" class="col-sm-2 control-label">Json(optional)</label>
                        <div class="col-sm-10">
                            <textarea rows="3" type="Json" class="form-control" id="Json" name="Json" placeholder="Input ANPS JSON format"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Ready for Push</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
