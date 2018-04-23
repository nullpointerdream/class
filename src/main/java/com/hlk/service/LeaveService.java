package com.hlk.service;

import com.hlk.pojo.Leave;

import java.io.InputStream;
import java.util.List;

public interface LeaveService {
    void insert(Leave leave);

    int getLeaveNum();

    List<Leave> getPageLeave(int current, int rowCount);

    InputStream getInputStream() throws Exception;
}
