package com.kaishengit.service;

import com.kaishengit.dao.MessageDao;
import com.kaishengit.entity.Message;

import java.util.List;

public class WeiboService {

    private MessageDao messageDao = new MessageDao();

    public List<Message> findAll() {
        return messageDao.findAll();
    }


    public List<Message> findByMaxId(String maxId) {
        return messageDao.findByMaxId(maxId);
    }
}
