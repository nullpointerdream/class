package com.hlk.dao;

import com.hlk.pojo.User;

import java.util.List;

/**
 * Created by lenovo on 2017/4/18.
 */
public interface UserMapper {

    public void addUser(User user);
    public User getUserByUserName(String user_name);

    void updateUser(User user);

    int getUserNum();

    List<User> getStuList();

    List<User> getAllStudent();

    User getUserById(int stuId);

    void deleteById(int stuId);

    int getAllStudentCount();

    List<User> getAllStudentWithOut();
}
