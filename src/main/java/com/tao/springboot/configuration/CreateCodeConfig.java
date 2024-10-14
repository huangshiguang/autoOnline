package com.tao.springboot.configuration;

/**
 * @Author: JiantaoYan
 * @Description:
 * @Date: 22:32 2018/11/15
 */
public final class CreateCodeConfig {

    //数据库名
    public static final String DATA_BASE_NAME = "test";

    public static final String AUTHOR = "yanjiantao";

    //项目在硬盘上的地址
    public static final String PROJECT_PATH = System.getProperty("user.dir");
    public static final String TEMPLATE_FILE_PATH = PROJECT_PATH +  System.getProperty("user.dir");

    //生成代码所在的基础包名称，可根据自己公司的项目修改（注意：这个配置修改之后需要手工修改src目录项目默认的包路径，使其保持一致，不然会找不到类）
    public static final String BASE_PACKAGE = "com.tao.springboot";

    public static final String MODEL_PACKAGE = BASE_PACKAGE + ".model";//生成的Model所在包
    public static final String MAPPER_PACKAGE = BASE_PACKAGE + ".dao";//生成的Mapper所在包
    public static final String SERVICE_PACKAGE = BASE_PACKAGE + ".service";//生成的Service所在包
    public static final String SERVICE_IMPL_PACKAGE = SERVICE_PACKAGE + ".impl";//生成的ServiceImpl所在包
    public static final String CONTROLLER_PACKAGE = BASE_PACKAGE + ".controller";//生成的Controller所在包
    public static final String DAO_PACKAGE = BASE_PACKAGE + ".dao";//生成的Controller所在包
    public static final String DAO_IMPL_PACKAGE = DAO_PACKAGE + ".impl";//生成的Controller所在包
    public static final String ENTITY_PACKAGE = BASE_PACKAGE + ".entity";//生成的Entity所在包


    public static final String MAPPER_INTERFACE_REFERENCE = BASE_PACKAGE + ".core.Mapper";//Mapper插件基础接口的完全限定名

    //java文件路径
    public static final String JAVA_PATH = "/src/main/java";
    //资源文件路径
    public static final String RESOURCES_PATH = "/src/main/resources";
    public static final String PACKAGE_PATH_SERVICE = packageConvertPath(SERVICE_PACKAGE);//生成的Service存放路径
    public static final String PACKAGE_PATH_SERVICE_IMPL = packageConvertPath(SERVICE_IMPL_PACKAGE);//生成的Service实现存放路径
    public static final String PACKAGE_PATH_CONTROLLER = packageConvertPath(CONTROLLER_PACKAGE);//生成的Controller存放路径
    public static final String PACKAGE_PATH_DAO = packageConvertPath(DAO_PACKAGE);
    public static final String PACKAGE_PATH_DAO_IMPL = packageConvertPath(DAO_IMPL_PACKAGE);
    public static final String PACKAGE_PATH_ENTITY = packageConvertPath(ENTITY_PACKAGE);

    public static final String CONTROLLER_PATH = PROJECT_PATH + JAVA_PATH + PACKAGE_PATH_CONTROLLER;








    private static String packageConvertPath(String packageName) {
        return String.format("/%s/", packageName.contains(".") ? packageName.replaceAll("\\.", "/") : packageName);
    }
}
