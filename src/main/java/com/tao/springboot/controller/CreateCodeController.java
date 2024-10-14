package com.tao.springboot.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.tao.springboot.configuration.CreateCodeConfig;
import com.tao.springboot.entity.CreateCodeVo;
import com.tao.springboot.entity.CreateItem;
import com.tao.springboot.service.CreateCodeService;
import com.tao.springboot.utils.CamelNameMethod;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static com.tao.springboot.configuration.CreateCodeConfig.*;

@Controller("adminCreateCodeController")
public class CreateCodeController {
	
	@Resource(name = "createCodeServiceImpl")
	private CreateCodeService createCodeService;

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create() throws Exception {
		return "/createCode/add";
	}

	@RequestMapping(value = "/column", method = RequestMethod.POST)
	public Object findColumn(ModelMap model, String findTableName) throws Exception {
		Map<String,Object> parameter = new HashMap<>();
		parameter.put("tableName", findTableName);
		parameter.put("databaseName", CreateCodeConfig.DATA_BASE_NAME);
		List<CreateItem> createItems = createCodeService.findColum(parameter);
		List<CreateItem> result = new ArrayList<>();
		for(int i=0; i<createItems.size();i++) {
			if("id".equals(createItems.get(i).getJavaName()) || "createDate".equals(createItems.get(i).getJavaName())
					|| "modifyDate".equals(createItems.get(i).getJavaName()) || "orders".equals(createItems.get(i).getJavaName())) {
				continue;
			}else {
				result.add(createItems.get(i));
			}
		}
		model.addAttribute("createItems", result);
		return "/createCode/add";
	}


	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public static Object save(String entityName, String tableName, String memo, String strCreateItems) throws Exception {
		
		Gson gson = new Gson();
		List<CreateItem> createItems = gson.fromJson(strCreateItems, new TypeToken<List<CreateItem>>(){}.getType());
		CreateCodeVo vo = new CreateCodeVo();
		vo.setEntityName(entityName);
		vo.setTableName(tableName);
		vo.setCreateItems(createItems);
		
		// java类名首字母大写
		String objectName = entityName.substring(0, 1).toUpperCase() + entityName.substring(1);
		// 首字母小写
		String objectNameLower = entityName.substring(0, 1).toLowerCase() + entityName.substring(1);

		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		Map<String, Object> root = new HashMap<String, Object>();
		root.put("memo", memo);
		root.put("objectName", objectName);
		root.put("objectNameLower", objectNameLower);
		root.put("tableName", tableName);
		root.put("BASE_PACKAGE",BASE_PACKAGE);
		root.put("DATE", df.format(LocalDateTime.now()));
		root.put("AUTHOR", AUTHOR);



		root.put("params", vo.getCreateItems());
		// 将下划线大写方式命名的字符串转换为驼峰式
		root.put("camelName", new CamelNameMethod());

		/* 生成实体 */
		printJavaFile("entityTemp.ftl", root, objectName + ".java", PACKAGE_PATH_ENTITY);

		/* 生成controller */
		printJavaFile("controllerTemp.ftl", root, objectName + "Controller.java", PACKAGE_PATH_CONTROLLER);

		/* 生成service */
		printJavaFile("serviceTemp.ftl", root, objectName + "Service.java", PACKAGE_PATH_SERVICE);
		printJavaFile("serviceImplTemp.ftl", root, objectName + "ServiceImpl.java", PACKAGE_PATH_SERVICE_IMPL);

		/* 生成dao */
		printJavaFile("daoTemp.ftl", root, objectName + "Dao.java", PACKAGE_PATH_DAO);
		printJavaFile("daoImplTemp.ftl", root, objectName + "DaoImpl.java", PACKAGE_PATH_DAO_IMPL);

		/* 生成mybatis xml */
		printResourceFile("mapper.ftl", root, objectName + "Mapper.xml", "/mybatis/");

		/* 生成SQL脚本 */
		printResourceFile("sqlTemp.ftl", root, objectName + ".sql", "/");

		/* 生成ftl页面 */
		printResourceFile("viewTemp.ftl", root, "view.ftl", "/templates/admin/" + objectNameLower + "/");
		printResourceFile("addTemp.ftl", root, "add.ftl", "/templates/admin/" + objectNameLower + "/");
		printResourceFile("editTemp.ftl", root, "edit.ftl", "/templates/admin/" + objectNameLower + "/");
		printResourceFile("listTemp.ftl", root, "list.ftl", "/templates/admin/" + objectNameLower + "/");

//		Map<String,Object> result=new HashMap<>();
//		result.put("result", "ok");
		return "{\"result\":\"ok\"}";
	}

	public static void printJavaFile(String ftlName, Map<String, Object> root, String outFile, String filePath)
			throws Exception {
		try {
			File file = new File(PROJECT_PATH + JAVA_PATH + filePath + outFile);
			if (!file.getParentFile().exists()) { // 判断有没有父路径，就是判断文件整个路径是否存在
				file.getParentFile().mkdirs(); // 不存在就全部创建
			}
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"));
			Template template = getTemplate(ftlName);
			template.process(root, out); // 模版输出
			out.flush();
			out.close();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void printResourceFile(String ftlName, Map<String, Object> root, String outFile, String filePath)
			throws Exception {
		try {
			File file = new File(PROJECT_PATH + RESOURCES_PATH + filePath + outFile);
			if (!file.getParentFile().exists()) { // 判断有没有父路径，就是判断文件整个路径是否存在
				file.getParentFile().mkdirs(); // 不存在就全部创建
			}
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"));
			Template template = getTemplate(ftlName);
			template.process(root, out); // 模版输出
			out.flush();
			out.close();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 通过文件名加载模版
	 * 
	 * @param ftlName
	 */
	public static Template getTemplate(String ftlName) throws Exception {
		try {
			File file = ResourceUtils.getFile("classpath:application.yml");
			Configuration cfg = new Configuration(); // 通过Freemaker的Configuration读取相应的ftl
			cfg.setEncoding(Locale.CHINA, "utf-8");
			cfg.setDirectoryForTemplateLoading(new File(file.getParent() + "\\templates\\create")); // 设定去哪里读取相应的ftl模板文件
			Template temp = cfg.getTemplate(ftlName); // 在模板文件目录中找到名称为name的文件
			return temp;
		} catch (IOException e) {
			e.printStackTrace();                                                                                                                                                                                                                                                                                                                                                                                
		}
		return null;
	}
	

}
