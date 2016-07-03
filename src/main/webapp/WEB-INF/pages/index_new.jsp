<%--
  Created by IntelliJ IDEA.
  User: Dwight
  Date: 16/7/3
  Time: 下午4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
    <title>Likewind|如风的少年</title>
    <meta name="description" content="如风的少年">
    <meta name="author" content="">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
    <link href="/css/google_font.css" rel="stylesheet">
</head>
<body data-spy="scroll" data-offset="50" data-target=".navbar-collapse">

<div class="preloader">

    <div class="sk-rotating-plane"></div>

</div>

<!--navbar-->
<jsp:include page="content/navbar.jsp"></jsp:include>


<!--封面-->
<section id="intro" class="parallax-section">
    <div class="container">
        <div class="row">

            <div class="col-md-12 col-sm-12">
                <a href="#overview" class="btn btn-lg btn-default smoothScroll wow fadeInUp hidden-xs"
                   data-wow-delay="0.3s">如风的少年</a>
                <a href="http://weibo.com/cncndcg" class="btn btn-lg btn-danger smoothScroll wow fadeInUp"
                   data-wow-delay="0.5s">新浪微博</a>
                <a href="http://blog.dwightding.cn" class="btn btn-lg btn-danger smoothScroll wow fadeInUp"
                   data-wow-delay="0.5s">Blog</a>
            </div>


        </div>
    </div>
</section>
<!--作品-->
<section id="overview" class="parallax-section">
    <div class="container">
        <div class="row">
            <div class="wow fadeInUp col-md-12 col-sm-12" data-wow-delay="0.3s">
                <h3>应用展示</h3>
            </div>
            <div class="wow fadeInUp col-md-3 col-sm-3" data-wow-delay="0.3s">

                <p>工大原创教务<a
                        href="https://itunes.apple.com/cn/app/gong-da-yuan-chuang-jiao-wu/id1123425752?mt=8">点击进入商店</a>
                </p>
                <div>
                    <h4>
                        内容提要
                    </h4>
                    <p itemprop="description" class=" " style="height: auto;">版本1.1<br>［原创教务系统接入］接入浙江工业大学原创教务系统。<br>［成绩查询］可查询成绩信息<br>［课程查询］可查询课程信息<br>［排考查询］排考查询
                    </p>
                </div>
            </div>

            <div class="wow fadeInUp col-md-3 col-sm-3" data-wow-delay="0.6s">
                <img src="/images/first.png" class="img-responsive" alt="Overview">
            </div>
            <div class="wow fadeInUp col-md-3 col-sm-3" data-wow-delay="0.9s">
                <p>趣旅行<a
                        href="https://itunes.apple.com/cn/app/qu-lu-xing-lai-yi-chang-shuo/id1118727821?mt=8">点击进入商店</a>
                </p>
                <div>
                    <h4>
                        内容提要
                    </h4>
                    <p itemprop="description">1.0版本<br>－支持社交功能<br>－支持活动报名</p>
                </div>
            </div>
            <div class="wow fadeInUp col-md-3 col-sm-3" data-wow-delay="1.2s">
                <img src="/images/second.png" class="img-responsive" alt="Overview">
            </div>
        </div>
    </div>
</section>


<%--歌词--%>
<section id="detail" class="parallax-section">
    <div class="container">
        <div class="row">

            <div class="wow fadeInLeft col-md-12 col-sm-12" data-wow-delay="0.3s">
                <h3>如风的少年</h3>
                <p>你飞到城市另一边
                    <br/>你飞了好远好远
                    <br/> 飞过了蓝色的海岸线
                    <br/> 飞过了我们的昨天
                    <br/> 你啊你，是自在如风的少年
                    <br/> 飞在天地间，比梦还遥远
                    <br/> 你啊你，飞过了流转的时间
                    <br/> 归来的时候，是否还有青春的容颜
                </p>
            </div>


        </div>
    </div>
</section>

