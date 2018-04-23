package com.hlk.dao;

import com.hlk.pojo.Money;
import com.hlk.pojo.Pay;

import java.util.List;

public interface PayMapper {


    void insert(Pay money);


    List<Pay> getPagePay(String kw);

    Double getSum();

    int getPayNum(String searchPhrase);

    Pay getBanFeiInfo(String id);

    void update(Pay pay);
}
