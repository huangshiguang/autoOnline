<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="renderer" content="webkit"/>
<title>创建代码</title>

<link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${base}/resources/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
<link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">

<script type="text/javascript" src="${base}/resources/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/layer.min.js"></script>

</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">

	<div class="ibox">
		<!-- 面包屑 -->
		<div class="ibox-title">
			<div class="path">
			财务管理
				 &raquo;支出列表
			</div>
		</div>

		<!-- 表单 -->
		<div class="ibox-content">
			<form id="listForm" action="${base}/column" method="post">
				<div class="row">
					<div class="col-sm-5 m-b-xs">
						<!--<a id="findColumButton" class="btn btn-outline btn-primary" onclick="findColum()"><i class="fa fa-trash-o"></i>&nbsp读取数据表</a>-->
						<input type="text" id="findTableName" name="findTableName" class="text" maxlength="20" placeholder="请输入数据库表名" />
						<input type="submit" class="btn btn-outline btn-primary" value="&nbsp读取数据表" />
						<!--<a id="refreshButton" class="btn btn-outline btn-warning" ><i class="fa fa-refresh"></i>&nbsp;导出Json</a>
						<a id="refreshButton" class="btn btn-outline btn-warning" ><i class="fa fa-refresh"></i>&nbsp;导入Json</a>-->
					</div>
					<!--以上左侧按钮-->
	                <div class="col-sm-1 m-b-xs">
	                </div>
	                <!--以上中部-->
	                <div class="col-sm-6 text-right">
						<input type="text" name="entityName" class="text" maxlength="20" placeholder="请输入Java类名(首字母大写)" />
						<input type="text" id="tableName" name="tableName" class="text" maxlength="20" placeholder="请输入DataBase表名(大写)" />
						<input type="text" name="memo" class="text" maxlength="20" placeholder="请输入Java类名称" />
						<a class="btn btn-success btn-outline" onclick="createCode()">
                            <i class="fa fa-qq"> </i> 生成代码
                        </a>
					</div>
					<!--以上右侧搜索框-->
				</div>


				<br/>
				<div class="table-responsive">
					<table id="listTable" class="table table-bordered table-striped table-hover">
						<tr>
							<th width="20%">Java属性名</th>
							<th width="20%">Java属性类型</th>
							<th width="20%">DataBase列名</th>
							<th width="20%">备注</th>
							<th width="5%">允许为空</th>
							<th width="15%">操作</th>
						</tr>

						<#if createItems?exists>

							<#list createItems as item>
							<tr>
								<td><input type="text" placeholder="Java属性类名" class="javaAttr form-control input-lg m-b" value = "${item.javaName}" onchange="javaAtrrChange(this)"></td>
								<td>
									<select class="javaType form-control input-lg m-b" onChange="javaTypeChange(this)">
										<option value="String" <#if item.javaType == 'String'> selected="selected"  </#if> >String</option>
										<option value="Integer" <#if item.javaType == 'Integer'> selected="selected"  </#if> >Integer</option>
										<option value="Long" <#if item.javaType == 'Long'> selected="selected"  </#if> >Long</option>
										<option value="Double" <#if item.javaType == 'Double'> selected="selected"  </#if> >Double</option>
										<option value="Boolean" <#if item.javaType == 'Boolean'> selected="selected"  </#if> >Boolean</option>
										<option value="Date" <#if item.javaType == 'Date'> selected="selected"  </#if> >Date</option>
										<option value="BigDecimal" <#if item.javaType == 'BigDecimal'> selected="selected"  </#if> >BigDecimal</option>
										<option value="enum" >enum</option>
									</seclet>
								</td>
								<td><input type="text" placeholder="DataBase列名" value="${item.columnName}" class="columnName form-control input-lg m-b"></td>
								<td><input type="text" placeholder="备注"  value="${item.memo}" class="memo form-control input-lg m-b"></td>
								<td>
									<input type="checkbox" <#if item.isNullable == true> checked=true  </#if> class="isNull form-control input-lg m-b">
								</td>
								<td>
									<a href="javascript:;" class="btn btn-outline btn-primary" onclick="addTr(this)"><i class="fa fa-plus"></i>&nbsp;添加</a>
									<a href="javascript:;" class="btn btn-outline btn-danger" onclick="deleteTr(this)"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
								</td>
							</tr>
							</#list>
						<#else>
						<tr>
							<td><input type="text" placeholder="Java属性类名" class="javaAttr form-control input-lg m-b" onchange="javaAtrrChange(this)"></td>
							<td>
								<select class="javaType form-control input-lg m-b" onChange="javaTypeChange(this)">
									<option value="String">String</option>
									<option value="Integer">Integer</option>
									<option value="Long">Long</option>
									<option value="Double">Double</option>
									<option value="Boolean">Boolean</option>
									<option value="Date">Date</option>
									<option value="BigDecimal">BigDecimal</option>
									<option value="enum">enum</option>
								</seclet>
							</td>
							<td><input type="text" placeholder="DataBase列名" class="columnName form-control input-lg m-b"></td>
							<td><input type="text" placeholder="备注" class="memo form-control input-lg m-b"></td>
							<td>
								<input type="checkbox" class="isNull form-control input-lg m-b">
							</td>
							<td>
								<a href="javascript:;" class="btn btn-outline btn-primary" onclick="addTr(this)"><i class="fa fa-plus"></i>&nbsp;添加</a>
							</td>
						</tr>
						</#if>
					</table>
				</div>

			</form>
		</div>
		<!--ibox content end-->
	</div>
	<!--ibox end-->
