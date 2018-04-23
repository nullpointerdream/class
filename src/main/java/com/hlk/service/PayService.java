package com.hlk.service;

import com.hlk.pojo.Money;
import com.hlk.pojo.Pay;

import java.util.List;
import java.util.Map;

public interface PayService {


    List<Pay> getPagePay(int current, int rowCount, String searchPhrase);

    int getPayNum(String searchPhrase);

    Map insert(Pay grade);

    Pay getBanFeiInfo(String stuId);

    Map updatebanfei(Pay pay);
}
