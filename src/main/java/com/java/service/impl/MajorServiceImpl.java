package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.MajorMapper;
import com.java.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author zjy @Date 2020/3/14 15:59
 */
@Service
public class MajorServiceImpl implements MajorService {
    @Autowired
    private MajorMapper majorMapper;

    @Override
    public List<Map<String, Object>> findAllMajor(Map<String, Object> map) {
       Integer pageNum = (Integer) map.get("pageNum");
        Integer pageSize = (Integer)map.get("pageSize");
        PageHelper.startPage(pageNum, pageSize);
        return majorMapper.selectAllMajor(map);
    }

    @Override
    public List<Map<String, Object>> findllMajordb() {
        return majorMapper.selectAllMajordb();
    }

    //删除专业
    @Override
    public boolean removeOne(Integer mid) {
        return majorMapper.deleteOne(mid)==1;
    }

    @Override
    public Map<String, Object> findByMid(Integer mid) {
        return majorMapper.selectByMid(mid);
    }

    @Override
    public boolean saveCollege(Map<String, Object> map) {
        return majorMapper.insertCollege(map)==1;
    }

    @Override
    public boolean saveMajor(Map<String, Object> map) {
        return majorMapper.insertMajor(map)==1;
    }
}
