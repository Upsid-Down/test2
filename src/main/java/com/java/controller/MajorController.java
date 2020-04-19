package com.java.controller;

import com.github.pagehelper.PageInfo;
import com.java.mapper.MajorMapper;
import com.java.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author zjy @Date 2020/3/14 15:51
 */
@Controller
@RequestMapping("/major")
public class MajorController {
    @Autowired
    private MajorService majorService;

    @RequestMapping("/getAllMajor.do")
    public String getAllMajor(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "3") Integer pageSize,
                              @RequestParam(required = false) String cname,
                              @RequestParam(required = false) String mname,
                              @RequestParam(required = false) Integer min,
                              @RequestParam(required = false) Integer max,
                              Model model) {
        //将参书封装到map集合中
        Map<String, Object> map = new HashMap<>();
        map.put("pageNum", pageNum);
        map.put("pageSize", pageSize);
        map.put("cname",cname);
        map.put("mname",mname);
        map.put("min", min);
        map.put("max", max);
        //获取查询的数据并进行分页,传入到前台
        List<Map<String, Object>> allMajor = majorService.findAllMajor(map);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(allMajor);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("map",map);
        //将学院信息传入前台,以下拉列表的形式展示
        List<Map<String, Object>> majordb = majorService.findllMajordb();
        model.addAttribute("majordb", majordb);
        return "/pages/major.jsp";
    }

    //删除
    @RequestMapping("/delByMid.do")
    @ResponseBody
    public boolean delByMid(Integer mid){
        return majorService.removeOne(mid);
    }

    //根据id查询专业
    @RequestMapping("/getByMid.do")
    public String getByMid(Integer mid,Model model){
        Map<String, Object> byMid = majorService.findByMid(mid);
        model.addAttribute("byMid",byMid);
        return "/pages/detail.jsp";
    }

    //添加学院信息
    @RequestMapping("/addCollege.do")
    @ResponseBody
    public boolean addCollege(@RequestParam Map<String,Object> collegeMap){
        return  majorService.saveCollege(collegeMap);
    }

    //添加专业信息
        //1  获取学院信息,以下拉列表展示
    @RequestMapping("getCollege.do")
    public String getCollege(Model model){
        List<Map<String, Object>> collegeList = majorService.findllMajordb();
        model.addAttribute("list", collegeList);
        return "/pages/addMajor.jsp";
    }

        //2  获取页面信息信息提交
    @RequestMapping("/addMajor.do")
    @ResponseBody
    public boolean addMajor(@RequestParam Map<String,Object> map){
        return majorService.saveMajor(map);
    }
}
