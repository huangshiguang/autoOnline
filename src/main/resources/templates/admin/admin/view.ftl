<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="renderer" content="webkit"/>
<title>查看</title>

<link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${base}/resources/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
<link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">

<script type="text/javascript" src="${base}/resources/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>

<script type="text/javascript">
$().ready(function() {
	
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
	                <li class="active">查看管理员</li>
	            </ol>
			</div>
			
			<div class="ibox-content">
				<form id="inputForm" class="form-horizontal">
				
					<div class="form-group">
						
						<label class="col-sm-1 control-label">姓名:</label>
						<div class="col-sm-5">
					   		<p class="form-control-static">${admin.name}</p>
						</div>
					
						
						<label class="col-sm-1 control-label">用户名:</label>
						<div class="col-sm-5">
					   		<p class="form-control-static">${admin.username}</p>
						</div>
						
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						
						<label class="col-sm-1 control-label">密码:</label>
						<div class="col-sm-5">
					   		<p class="form-control-static">${admin.password}</p>
						</div>
					
						
						<label class="col-sm-1 control-label">时间:</label>
						<div class="col-sm-5">
							<p class="form-control-static">${(admin.date?string("yyyy-MM-dd hh:mm:ss"))!}</p>
						</div>
						
					</div>
					<div class="hr-line-dashed"></div>
					
					
					<div class="form-group actions">
						<label class="col-sm-1 control-label"></label>
						<div class="col-sm-11">
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
</body>
</html>