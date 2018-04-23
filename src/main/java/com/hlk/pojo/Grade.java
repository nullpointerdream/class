package com.hlk.pojo;

public class Grade {
    private Integer id;

    private String stuname;

    private String stuid;

    private Double course1;

    private Double course2;

    private Double course3;

    private Double course4;

    private Double course5;
    private Double course6;
    private Double avg;

    public Double getAvg() {
        return avg;
    }

    public void setAvg(Double avg) {
        this.avg = avg;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname == null ? null : stuname.trim();
    }

    public String getStuid() {
        return stuid;
    }

    public void setStuid(String stuid) {
        this.stuid = stuid;
    }

    public Double getCourse1() {
        return course1;
    }

    public void setCourse1(Double course1) {
        this.course1 = course1;
    }

    public Double getCourse2() {
        return course2;
    }

    public void setCourse2(Double course2) {
        this.course2 = course2;
    }

    public Double getCourse3() {
        return course3;
    }

    public void setCourse3(Double course3) {
        this.course3 = course3;
    }

    public Double getCourse4() {
        return course4;
    }

    public void setCourse4(Double course4) {
        this.course4 = course4;
    }

    public Double getCourse5() {
        return course5;
    }

    public void setCourse5(Double course5) {
        this.course5 = course5;
    }

    public Double getCourse6() {
        return course6;
    }

    public void setCourse6(Double course6) {
        this.course6 = course6;
    }
}