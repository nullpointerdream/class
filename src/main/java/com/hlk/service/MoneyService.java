package com.hlk.service;

import com.hlk.pojo.Money;

import java.util.List;

public interface MoneyService {


    void insert(Money money);

    int getMoneyNum(String searchPhrase);

    List<Money> getPageMoney(int current, int rowCount, String searchPhrase);

    Double getMoney();
}