</div>
</body>

<script>

	function addTr(btn){
		var tempTr = '<@compress single_line=true>
		<tr>
			<td><input type="text" placeholder="Java属性类名" class="javaAttr form-control input-lg m-b" onchange="javaAtrrChange(this)"></td>
			<td>
				<select class="javaType form-control input-lg m-b" onChange="javaTypeChange(this)">
					<option value="String">String</option>
					<option value="Integer">Integer</option>
					<option value="Long">Long</option>
					<option value="Double">Double</option>
					<option value="Boolean">Boolean</option>
					<option value="Date">Date</option>
					<option value="BigDecimal">BigDecimal</option>
					<option value="enum">enum</option>
				</seclet>
			</td>
			<td><input type="text" placeholder="DataBase列名" class="columnName form-control input-lg m-b"></td>
			<td><input type="text" placeholder="备注" class="memo form-control input-lg m-b"></td>
			<td>
				<input type="checkbox" class="isNull form-control input-lg m-b">
			</td>
			<td>
				<a href="javascript:;" class="btn btn-outline btn-primary" onclick="addTr(this)"><i class="fa fa-plus"></i>&nbsp;添加</a>
				<a href="javascript:;" class="btn btn-outline btn-danger" onclick="deleteTr(this)"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
			</td>
		</tr>
		</@compress>';
		$(btn).closest("tr").after(tempTr); 
	};
	
	function deleteTr(btn){
		$(btn).closest("tr").remove();
	}
	
	function javaAtrrChange(textBox){
		var value = $(textBox).val();
		var result = "";
		for(i = 0; i < value.length; i++){
		 	var c = value.charAt(i);
		 	if(isUpperCase(c)){
		 		result = result + "_" + c.toLowerCase();
		 	}else{
		 		result = result + c;
		 	}
		}
		$(textBox).closest("tr").find(".columnName").val(result);
	}
	
	function isUpperCase(ch){
	    return ch >= 'A' && ch <= 'Z'
	}
	
	function createCode(){
	
		layer.confirm(message("确认要生成代码吗？"), {
			btn: [message("admin.dialog.ok"),message("admin.dialog.cancel")],
		}, function(){
			var createItems = new Array();
			$("tr").each(function(){
				var $this = $(this);
				var createItem = {};
				createItem.name = $this.find(".javaAttr").val();
				createItem.type = $this.find(".javaType").val();
				createItem.columnName = $this.find(".columnName").val();
				createItem.memo = $this.find(".memo").val();
				if($this.find(".isNull").is(':checked')){
					createItem.isNullable = true;
				}else{
					createItem.isNullable = false;
				}
				if(createItem.name){
					createItems.push(createItem);
				}
			});
			var entityName = $("input[name='entityName']").val();
			var tableName = $("input[name='tableName']").val();
			var memo = $("input[name='memo']").val();
			
			var params = new Object();
			params.entityName = entityName;
			params.tableName = tableName;
			params.createItems = createItems;
			
			var load=null;
			$.ajax({
				url:'${base}/save',
				type:'post',
				beforeSend:function(){
			        load = layer.load(2, {shade: false});
			    },
			    complete: function () {
			        layer.close(load);
			    },
				data: {entityName: entityName, tableName: tableName, memo: memo, strCreateItems : JSON.stringify(createItems)},
				dataType:'json',
				success:function(){
					layer.alert('代码生成成功！', {
					icon: 1,
					skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
					});
				},
				error:function(){
					layer.alert('代码生成失败！', {
					icon: 2,
					skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
					});
				},
			});
		},function(){
			//delete cancel
		});
	}

		

</script>


</html>