<%--短途游--%>
<section id="service" class="parallax-section">
    <div class="container">
        <div class="row">

            <div class="wow fadeInUp col-md-6 col-sm-10" data-wow-delay="1.3s">
                <h2>作品介绍——短途游App</h2>
                <h3>本项目则是针对发包商拓峰科技设计制作的一款适合短途游的互动app及其后台管理系统，可以为广大城市精英人士提供自行组织以及跟团旅游等短途游出行方式。</h3>
                <p>
                    我们团队由五位个性开朗、沟通密切、有很强的创造力和责任心的成员组成。项目经理能较好地发挥其作用，协调按时完成各个阶段的任务，确保本项目能按既定计划保质保量的顺利完成。而我们的团队成员之间也有良好的默契感以及合作经验，都能本着为客户打造一款贴心便捷的软件的原则，积极参与本次项目的设计开发。</p>
            </div>
            <div class="wow fadeInUp col-md-6 col-sm-10" data-wow-delay="1.6s">
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="http://player.youku.com/embed/XMTMyMjY4NDA1Mg=="
                            frameborder=0 allowfullscreen></iframe>
                </div>
            </div>

        </div>
    </div>
</section>

<!--推荐站点-->
<section id="speakers" class="parallax-section">
    <div class="container">
        <div class="row">

            <div class="col-md-12 col-sm-12 wow bounceIn">
                <div class="section-title">
                    <h2>推荐站点</h2>
                    <p>iOS开发者站点推荐</p>
                </div>
            </div>

            <!-- Testimonial Owl Carousel section
            ================================================== -->
            <div id="owl-speakers" class="owl-carousel">

                <div class="item wow fadeInUp col-md-3 col-sm-3" data-wow-delay="0.2s">
                    <a href="https://itunesconnect.apple.com">
                        <div class="speakers-wrapper">
                            <img src="/images/apple.jpg" class="img-responsive"
                                 alt="speakers">
                            <div class="speakers-thumb">
                                <h3>iTunes connect</h3>
                                <h6>苹果应用商店</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="item wow fadeInUp col-md-3 col-sm-3" data-wow-delay="0.4s">
                    <a href="http://www.cocoachina.com">
                        <div class="speakers-wrapper">
                            <img src="/images/cocoa.jpg" class="img-responsive"
                                 alt="speakers">
                            <div class="speakers-thumb">
                                <h3>CocoaChina</h3>
                                <h6>苹果开发中文社区</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="item wow fadeInUp col-md-3 col-sm-3" data-wow-delay="0.6s">
                    <a href="http://stackoverflow.com/">
                        <div class="speakers-wrapper">
                            <img src="/images/stack.jpg" class="img-responsive"
                                 alt="speakers">
                            <div class="speakers-thumb">
                                <h3>Stackoverflow</h3>
                                <h6>问答社区</h6>
                            </div>
                        </div>
                    </a>
                </div>

            </div>

        </div>
    </div>
</section>

<!--Footer-->
<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <p class="wow fadeInUp" data-wow-delay="0.3s">Copyright &copy; 2013-2015 如风的少年|Likewind</p>
                <p class="wow fadeInUp" data-wow-delay="0.6s"><a href="http://www.miitbeian.gov.cn/">浙ICP备15042581号</a>️
                </p>
                <ul class="social-icon">
                    <li><a href="https://www.facebook.com/dwight.ding.3" class="fa fa-facebook wow fadeInUp"
                           data-wow-delay="1s"></a></li>
                    <li><a href="https://twitter.com/DingDwight" class="fa fa-twitter wow fadeInUp"
                           data-wow-delay="1.3s"></a></li>
                    <li><a href="https://weibo.com/DingDwight" class="fa fa-weibo wow fadeInUp"
                           data-wow-delay="1.6s"></a></li>
                    <li><a href="https://plus.google.com/u/0/106156589700188614389"
                           class="fa fa-google-plus wow fadeInUp" data-wow-delay="2s"></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>


<!-- Back top -->
<a href="#back-top" class="go-top"><i class="fa fa-angle-up"></i></a>


<!-- =========================
     SCRIPTS
============================== -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.parallax.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>