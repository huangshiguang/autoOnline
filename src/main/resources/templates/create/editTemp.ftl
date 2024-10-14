<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="renderer" content="webkit"/>
<title>编辑</title>

<link href="${'$'}{base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${'$'}{base}/resources/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${'$'}{base}/resources/admin/css/animate.css" rel="stylesheet">
<link href="${'$'}{base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">

<script type="text/javascript" src="${'$'}{base}/resources/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${'$'}{base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${'$'}{base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${'$'}{base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${'$'}{base}/resources/admin/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${'$'}{base}/resources/admin/js/plugins/layer/laydate/laydate.js"></script>

<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	// 表单验证
	$inputForm.validate({
		rules: {
			<#list params as param>
		   	${param.name}: {
		   		<#if param.isNullable == false >
		   		required: true,
		   		</#if>
		   		<#if param.type == "Integer" || param.type == "Long">
		   		digits:true,
				<#elseif param.type == "Double" || param.type == "BigDecimal">
				number:true,
				</#if>
	   		},
		  	</#list>
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
	                    <a href="${'$'}{base}/admin/common/index">首页</a>
	                </li>
	                <li class="active">编辑${memo}</li>
	            </ol>
			</div>
			
			<div class="ibox-content">
				<form id="inputForm" action="${'$'}{base}/admin/${objectNameLower}/update" method="post" class="form-horizontal">
					<input type="hidden" name="id" value="${'$'}{${objectNameLower}.id}" />
					
					<#list params as param>
					<#if param_index%2 == 0>
					<div class="form-group">
						
						<label class="col-sm-1 control-label">${param.memo}:</label>
						<div class="col-sm-5">
							<input type="text" id="<#if param.type == "Date">${param.name}</#if>"  name="${param.name}" class="text" maxlength="100" value="${'$'}{${objectNameLower}.${param.name}}" />
						</div>
						<#if !param_has_next>
					</div>
						</#if>
					</#if>
					<#if param_index%2 == 1>
						
						<label class="col-sm-1 control-label">${param.memo}:</label>
						<div class="col-sm-5">
							<input type="text" id="<#if param.type == "Date">${param.name}</#if>" name="${param.name}" class="text" maxlength="100" value="<#if param.type == "Date">${'$'}{(${objectNameLower}.${param.name}?string('yyyy-MM-dd hh:mm:ss'))!}<#else>${'$'}{${objectNameLower}.${param.name}}</#if>" />
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					</#if>
					
					</#list>
					
					<div class="form-group actions">
						<label class="col-sm-1 control-label"></label>
						<div class="col-sm-11">
							<input type="submit" class="btn btn-primary" value="确&nbsp;&nbsp;定" />
							<a class="btn btn-white" href="${'$'}{base}/admin/${objectNameLower}/list">返&nbsp;&nbsp;回</a>
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
	<#list params as param>
	<#if param.type == "Date">
		laydate({
		  elem: '#${param.name}', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
		  format: 'YYYY-MM-DD hh:mm:ss', // 日期格式
		  event: 'focus', //响应事件。如果没有传入event，则按照默认的click
		  istime: true,   // 是否开启时间选择
		  min:laydate.now(),
		});
	</#if>
	</#list>
		
	</script>
</body>
</html>