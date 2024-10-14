<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${objectName}Mapper">

	<resultMap id="BaseResultMap" type="${BASE_PACKAGE}.entity.${objectName}">
		<id column="id" property="id" jdbcType="VARCHAR" />
		<#list params as param>
		<result column="${param.columnName}" property="${param.name}" jdbcType="${param.mybatisJdbcType}" />
		</#list>
		<result column="create_date" property="createDate" jdbcType="TIMESTAMP" />
		<result column="modify_date" property="modifyDate" jdbcType="TIMESTAMP" />
		<result column="orders" property="orders" jdbcType="BIGINT" />
	</resultMap>

	<sql id="columns">
		id,
		<#list params as param>
		${param.columnName},
		</#list>
		create_date,
		modify_date,
		orders
	</sql>
	
	<!-- 查找分页 -->
	<select id="findPage" parameterType="map" resultMap="BaseResultMap">
		SELECT
		<include refid="columns"/>
		FROM ${tableName} t
		ORDER BY id DESC
		LIMIT ${'#'}{startIndex},${'#'}{pageSize}
	</select>
	
	<!-- 查找列表 -->
	<select id="findList" parameterType="map" resultMap="BaseResultMap">
		SELECT
		<include refid="columns"/>
		FROM ${tableName} t
	</select>
	
	<!-- 保存 -->
	<insert id="save" useGeneratedKeys="true" keyProperty="id" parameterType="${objectName}">
	  INSERT INTO ${tableName}
	  (<include refid="columns"/>)
	  VALUES 
	  (
		${'#'}{id},
		<#list params as param>
		${'#'}{${param.name}},
		</#list>
		now(),
		now(),
		${'#'}{orders}
	  )
	</insert>
 
	<!-- 根据id查找 -->
	<select id="findById" parameterType="String" resultMap="BaseResultMap">
		SELECT	
		<include refid="columns"/>
		FROM ${tableName} t
		WHERE t.id = ${'#'}{id}
	</select>
	
	<!-- 修改 -->
	<update id="update" parameterType="${objectName}">
		UPDATE ${tableName}
		<trim prefix="set" suffixOverrides=","> 
			<#list params as param>
			<if test="${param.name} != null">${param.columnName} = ${'#'}{${param.name}},</if>
			</#list>
			<if test="createDate != null">create_date = ${'#'}{createDate},</if>
			modify_date = now(),
			<if test="orders != null">orders = ${'#'}{orders}</if>
		</trim>
		WHERE 
			id = ${'#'}{id}
	</update>
	
	<!-- 批量删除 -->
	<delete id="deleteAll">
		DELETE FROM ${tableName}
		WHERE id IN
		<foreach item="item" index="index" collection="array" open="(" separator="," close=")">
        	${'#'}{item}
		</foreach>
	</delete>
	
	<!-- 统计 -->
	<select id="count" parameterType="map" resultType="java.lang.Long">
		SELECT
		COUNT(*)
		FROM ${tableName} t
	</select>
	
</mapper>