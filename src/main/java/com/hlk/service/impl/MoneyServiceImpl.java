package com.hlk.service.impl;

import com.github.pagehelper.PageHelper;
import com.hlk.dao.MoneyMapper;
import com.hlk.dao.PayMapper;
import com.hlk.pojo.Grade;
import com.hlk.pojo.Money;
import com.hlk.service.MoneyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by lenovo on 2017/4/19.
 */

@Service("moneyService")
public class MoneyServiceImpl implements MoneyService {
    @Resource
    MoneyMapper moneyMapper;
    @Resource
    PayMapper payMapper;


    public void insert(Money money) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        money.setAddtime(simpleDateFormat.format(new Date()));
        moneyMapper.insert(money);
    }

    public List<Money> getPageMoney(int current, int rowCount, String searchPhrase) {
        PageHelper.startPage(current,rowCount);//分页核心代码
        List<Money> list = moneyMapper.getPageMoney(searchPhrase);
        return list;
    }

    public Double getMoney() {
        Double totle =moneyMapper.getSum();
        if(totle==null){
            totle=0.0;
        }
        Double pay =payMapper.getSum();
        if(pay==null){
            pay=0.0;
        }
        return totle-pay;
    }

    public int getMoneyNum(String searchPhrase) {
        return moneyMapper.getMoneyNum(searchPhrase);
    }



}


