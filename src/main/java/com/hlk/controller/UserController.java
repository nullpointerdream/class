package com.hlk.controller;

import com.hlk.pojo.Leave;
import com.hlk.pojo.Stu;
import com.hlk.pojo.StuGrid;
import com.hlk.pojo.User;
import com.hlk.service.LeaveService;
import com.hlk.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/4/19.
 */

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private LeaveService leaveService;

    @RequestMapping(value = "/")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/register")
    public String register() {
        return "user/insert";
    }

    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user1) {
        //检测该用户是否已经存在
        User user=userService.getUserByUserName(user1.getUser_name());
        if(user==null) {
            return "redirect:user/register";
        }
        return "redirect:user/login";
    }


    @RequestMapping(value = "/insertUser",method = RequestMethod.POST)
    public String insertUser(@ModelAttribute("user") User user) {
        userService.addUser(user);
        return login();
    }
    @RequestMapping(value = "/addStu",method = RequestMethod.POST)
    public String addStu(@ModelAttribute("user") User user) {
        userService.addUser(user);
        return login();
    }

    @RequestMapping(value = "/submitLeave",method = RequestMethod.POST)
    public String insertUser(@ModelAttribute("leave") Leave leave) {
        leaveService.insert(leave);
        return list();
    }


    @RequestMapping(value = "/student/stuList",method = RequestMethod.GET)
    public String stuList() {
        return "/student/stuList";
    }


    @RequestMapping(value = "/user/allStudent",method = RequestMethod.GET)
    public String allStudent() {
        return "/user/userList";
    }


    @RequestMapping(value = "/allStudent",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public StuGrid allStudent(@RequestParam("current") int current, @RequestParam("rowCount") int rowCount) {
        int total = userService.getUserNum();
        List<User> list = userService.getAllStudent(current,rowCount);
        StuGrid stuGrid = new StuGrid();
        stuGrid.setCurrent(current);
        stuGrid.setRowCount(rowCount);
        stuGrid.setRows(list);
        stuGrid.setTotal(total);
        return stuGrid;
    }

    @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("user") User user, @ModelAttribute("file") MultipartFile file,HttpServletRequest request,HttpSession httpSession) throws IOException {
        userService.updateUser(user,file,request,httpSession);
        return list();
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list() {
        return "main/main_frame";
    }

    @RequestMapping(value = "/userList",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public StuGrid getStuList(@RequestParam("current") int current, @RequestParam("rowCount") int rowCount) {
        int total = userService.getUserNum();
        List<User> list = userService.getPageUser(current,rowCount);
        StuGrid stuGrid = new StuGrid();
        stuGrid.setCurrent(current);
        stuGrid.setRowCount(rowCount);
        stuGrid.setRows(list);
        stuGrid.setTotal(total);
        return stuGrid;
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login() {
        return "user/login";
    }

    @RequestMapping(value = "/leaveSchool",method = RequestMethod.GET)
    public String leaveSchool() {
        return "user/leaveSchool";
    }

    @RequestMapping(value="/getStuInfo",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public User getStuById(@RequestParam("stuId") int stuId){
        User stu = userService.getStuById(stuId);
        return stu;
    }

    @RequestMapping(value="/updateStu",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public User updateStu(@ModelAttribute("user") User user){
        User stu = userService.updateUserById(user);
        return stu;
    }

    @RequestMapping(value="/delStu",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public void delStu(@RequestParam("stuId") int stuId){
         userService.deleteById(stuId);

    }

    @RequestMapping(value = "/userInfo",method = RequestMethod.GET)
    public String userInfo() {
        return "user/userInfo";
    }

    @RequestMapping(value = "/loginValidate",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Map<String,Object> loginValidate(@RequestParam("username") String username,@RequestParam("password") String password,HttpSession httpSession) {
        Map<String,Object> map = new HashMap<String, Object>();
        if(username==null || password==null) {
            map.put("code", 201);
            map.put("msg", "不能为空");
        }else {
            User user = userService.getUserByUserName(username);
            if(user==null){
                map.put("code",201);
                map.put("msg","用户不存在");
            }else if(user.getPassword().equals(password)) {
                httpSession.setAttribute("username", username);
                httpSession.setAttribute("user", user);
                map.put("code",200);
            } else  {
                map.put("code",201);
                map.put("msg","用户密码错误");
            }
        }

        return map;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession httpSession) {
        httpSession.removeAttribute("username");
        return "redirect:/user/login";
    }

}