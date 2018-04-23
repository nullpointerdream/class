package com.hlk.controller;

import com.hlk.pojo.*;
import com.hlk.service.*;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/4/26.
 */
@Controller
@RequestMapping(value = "/stu")
public class StuController {
    @Autowired
    private StuService stuService;
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private PayService payService;
    @Autowired
    private GradeService gradeService;
    @Resource
    private LeaveService leaveService;
    @Resource
    private MoneyService moneyService;
    @RequestMapping(value = "/student/shiwu",method = RequestMethod.GET)
    public String shiwu() {
        return "/student/shiwuList";
    }


    @RequestMapping(value = "/student/banfei",method = RequestMethod.GET)
    public String banfei(HttpServletRequest request) {
       Double remain = moneyService.getMoney();
        request.setAttribute("remain",remain);
        return "/student/banfei";
    }
    @RequestMapping(value = "/student/banfei2",method = RequestMethod.GET)
    public String banfei2(HttpServletRequest request) {
        Double remain = moneyService.getMoney();
        request.setAttribute("remain",remain);
        return "/student/banfei2";
    }

    @RequestMapping(value = "/student/money",method = RequestMethod.GET)
    public String money() {
        return "/student/money";
    }

    @RequestMapping(value = "/student/grade",method = RequestMethod.GET)
    public String grade(HttpServletRequest request) {
        List<User> list = userService.getAllStudentWithOut();
        request.setAttribute("userlist",list);
        return "/student/grade";
    }

    @RequestMapping(value = "/student/grade2",method = RequestMethod.GET)
    public String grade2() {
        return "/student/grade2";
    }


    @RequestMapping(value = "/student/leavelist",method = RequestMethod.GET)
    public String stuleavelist() {
        return "/student/leavelist";
    }

