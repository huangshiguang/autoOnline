<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="renderer" content="webkit"/>
<title>添加</title>

<link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${base}/resources/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
<link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">

<script type="text/javascript" src="${base}/resources/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/laydate/laydate.js"></script>

<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	// 表单验证
	$inputForm.validate({
		rules: {
		   	name: {
		   		required: true,
	   		},
		   	username: {
		   		required: true,
	   		},
		   	password: {
		   		required: true,
	   		},
		   	date: {
	   		},
			
		},
	});
	
});
</script>
</head>
<body class="gray-bg">

	<div class="wrapper wrapper-content animated fadeInRight">	
		<div class="ibox">
			<!--面包屑-->
			<div class="ibox-title">
				<ol class="breadcrumb">
	                <li>
	                    <a href="${base}/admin/common/index">首页</a>
	                </li>
	                <li class="active">添加管理员</li>
	            </ol>
			</div>
			
			<div class="ibox-content">
				<form id="inputForm" action="${base}/admin/admin/save" method="post" class="form-horizontal">
					
					<div class="form-group">
						
						<label class="col-sm-1 control-label">姓名:</label>
						<div class="col-sm-5">
							<input type="text" id="" name="name" class="text" maxlength="100"  />
						</div>
					
						
						<label class="col-sm-1 control-label">用户名:</label>
						<div class="col-sm-5">
							<input type="text" id="" name="username" class="text" maxlength="100"  />
						</div>
						
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						
						<label class="col-sm-1 control-label">密码:</label>
						<div class="col-sm-5">
							<input type="text" id="" name="password" class="text" maxlength="100"  />
						</div>
					
						
						<label class="col-sm-1 control-label">时间:</label>
						<div class="col-sm-5">
							<input type="text" id="date" name="date" class="text" maxlength="100"  />
						</div>
						
					</div>
					<div class="hr-line-dashed"></div>
					
					
					<div class="form-group actions">
						<label class="col-sm-1 control-label"></label>
						<div class="col-sm-11">
							<input type="submit" class="btn btn-primary" value="确&nbsp;&nbsp;定" />
							<a class="btn btn-white" href="${base}/admin/admin/list">返&nbsp;&nbsp;回</a>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
				</form>
			</div>
			<!--ibox content end-->
		</div>
		<!--ibox end-->
	</div>
	
	
	
	<script>
		laydate({
		  elem: '#date', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
		  format: 'YYYY-MM-DD hh:mm:ss', // 日期格式
		  event: 'focus', //响应事件。如果没有传入event，则按照默认的click
		  istime: true,   // 是否开启时间选择
		  min:laydate.now(),
		});
		
	</script>
</body>
</html>