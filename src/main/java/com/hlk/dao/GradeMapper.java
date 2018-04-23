package com.hlk.dao;

import com.hlk.pojo.Grade;

import java.util.List;

public interface GradeMapper {
    List<Grade> getPageGrade(String kw);

    int getGradeNum(String kw);

    void insert(Grade grade);

    Grade getGradeInfo(String id);

    void updateGrade(Grade grade);

    List<Grade> getAllGrade();
}
