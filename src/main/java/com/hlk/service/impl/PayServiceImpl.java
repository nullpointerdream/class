package com.hlk.service.impl;

import com.github.pagehelper.PageHelper;
import com.hlk.dao.MoneyMapper;
import com.hlk.dao.PayMapper;
import com.hlk.pojo.Money;
import com.hlk.pojo.Pay;
import com.hlk.service.MoneyService;
import com.hlk.service.PayService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/4/19.
 */

@Service("payService")
public class PayServiceImpl implements PayService {
    @Resource
    PayMapper payMapper;
    @Resource
    MoneyService moneyService;
    public Map insert(Pay money) {
        Map<String,Object> map  =new HashMap();
        payMapper.insert(money);
        map.put("data",  moneyService.getMoney());
        return map;
    }

    public Pay getBanFeiInfo(String stuId) {
        return   payMapper.getBanFeiInfo(stuId);
    }

    public Map updatebanfei(Pay pay) {
        Map<String,Object> map  =new HashMap();
        payMapper.update(pay);
        map.put("data",  moneyService.getMoney());
        return map;
    }

    public List<Pay> getPagePay(int current, int rowCount, String searchPhrase) {
        PageHelper.startPage(current,rowCount);//分页核心代码
        List<Pay> list = payMapper.getPagePay(searchPhrase);
        return list;
    }

    public int getPayNum( String searchPhrase) {
        return payMapper.getPayNum(searchPhrase);
    }
}


