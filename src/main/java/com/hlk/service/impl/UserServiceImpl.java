package com.hlk.service.impl;

import com.github.pagehelper.PageHelper;
import com.hlk.dao.UserMapper;
import com.hlk.pojo.User;
import com.hlk.service.UserService;
import com.hlk.util.CommonResource;
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

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    public User getUserByUserName(String user_name) {
        User user1= userMapper.getUserByUserName(user_name);
        return user1;
    }

    public User checkLogin(String user_name,String password) {
        User user = userMapper.getUserByUserName(user_name);
        if(user!=null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    public void updateUser(User user, MultipartFile file, HttpServletRequest request, HttpSession httpSession) throws IOException {
        if( file.getSize()!=0){
            String path = request.getServletContext().getRealPath("/images/");
            String name =new String(file.getOriginalFilename().getBytes("ISO-8859-1"),"utf-8");
            File toPic = new File(path+ name);// 读入文件
            FileUtils.copyInputStreamToFile(file.getInputStream(), toPic);
            user.setImg(name);
        }

        userMapper.updateUser(user);
        httpSession.setAttribute("user",user);
    }

    public int getUserNum() {
        return userMapper.getUserNum();
    }

    public List<User> getPageUser(int current, int rowCount) {
        PageHelper.startPage(current,rowCount);//分页核心代码
        List<User> list = userMapper.getStuList();
        return list;

    }

    public List<User> getAllStudent(int current, int rowCount) {
        PageHelper.startPage(current,rowCount);//分页核心代码
        List<User> list = userMapper.getAllStudent();
        return list;
    }

    public User getStuById(int stuId) {
        User user = userMapper.getUserById(stuId);
        return user;
    }

    public User updateUserById(User user) {
       userMapper.updateUser(user);
        return user;
    }

    public void deleteById(int stuId) {
        userMapper.deleteById(stuId);
    }

    public void addUser(User user) {
        userMapper.addUser(user);
    }
}
