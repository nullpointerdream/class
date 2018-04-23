package com.hlk.service.impl;

import com.github.pagehelper.PageHelper;
import com.hlk.dao.LeaveMapper;
import com.hlk.poi.WriteExcel;
import com.hlk.pojo.Leave;
import com.hlk.service.LeaveService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2017/4/19.
 */

@Service("leaveService")
public class LeaveServiceImpl implements LeaveService {

    @Resource
    private LeaveMapper leaveMapper;

    public void insert(Leave leave) {
        leaveMapper.insert(leave);
    }

    public int getLeaveNum() {
        return leaveMapper.getLeaveNum();
    }

    public List<Leave> getPageLeave(int current, int rowCount) {
        PageHelper.startPage(current,rowCount);//分页核心代码
        List<Leave> list = leaveMapper.getPageLeave();
        return list;
    }

    public InputStream getInputStream() throws Exception {
        String[] title=new String[]{"学号","姓名","离校原因","离校地址","联系方式","父母联系方式","离校日期","返校日期"};
        List<Leave> plist = leaveMapper.getPageLeave();
        List<Object[]>  dataList = new ArrayList<Object[]>();
        for(int i=0;i<plist.size();i++){
            Object[] obj=new Object[8];
            obj[0]=plist.get(i).getStuid();
            obj[1]=plist.get(i).getStuname();
            obj[2]=plist.get(i).getStureson();
            obj[3]=plist.get(i).getSturaddr();
            obj[4]=plist.get(i).getStutel();
            obj[5]=plist.get(i).getStuparetel();
            obj[6]=plist.get(i).getStarttime();
            obj[7]=plist.get(i).getReturntel();
            dataList.add(obj);
        }
        WriteExcel ex = new WriteExcel(title, dataList);
        InputStream in;
        in = ex.export();
        return in;
    }
}


