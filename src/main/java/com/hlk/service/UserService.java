package com.hlk.service;

import com.hlk.pojo.Stu;
import com.hlk.pojo.User;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by lenovo on 2017/4/19.
 */
public interface UserService {

    public void addUser(User user);
    public User getUserByUserName(String user_name);
    public User checkLogin(String user_name,String password);
    void updateUser(User user, MultipartFile file, HttpServletRequest request, HttpSession httpSession) throws IOException;

    int getUserNum();

    List<User> getPageUser(int current, int rowCount);

    List<User> getAllStudent(int current, int rowCount);

    User getStuById(int stuId);

    User updateUserById(User user);

    void deleteById(int stuId);

    int getAllStudentCount();

    InputStream getInputStream() throws Exception;

    List<User> getAllStudentWithOut();
}