    @RequestMapping(value = "/leavelist",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public StuGrid leavelist(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount,String searchPhrase) {
        int total = leaveService.getLeaveNum();
        List<Leave>  list = leaveService.getPageLeave(current,rowCount);
        StuGrid stuGrid = new StuGrid();
        stuGrid.setCurrent(current);
        stuGrid.setRowCount(rowCount);
        stuGrid.setRows(list);
        stuGrid.setTotal(total);
        return stuGrid;
    }

    @RequestMapping(value = "/banfei",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public StuGrid banfei(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount,String searchPhrase) {
        int total =payService.getPayNum(searchPhrase);
        List<Pay>  list = payService.getPagePay(current,rowCount,searchPhrase);
        StuGrid stuGrid = new StuGrid();
        stuGrid.setCurrent(current);
        stuGrid.setRowCount(rowCount);
        stuGrid.setRows(list);
        stuGrid.setTotal(total);
        return stuGrid;
    }
    @RequestMapping(value = "/money",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public StuGrid moneylist(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount,String searchPhrase) {
        int total = moneyService.getMoneyNum(searchPhrase);
        List<Money>  list = moneyService.getPageMoney(current,rowCount,searchPhrase);
        StuGrid stuGrid = new StuGrid();
        stuGrid.setCurrent(current);
        stuGrid.setRowCount(rowCount);
        stuGrid.setRows(list);
        stuGrid.setTotal(total);
        return stuGrid;
    }



    @RequestMapping(value = "/gradelist",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public StuGrid gradelist(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount,String searchPhrase) {
        int total = gradeService.getGradeNum(searchPhrase);
        List<Grade>  list = gradeService.getPageGrade(current,rowCount,searchPhrase);
        StuGrid stuGrid = new StuGrid();
        stuGrid.setCurrent(current);
        stuGrid.setRowCount(rowCount);
        stuGrid.setRows(list);
        stuGrid.setTotal(total);
        return stuGrid;
    }

    @RequestMapping(value = "/student/main",method = RequestMethod.GET)
    public String main() {
        return "/main/main_frame";
    }

      @RequestMapping(value = "/addShiWu",method = RequestMethod.POST)
    @ResponseBody
    public Message addShiWu(String title,String content ,@ModelAttribute("file") MultipartFile file, HttpServletRequest request) {
        Message message= new Message();
        try {

            message.setContent(content);
            message.setTitle(title);
            messageService.addMessage(message,file,request);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return message;
    }
    @RequestMapping(value = "/addBanFei",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addShiWu(@ModelAttribute("pay") Pay grade) {
        Map map = payService.insert(grade);
        return map;
    }

    @RequestMapping(value = "/addGrade",method = RequestMethod.POST)
    @ResponseBody
    public Grade addGrade(@ModelAttribute("grade") Grade grade) {

            gradeService.addGrade(grade);
        return grade;
    }
    @RequestMapping(value = "/getGradeInfo",method = RequestMethod.POST)
    @ResponseBody
    public Grade getGradeInfo(String stuId) {

        Grade grade= gradeService.getGradeInfo(stuId);
        return grade;
    }
    @RequestMapping(value = "/updateGrade",method = RequestMethod.POST)
    @ResponseBody
    public Grade updateGrade(@ModelAttribute("grade") Grade grade) {

      gradeService.updateGrade(grade);
        return grade;
    }


    @RequestMapping(value = "/getShiWuInfo",method = RequestMethod.POST)
    @ResponseBody
    public Message getShiWuInfo(String stuId) {
        Message message= messageService.getShiWuInfo(stuId);

        return message;
    }
    @RequestMapping(value = "/getBanFeiInfo",method = RequestMethod.POST)
    @ResponseBody
    public Pay getBanFeiInfo(String stuId) {
        Pay message= payService.getBanFeiInfo(stuId);

        return message;
    }
    @RequestMapping(value = "/updatebanfei",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object>  updatebanfei(@ModelAttribute("pay") Pay pay) {
        Map message= payService.updatebanfei(pay);

        return message;
    }

    @RequestMapping(value = "/downfile",method = RequestMethod.GET)
    public ResponseEntity<byte[]> downfile(String url, HttpServletRequest request) throws IOException {
        ResponseEntity<byte[]> map = messageService.downfile(url,request);
        return map;
    }

    @RequestMapping(value="/delStu",method = RequestMethod.GET)
    @ResponseBody
    public void delete(@RequestParam("stuId") int stuId){
        messageService.deleteById(stuId);
    }

    @RequestMapping(value="/updateStu",method = RequestMethod.POST)
    public String update(@RequestParam("stuAge") int stuId,@RequestParam("stuName") String stuName,
                         @RequestParam("stuAge") int stuAge,@RequestParam("stuMajor") String stuMajor){
        Stu stu = new Stu();
        stu.setStuId(stuId);
        stu.setStuName(stuName);
        stu.setStuAge(stuAge);
        stu.setStuMajor(stuMajor);
        stuService.updateStu(stu);
        return "redirect:student/stuList";
    }

    @RequestMapping(value="/getStuInfo",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Stu getStuById(@RequestParam("stuId") int stuId){
        Stu stu = stuService.getStuById(stuId);
        User user = userService.getUserByUserName("hlk1135");
        stu.setUser(user);
        return stu;
    }

    @RequestMapping(value = "/shiwu",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public StuGrid getStuList(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount) {
        int total = messageService.getMessageNum();
        List<Message>  list = messageService.getPageMessage(current,rowCount);
        StuGrid stuGrid = new StuGrid();
        stuGrid.setCurrent(current);
        stuGrid.setRowCount(rowCount);
        stuGrid.setRows(list);
        stuGrid.setTotal(total);
        return stuGrid;
    }

    @RequestMapping(value="/stulistxml",produces = {"application/xml;charset=UTF-8"})
    @ResponseBody
    public StuGrid getstulistxml(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
        int total = stuService.getStuNum();
        List<Stu>  list = stuService.getPageStu(current,rowCount);
        StuGrid stuGrid = new StuGrid();
        stuGrid.setCurrent(current);
        stuGrid.setRowCount(rowCount);
        stuGrid.setRows(list);
        stuGrid.setTotal(total);
        return stuGrid;
    }

    @RequestMapping("/exportLeave")
    public void exportLeave(HttpServletResponse response) throws Exception{
        InputStream is=leaveService.getInputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("contentDisposition", "attachment;filename=AllUsers.xls");
        ServletOutputStream output = response.getOutputStream();
        IOUtils.copy(is,output);
    }
    @RequestMapping("/exportGrade")
    public void exportGrade(HttpServletResponse response) throws Exception{
        InputStream is=gradeService.getInputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("contentDisposition", "attachment;filename=AllUsers.xls");
        ServletOutputStream output = response.getOutputStream();
        IOUtils.copy(is,output);
    }

}
