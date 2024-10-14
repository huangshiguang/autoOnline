<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="renderer" content="webkit"/>
	<title>欢迎</title>

	<link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="${base}/resources/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
	<link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
	<link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">

	<script type="text/javascript" src="${base}/resources/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
	<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
	<script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/layer.min.js"></script>
	<script>
		//扩展的日期格式化
		Date.prototype.format = function(formatStr){   
		    var str = formatStr;   
		    var Week = ['日','一','二','三','四','五','六'];
		  
		    str=str.replace(/yyyy|YYYY/,this.getFullYear());   
		    str=str.replace(/yy|YY/,(this.getYear() % 100)>9?(this.getYear() % 100).toString():'0' + (this.getYear() % 100));   
		    
		    var month = this.getMonth()+1;
		    str=str.replace(/MM/,month>9?month+"":'0' + month);   
		    str=str.replace(/M/g,month);   
		  
		    str=str.replace(/w|W/g,Week[this.getDay()]);   
		  
		    str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());   
		    str=str.replace(/d|D/g,this.getDate());
		    
		    str=str.replace(/aa/,this.getHours()<12?"AM":"PM"); 
		    str=str.replace(/AA/,this.getHours()<12?"上午":"下午"); 
		  
		  	var hours = this.getHours();
		  	hours = hours > 12?hours-12:hours;
		    str=str.replace(/hh/,hours>9?hours.toString():'0' + hours);   
		    str=str.replace(/h/g,hours);
		    str=str.replace(/HH/,this.getHours()>9?this.getHours().toString():'0' + this.getHours());   
		    str=str.replace(/H/g,this.getHours());
		    str=str.replace(/mm/,this.getMinutes()>9?this.getMinutes().toString():'0' + this.getMinutes());
		    str=str.replace(/m/g,this.getMinutes());
		  
		    str=str.replace(/ss|SS/,this.getSeconds()>9?this.getSeconds().toString():'0' + this.getSeconds());   
		    str=str.replace(/s|S/g,this.getSeconds());   
		  
		    return str;   
		};
		
	</script>
</head>

<body class="gray-bg">
	
	<br/>
	
	<div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2 ng-if="isMain" class="ng-binding ng-scope">系统首页</h2>
        </div>
        <div class="col-lg-2 text-center">
        <h2 class="ng-binding fadeInRight" id="bjTime">----/--/-- --:--:--</h2>
        <script>
        	document.getElementById("bjTime").innerHTML = new Date().format('yyyy年MM月dd日 HH:mm:ss');
        	setInterval(function(){var time = new Date().format('yyyy年MM月dd日 HH:mm:ss');document.getElementById("bjTime").innerHTML = time;},1000);
        </script>
        </div>
    </div>
    
    <div ui-view="" class="ng-scope">
	    <div class="wrapper wrapper-content animated fadeInRight ng-scope">
		    <div class="row">
		        <div class="col-lg-12">
		            <div class="ibox float-e-margins">
		                <div class="ibox-content text-center p-md">
		                    <h2>
		                        <span class="text-navy ng-binding">&nbsp;</span> 欢迎你
		                    </h2>
		                    <p>This is welcome page.</p>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</body>
</html>