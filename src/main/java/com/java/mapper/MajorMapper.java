package com.java.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author zjy @Date 2020/3/14 15:56
 */
@Repository
public interface MajorMapper {
     //首页信息展示
      List<Map<String,Object>> selectAllMajor(Map<String,Object> map);

      // 查询所有学院的信息
    @Select("select * from majordb")
      List<Map<String,Object>> selectAllMajordb();

    //删除学院信息
    @Delete("DELETE FROM major WHERE MID=#{mid}")
    int deleteOne(@Param("mid") Integer mid);

    //根据mid查询学院的信息
    @Select("SELECT * FROM major m INNER JOIN majordb db ON m.cid=db.cid WHERE m.mid=#{mid} LIMIT 1")
    Map<String, Object> selectByMid(@Param("mid") Integer mid);

    //添加学院信息
    @Insert("INSERT INTO majordb (cname,caddress,createtime,cpic) VALUES (#{cname},#{caddress},#{createtime},#{cpic})")
    int insertCollege(Map<String,Object> map);

    //添加专业信息
    @Insert("INSERT INTO major (mname,credlit,LifeYear,introduction,cid)VALUES (#{mname},#{credlit},#{LifeYear},#{introduction},#{cid})")
     int insertMajor(Map<String,Object> map);
}
