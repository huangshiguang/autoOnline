<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>spring-boot脚手架</title>

    <meta name="keywords" content="Flashbike,flashbike,Flash bike,flash bike,闪骑">
  
    <!--[if lt IE 9]>
    	<meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${base}/resources/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
    <link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">
    
    <style>
    	#side-menu .loading{
    		display:none;
    	}
    </style>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="${base}/resources/admin/img/a1.jpg" width="75" height="75"/></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">用户名</strong></span>
                                <span class="text-muted text-xs block">姓名<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                </li>
                                <li><a class="J_menuItem" href="${base}/admin/profile/edit">个人资料</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="logout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">Flash
                        </div>
                    </li>
                    <li class="loading">
                        <a href="#">
                            <i class="fa fa-file"></i>
                            <span class="nav-label">一级菜单</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        		<li><a class="J_menuItem" href="#">二级菜单</a></li>
                            <li><a class="J_menuItem" href="#">二级菜单</a></li>
                        </ul>

                    </li>
                    <li class="loading">
                        <a href="#">
                            <i class="glyphicon glyphicon-th-large"></i>
                            <span class="nav-label">一级菜单</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="#">二级菜单</a></li>
                            <li><a class="J_menuItem" href="#">二级菜单</a></li>
                        </ul>
                    </li>

                    <li class="loading">

                        <a href="#">
                            <i class="glyphicon glyphicon-user"></i>
                            <span class="nav-label">生成代码</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="${base}/admin/admin/list" data-index="0">管理员</a></li>
                            <li><a class="J_menuItem" href="${base}/create">基础代码生成</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${base}/admin/welcome" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2016-2017 Flashike
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->

        <!--右侧边栏结束-->
    </div>

    <!-- 全局js -->
    <script src="${base}/resources/admin/js/jquery.min.js?v=2.1.4"></script>
    <script src="${base}/resources/admin/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${base}/resources/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${base}/resources/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${base}/resources/admin/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${base}/resources/admin/js/hplus.js?v=4.1.0"></script>
    <script type="text/javascript" src="${base}/resources/admin/js/contabs.js"></script>

    <!-- 第三方插件 -->
    <script src="${base}/resources/admin/js/plugins/pace/pace.min.js"></script>
    <script>
	    $(".J_menuItem").click(function(){
			$(".J_iframe").each(function(){
				if($(this).css("display")=="inline"){
				   $(this).attr('src', $(this).attr('src'));
				}
			});
	    });
	    
	    $(".nav-second-level").each(function(){
	    	var i = $(this).children().size();
	    	if(i == 0){
	    		$(this).parent().remove();
	    	}
		});
		
		$("#side-menu .loading").fadeIn(1000,function(){
			$(this).removeClass("loading");
		});
    </script>

</body>

</html>
