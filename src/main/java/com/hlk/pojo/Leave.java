package com.hlk.pojo;

public class Leave {
    private Integer id;

    private String stuname;

    private String stuid;

    private String stureson;

    private String sturaddr;

    private String stutel;

    private String stuparetel;

    private String starttime;

    private String returntel;

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
        this.stuid = stuid == null ? null : stuid.trim();
    }

    public String getStureson() {
        return stureson;
    }

    public void setStureson(String stureson) {
        this.stureson = stureson == null ? null : stureson.trim();
    }

    public String getSturaddr() {
        return sturaddr;
    }

    public void setSturaddr(String sturaddr) {
        this.sturaddr = sturaddr == null ? null : sturaddr.trim();
    }

    public String getStutel() {
        return stutel;
    }

    public void setStutel(String stutel) {
        this.stutel = stutel == null ? null : stutel.trim();
    }

    public String getStuparetel() {
        return stuparetel;
    }

    public void setStuparetel(String stuparetel) {
        this.stuparetel = stuparetel == null ? null : stuparetel.trim();
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime == null ? null : starttime.trim();
    }

    public String getReturntel() {
        return returntel;
    }

    public void setReturntel(String returntel) {
        this.returntel = returntel == null ? null : returntel.trim();
    }
}