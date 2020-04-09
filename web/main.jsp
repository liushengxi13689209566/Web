<%--
  Created by IntelliJ IDEA.
  User: tattoo
  Date: 2020/3/27
  Time: 2:47 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <!--//{pageContext.request.contextPath}作用是取出部署应用程序的名字-->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>实验课考勤管理系统</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/bootstrap-table.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/mainPage.css">
</head>

<!-- 导航栏 -->
<div id="navBar">
    <!-- 此处加载顶部导航栏 -->
    <!-- 导航栏 -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <!-- 导航栏标题 -->
            <div class="navbar-header">
                <a href="javascript:void(0)" class="navbar-brand home">实验课考勤管理系统</a>
            </div>

            <!-- 导航栏下拉菜单：注销登陆 -->
            <div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle"
                           data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>
                            <span>欢迎&nbsp;</span> <span id="nav_userName">用户名:${sessionScope.userName}</span>
                            <!--小三角-->
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <%--                            <!-通过 session 获取的 name 的值-->--%>
                            <%--                            <shiro:hasRole name="commonsAdmin">--%>
                            <%--                                <li>--%>
                            <%--                                    <a href="#" id="editInfo"> <span--%>
                            <%--                                            class="glyphicon glyphicon-pencil"></span> &nbsp;&nbsp;修改个人信息</a></li>--%>
                            <%--                            </shiro:hasRole>--%>
                            <li>
                                <a href="javascript:void(0)" id="signOut"> <span
                                        class="glyphicon glyphicon-off"></span> &nbsp;&nbsp;注销登录
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="container-fluid" style="padding-left: 0px;">
    <div class="row">
        <!-- 左侧导航栏 -->
        <div id="sideBar" class="col-md-2 col-sm-3">
            <!--  此处加载左侧导航栏 -->
            <!-- 左侧导航栏  -->
            <!-- 依照 accordion 为 parent -->
            <div class="panel-group" id="accordion">
                <%--1。个人信息管理--%>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <!--<a> 链接至 class 为 collapse1 的 div，即库存管理与出入库管理-->
                            <a href="#collapse1" data-toggle="collapse" data-parent="#accordion"
                            <%--class="parentMenuTitle collapseHead">库存管理</a>--%>
                            <%--                                    个人信息管理每一种身份都需要--%>
                               class="parentMenuTitle collapseHead">个人信息管理</a>
                            <div class="pull-right">
                                <span class="caret"></span>
                            </div>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse collapseBody">
                        <div class="panel-body">
                            <ul class="list-group">
                                <!--若为普通管理员-->
                                <%--                                <shiro:hasRole name="commonsAdmin">--%>
                                <li class="list-group-item">
                                    <a href="javascript:void(0)" id="" class="menu_item"
                                       name="pagecomponent/storageManagementCommon.jsp">修改密码</a>
                                </li>
                                <%--                                </shiro:hasRole>--%>
                                <!--若为超级管理员-->
                                <%--                                <shiro:hasRole name="systemAdmin">--%>
                                <li class="list-group-item">
                                    <a href="javascript:void(0)" class="menu_item"
                                       name="pagecomponent/storageManagement.jsp">更新人脸照片</a>
                                </li>
                                <%-- <li class="list-group-item">--%>
                                <%-- <a href="javascript:void(0)" id=""--%>
                                <%--class="menu_item"--%>
                                <%-- name="pagecomponent/stockRecordManagement.html">出入库记录</a>--%>
                                </li>
                                <%--                                </shiro:hasRole>--%>
                            </ul>
                        </div>
                    </div>
                </div>

                <%--2。实验课考勤信息管理功能--%>
                <shiro:hasAnyRoles name="student,teacher">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="#collapse2" data-toggle="collapse" data-parent="#accordion"
                                   class="parentMenuTitle collapseHead">实验课考勤信息管理</a>
                                <div class="pull-right">
                                    <span class="caret"></span>
                                </div>
                            </h4>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse collapseBody in">
                            <div class="panel-body">
                                <shiro:hasRole name="student">
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                            <a href="javascript:void(0)" class="menu_item"
                                                <%--name="pagecomponent/stock-inManagement.jsp">实验课考勤信息查看</a>--%>
                                               name="pagecomponent/student-sign-case.jsp">实验课考勤信息查看</a>
                                        </li>

                                        <li class="list-group-item">
                                            <a href="javascript:void(0)" class="menu_item"
                                                <%--name="pagecomponent/stock-inManagement.jsp">实验课考勤信息查看</a>--%>
                                               name="pagecomponent/test.jsp">测试考勤数据</a>
                                        </li>

                                    </ul>
                                </shiro:hasRole>
                                <shiro:hasRole name="teacher">
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                            <a href="javascript:void(0)" class="menu_item"
                                                <%-- name="pagecomponent/stock-outManagement.jsp">实验课考勤信息查看</a>--%>
                                               name="pagecomponent/course-sign-case.jsp">实验课考勤信息查看</a>
                                        </li>
                                    </ul>
                                </shiro:hasRole>
                            </div>
                        </div>
                    </div>
                </shiro:hasAnyRoles>


                <%--3。课程信息管理功能--%>
                <shiro:hasAnyRoles name="teacher,admin">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="#collapse3" data-toggle="collapse" data-parent="#accordion"
                                   class="parentMenuTitle collapseHead">课程信息管理</a>
                                <div class="pull-right">
                                    <span class="caret"></span>
                                </div>
                            </h4>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse collapseBody">
                            <div class="panel-body">
                                <ul class="list-group">
                                    <!--若为普通管理员-->
                                    <shiro:hasRole name="teacher">
                                        <li class="list-group-item">
                                            <a href="javascript:void(0)" class="menu_item"
                                               name="pagecomponent/courseHandle.jsp">课程信息查看</a>
                                        </li>
                                    </shiro:hasRole>
                                    <!--若为超级管理员-->
                                        <%--                                <shiro:hasRole name="systemAdmin">--%>
                                        <%--                                    <li class="list-group-item">--%>
                                        <%--                                        <a href="javascript:void(0)" class="menu_item"--%>
                                        <%--                                           name="pagecomponent/storageManagement.jsp">更新人脸照片</a>--%>
                                        <%--                                    </li>--%>
                                        <%-- <li class="list-group-item">--%>
                                        <%-- <a href="javascript:void(0)" id=""--%>
                                        <%--class="menu_item"--%>
                                        <%-- name="pagecomponent/stockRecordManagement.html">出入库记录</a>--%>
                                        <%--</li>--%>
                                        <%--</shiro:hasRole>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </shiro:hasAnyRoles>


            </div>
        </div>

        <!-- 面板区域 -->
        <div id="panel" class="col-md-10 col-sm-9">
            <!--  此处异步加载各个面板 -->

            <!-- 欢迎界面 -->
            <div class="panel panel-default">
                <!-- 面包屑 -->
                <ol class="breadcrumb">
                    <li>主页</li>
                </ol>
                <div class="panel-body">
                    <div class="row" style="margin-top: 100px; margin-bottom: 100px">
                        <div class="col-md-1"></div>
                        <div class="col-md-10" style="text-align: center">
                            <div class="col-md-4 col-sm-4">
                                <a href="javascript:void(0)" class="thumbnail shortcut"> <img
                                        src="media/icons/stock_search-512.png" alt="考勤信息查看"
                                        class="img-rounded link" style="width: 150px; height: 150px;">
                                    <div class="caption">
                                        <h3 class="title">考勤信息查看</h3>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </div>
            </div>
            <!-- end -->
        </div>
    </div>
</div>

<span id="requestPrefix" class="hide">${sessionScope.requestPrefix}</span>

<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/bootstrap-table.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/jquery.md5.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/mainPage.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
</body>
</html>