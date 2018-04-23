package com.hlk.service;

import com.hlk.pojo.Grade;

import java.io.InputStream;
import java.util.List;

public interface GradeService {


    List<Grade> getPageGrade(int current, int rowCount, String searchPhrase);

    int getGradeNum(String searchPhrase);

    void addGrade(Grade grade);

    Grade getGradeInfo(String stuId);

    void updateGrade(Grade grade);

    InputStream getInputStream() throws Exception;
}
