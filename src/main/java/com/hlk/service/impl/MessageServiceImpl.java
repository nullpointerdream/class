package com.hlk.service.impl;

import com.github.pagehelper.PageHelper;
import com.hlk.dao.MessageMapper;
import com.hlk.pojo.Message;
import com.hlk.service.MessageService;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;

/**
 * Created by lenovo on 2017/4/19.
 */

@Service("messageService")
public class MessageServiceImpl implements MessageService {
    @Resource
    MessageMapper messageMapper;
    public void insert(Message message) {

    }

    public int getMessageNum() {
        return messageMapper.getMessageNum();
    }

    public List<Message> getPageMessage(int current, int rowCount) {
        PageHelper.startPage(current,rowCount);//分页核心代码
        List<Message> list = messageMapper.getMessageList();
        return list;
    }

    public void addMessage(Message message, MultipartFile file, HttpServletRequest request) throws IOException {
        if( file.getSize()!=0){
            String path = request.getServletContext().getRealPath("/attchment/");
            String name =new String(file.getOriginalFilename().getBytes("ISO-8859-1"),"utf-8");
            File toPic = new File(path+ name);// 读入文件
            FileUtils.copyInputStreamToFile(file.getInputStream(), toPic);
            message.setFile(name);
        }

        messageMapper.insert(message);
    }

    public Message getShiWuInfo(String stuId) {
        return messageMapper.getMessageById(stuId);
    }

    public ResponseEntity<byte[]> downfile(String url, HttpServletRequest request) throws IOException {
        try {
            String path = request.getServletContext().getRealPath("/attchment/");
            File file = new File(path + url);// 读入文件

            byte[] body = null;
            InputStream is = new FileInputStream(file);
            body = new byte[is.available()];
            is.read(body);
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "attchement;filename=" + file.getName());
            HttpStatus statusCode = HttpStatus.OK;
            ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
            return entity;
        }catch (Exception e){
            return null;
        }

    }

    public void deleteById(int stuId) {
        messageMapper.deleteById(stuId);
    }
}


