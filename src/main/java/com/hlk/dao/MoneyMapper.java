package com.hlk.dao;

import com.hlk.pojo.Grade;
import com.hlk.pojo.Money;

import java.util.List;

public interface MoneyMapper {

    void insert(Money money);

    int getMoneyNum(String kw);

    List<Money> getPageMoney(String kw);

    Double getSum();
}
