package com.hlk.service;

import com.hlk.pojo.Message;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public interface MessageService {
    void insert(Message message);

    int getMessageNum();

    List<Message> getPageMessage(int current, int rowCount);

    void addMessage(Message message, MultipartFile file, HttpServletRequest request) throws IOException;

    Message getShiWuInfo(String stuId);

    ResponseEntity<byte[]> downfile(String url, HttpServletRequest request) throws IOException;

    void deleteById(int stuId);


}
