package com.hlk.service.impl;

import com.github.pagehelper.PageHelper;
import com.hlk.dao.GradeMapper;
import com.hlk.poi.WriteExcel;
import com.hlk.pojo.Grade;
import com.hlk.service.GradeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2017/4/19.
 */

@Service("gradeService")
public class GradeServiceImpl implements GradeService {
    @Resource
    GradeMapper gradeMapper;


    public List<Grade> getPageGrade(int current, int rowCount, String searchPhrase) {
        PageHelper.startPage(current,rowCount);//分页核心代码
        List<Grade> list = gradeMapper.getPageGrade(searchPhrase);
        return list;
    }

    public int getGradeNum(String searchPhrase) {
        return gradeMapper.getGradeNum(searchPhrase);
    }

    public void addGrade(Grade grade) {
        String stuname = grade.getStuname();
        grade.setStuid(stuname.split("@")[0]);
        grade.setStuname(stuname.split("@")[1]);
        gradeMapper.insert(grade);
    }

    public Grade getGradeInfo(String stuId) {
        return gradeMapper.getGradeInfo(stuId);
    }

    public void updateGrade(Grade grade) {
        gradeMapper.updateGrade(grade);
    }

    public InputStream getInputStream() throws Exception {
        String[] title=new String[]{"学号","姓名","数据结构","操作系统","软件工程",
                "计算机组成原理","计算机网络","java","平均成绩"};
        List<Grade> plist = gradeMapper.getAllGrade();
        List<Object[]>  dataList = new ArrayList<Object[]>();
        for(int i=0;i<plist.size();i++){
            Object[] obj=new Object[9];
            obj[0]=plist.get(i).getStuid();
            obj[1]=plist.get(i).getStuname();
            obj[2]=plist.get(i).getCourse1();
            obj[3]=plist.get(i).getCourse2();
            obj[4]=plist.get(i).getCourse3();
            obj[5]=plist.get(i).getCourse4();
            obj[6]=plist.get(i).getCourse5();
            obj[7]=plist.get(i).getCourse6();
            obj[8]=plist.get(i).getAvg();
            dataList.add(obj);
        }
        WriteExcel ex = new WriteExcel(title, dataList);
        InputStream in;
        in = ex.export();
        return in;
    }
}


