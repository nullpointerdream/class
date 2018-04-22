package com.hlk.service.impl;

import com.github.pagehelper.PageHelper;
import com.hlk.dao.LeaveMapper;
import com.hlk.dao.UserMapper;
import com.hlk.pojo.Leave;
import com.hlk.pojo.User;
import com.hlk.service.LeaveService;
import com.hlk.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
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
}


