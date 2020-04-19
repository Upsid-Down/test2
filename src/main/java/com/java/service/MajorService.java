package com.java.service;

import java.util.List;
import java.util.Map;

/**
 * @Author zjy @Date 2020/3/14 16:00
 */
public interface MajorService {
    

    List<Map<String,Object>> findAllMajor(Map<String,Object> map);

    List<Map<String,Object>> findllMajordb();

    boolean removeOne(Integer mid);

    Map<String,Object> findByMid(Integer mid);

    boolean saveCollege(Map<String,Object> map);

    boolean saveMajor(Map<String,Object> map);
}
