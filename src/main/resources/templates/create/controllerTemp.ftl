package ${BASE_PACKAGE}.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ${BASE_PACKAGE}.Message;
import ${BASE_PACKAGE}.Pageable;
import ${BASE_PACKAGE}.entity.${objectName};
import ${BASE_PACKAGE}.service.${objectName}Service;

/**
 * ${objectName}Controller-${memo}
 * @version: v1.0
 * @Description: ${memo}
 * @author: ${AUTHOR}
 * @date: ${DATE}
 */
@Controller("admin${objectName}Controller")
@RequestMapping("/admin/${objectNameLower}")
public class ${objectName}Controller extends BaseController {

	@Resource(name = "${objectNameLower}ServiceImpl")
	private ${objectName}Service ${objectNameLower}Service;
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) throws Exception {
		return "/admin/${objectNameLower}/add";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public Object save(ModelMap model,${objectName} ${objectNameLower}) throws Exception {
		${objectNameLower}.buildId();
		${objectNameLower}Service.save(${objectNameLower});
		return "redirect:list";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(ModelMap model,String id) throws Exception {
		${objectName} ${objectNameLower} = ${objectNameLower}Service.findById(id);
		model.addAttribute("${objectNameLower}", ${objectNameLower});
		return "/admin/${objectNameLower}/edit";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ModelMap model,${objectName} ${objectNameLower}) throws Exception {
		${objectNameLower}Service.update(${objectNameLower});
		return "redirect:list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap model,Pageable pageable) throws Exception {
		model.addAttribute("page", ${objectNameLower}Service.findPage(pageable));
		return "/admin/${objectNameLower}/list";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(ModelMap model,String id) throws Exception {
		${objectName} ${objectNameLower} = ${objectNameLower}Service.findById(id);
		model.addAttribute("${objectNameLower}", ${objectNameLower});
		return "/admin/${objectNameLower}/view";
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Message delete(String[] ids) throws Exception {
		int i = ${objectNameLower}Service.delete(ids);
		if(i > 0){
			return SUCCESS_MESSAGE;
		}else{
			return SUCCESS_MESSAGE;
		}
	}
		
}