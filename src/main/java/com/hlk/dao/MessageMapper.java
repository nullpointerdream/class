package com.hlk.dao;

import com.hlk.pojo.Message;

import java.util.List;

public interface MessageMapper {
    void insert(Message leave);

    int getMessageNum();

    List<Message> getMessageList();

    Message getMessageById(String id);

    void deleteById(int id);
}
