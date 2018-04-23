package com.hlk.dao;

import com.hlk.pojo.Leave;

import java.util.List;

public interface LeaveMapper {
    void insert(Leave leave);

    int getLeaveNum();

    List<Leave> getPageLeave();
}
