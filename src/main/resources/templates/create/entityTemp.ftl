package ${BASE_PACKAGE}.entity;

import org.apache.ibatis.type.Alias;
import java.math.BigDecimal;
import java.util.Date;

/**
 * ${objectName}-${memo}
 * @version: v1.0
 * @Description: ${memo}
 * @author: ${AUTHOR}
 * @date: ${DATE}
 */
@Alias("${objectName}")
public class ${objectName} extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	<#list params as param>
	/** ${param.memo} */
	private ${param.type} ${param.name};
	
	</#list>

    public void buildId() {
        this.id = "CR" + globalId.nextId();
    }
}
