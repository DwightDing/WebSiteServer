package com.dwightd.controller;


/**
 * Created by Dwight on 2017/1/7.
 */

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.sms.model.v20160927.SingleSendSmsRequest;
import com.aliyuncs.sms.model.v20160927.SingleSendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

import com.dwightd.model.StuinfoEntity;
import com.dwightd.repository.StuinfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller

public class SMSServer {
    @Autowired
    StuinfoRepository stuinfoRepository;

    StuinfoEntity stuinfoEntity;

    @RequestMapping(
            value = {"/SMSServer.do"}//拦截器
    )
    public void sample() throws ClientException {
        List<StuinfoEntity> list = this.stuinfoRepository.findAll();
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAIb0EZ2F4AhOrX", "EoyzarJLczbOebrZOxvU8xBXln30pA");
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", "Sms", "sms.aliyuncs.com");
        IAcsClient client = new DefaultAcsClient(profile);
        int i = 0;
        for (StuinfoEntity obj : list) {
            SingleSendSmsRequest request = new SingleSendSmsRequest();
            try {
                request.setSignName("苍中13届六班");
                request.setTemplateCode("SMS_44510149");
                String temp;
                if (obj.getParticipate().equals("A.参加")) {
                    temp = "{\"name\":\"" + obj.getName() + "\"}";
                    request.setParamString(temp);
                    request.setRecNum(obj.getPhone().toString());
                    SingleSendSmsResponse httpResponse = client.getAcsResponse(request);
                    i++;
                }
            } catch (ServerException e) {
                e.printStackTrace();
            } catch (ClientException e) {
                e.printStackTrace();
            }
            System.out.print(i);
        }

    }


}
