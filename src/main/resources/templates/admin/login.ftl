<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>后台 - 登录</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${base}/resources/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
<link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">
<script src="${base}/resources/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="${base}/resources/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/layer.min.js"></script>

<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
</script>

<style>
	#captcha{
		display:inline-block;
	}
</style>
</head>

<body class="gray-bg">

	<div class="middle-box text-center loginscreen  animated fadeInDown">
		<div>
			<div>
			<h1 class="logo-name">
					<img src="${base}/resources/admin/img/waimai.png" width="75" height="75"/>
				</h1>
			</div>
			
			<br/>
			<h3>欢迎使用外卖点餐系统</h3>

			<form class="m-t" role="form" method="get" action="#">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="用户名" name="username" id="username" value="">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="密码" name="password" id="password" value="">
				</div>
				<div class="form-group">
					<input type="text" id="captcha" placeholder="验证码" name="captcha" class="text captcha" maxlength="4" autocomplete="off" />
					<img id="captchaImage" class="captchaImage" src="${base}/admin/captcha" title="请输入验证码" height="34" />
				</div>
				<a id="loginBtn" class="btn btn-primary block full-width m-b">登录</a>

			</form>
		</div>
	</div>

	<!-- 全局js -->

	
<script>
$(function(){

	var $username = $("#username");
	var $password = $("#password");
	var $loginBtn = $("#loginBtn");
	var $captcha = $("#captcha");
	var $captchaImage = $("#captchaImage");
	
	// 更换验证码
	$captchaImage.click( function() {
		$captchaImage.attr("src", "${base}/admin/captcha?timestamp=" + (new Date()).valueOf());
	});
	
	//用户名回车事件处理
	$username.keydown(function(e){
		var ev = document.all ? window.event : e;
	    if(ev.keyCode != 13) {
			return;
	    }
		if($password.val().length == 0){
			$password.focus();
		}else{
			//触发登录按钮
			$loginBtn.click();
		}
	});
	
	//密码回车事件处理
	$password.keydown(function(e){
		var ev = document.all ? window.event : e;
	    if(ev.keyCode != 13) {
			return;
	    }
		if($.trim($username.val()).length == 0){
			$username.focus();
		}else{
			//触发登录按钮
			$loginBtn.click();
		}
	});
	
	//登录按钮点击事件
	$loginBtn.click(function(){
		var username = $.trim($username.val());
		var password = $password.val();
		var captcha = $captcha.val();
		if(username.length == 0){
			$username.focus();
			return;
		}
		if(password.length == 0){
			$password.focus();
			return;
		}
		$.ajax({
			type: "POST",
			url: '${base}/admin/checkLogin',
	    	data: {
	    		username:username,
	    		password:password,
	    		captcha:captcha
	    	},
			dataType:'json',
			cache: false,
			success: function(data){		
				var content = data.content;
				var message = '';
				
				if (content == "org.apache.shiro.authc.pam.UnsupportedTokenException") {
					message = '验证码输入错误'
				} else if (content == "org.apache.shiro.authc.UnknownAccountException") {
					message = '此账号不存在';
				} else if (content == "org.apache.shiro.authc.DisabledAccountException") {
					message = '此账号已被禁用';
				} else if (content == "org.apache.shiro.authc.LockedAccountException") {
					message = '此账号已被锁定';
				} else if (content == "org.apache.shiro.authc.IncorrectCredentialsException") {
					message = '用户名或密码错误';
				} else if (content == "org.apache.shiro.authc.AuthenticationException") {
					message = '账号认证失败';
				}else{
					message = content;
				}
				
				if(message == null || message == '登录成功'){
					window.location.href = "${base}/admin/index"
				}else{
					layer.msg(message, {icon: 2});
					$captchaImage.click();
				}
			}
		});
	})
})
</script>

</body>

</html>
