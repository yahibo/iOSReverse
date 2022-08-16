// See http://iphonedevwiki.net/index.php/Logos

#import"WXHeader.h"
#import "WXRedParamQueue.h"
#import "HBTestPage.h"

/// 红包页面
%hook WCRedEnvelopesReceiveHomeView
- (void)OnOpenRedEnvelopes {
    NSLog(@"%s======>来了",__func__);
    NSDictionary *m_dicBaseInfo = MSHookIvar<NSDictionary *>(self,"m_dicBaseInfo");
    for (id key in m_dicBaseInfo) {
        NSLog(@"key-value: %@ : %@", key, m_dicBaseInfo[key]);
    }
    %orig;
}
%end

%hook WCRedEnvelopesLogicMgr
- (void)OnWCToHongbaoCommonResponse:(HongBaoRes *)arg1 Request:(id)arg2 {
    NSLog(@"%s======>来了", __func__);
    NSLog(@"======>arg1:%@  arg2:%@", arg1, arg2);
    //%orig;
    //return;
    
    NSError *err;
    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:arg1.retText.buffer options:NSJSONReadingMutableContainers error:&err];
    NSLog(@"responseDic:%@", responseDic);
    //是否为未抢过的红包
    if(arg1 != nil && arg2 != nil && arg1.cgiCmdid == 3 &&[responseDic[@"receiveStatus"] integerValue] == 0 ) {
        NSString * timingIdentifier = responseDic[@"timingIdentifier"];
        NSLog(@"timingIdentifier :%@",timingIdentifier);
        NSMutableDictionary * param = [[WXRedParamQueue sharadInstance] dequeue];
        if(param && timingIdentifier && param[@"timingIdentifier"]){
            param[@"timingIdentifier"] = timingIdentifier;
            //开始抢红包
            MMServiceCenter *serviceCenter = (MMServiceCenter *)[%c(MMContext) currentContext];
            WCRedEnvelopesLogicMgr * redEvenlopsLogicMgr  = [serviceCenter getService:[%c(WCRedEnvelopesLogicMgr) class]];
            if(redEvenlopsLogicMgr) {
                float redTime = [[HBDefaults objectForKey:wx_redEnvelope_openDelay] floatValue];
                redTime = redTime <= 0 ?0.5:redTime;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)redTime * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    //打开红包
                    [redEvenlopsLogicMgr OpenRedEnvelopesRequest:param];
                });
            }
        }
    } else {
        
    }
    %orig;
}

%end



/// 消息处理
%hook CMessageMgr
- (void)onNewSyncAddMessage:(CMessageWrap *)msgWrap {
    NSLog(@"%s======>来了",__func__);
    NSLog(@"msgWrap:%@", msgWrap);
    //将WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes逻辑移植过来
    if (MSHookIvar <unsigned int>(msgWrap,"m_uiMessageType") != 49) {
        %orig;
        return;
    }
    if ([[HBDefaults objectForKey:wx_redEnvelope_openDelay_switch] intValue] == 0) {
        %orig;
        NSLog(@"手动抢红包");
        return;
    }
    
    //自动抢红包
    NSLog(@"====准备抢红包====");
    NSString *c2cNativeUrl = [[msgWrap m_oWCPayInfoItem] m_c2cNativeUrl];
    NSUInteger len  = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString *nativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    NSDictionary* url_dic = [%c(WCBizUtil) dictionaryWithDecodedComponets:nativeUrl2 separator:@"&"];
    //抢红包参数拼接
    NSMutableDictionary* mutable_dic =  [%c(NSMutableDictionary) dictionary];
    mutable_dic[@"msgType"] = @"1";
    mutable_dic[@"sendid"] = url_dic[@"sendid"];
    mutable_dic[@"channelid"] = url_dic[@"channelid"];
    if(msgWrap) {
        mutable_dic[@"nativeUrl"] = c2cNativeUrl;
    }
    //拼接发送方用户名
    NSString * nsUsrName = MSHookIvar <NSString *>(msgWrap,"m_nsFromUsr");
    if ( nsUsrName ){
        mutable_dic[@"sessionUserName"] = nsUsrName;
    }
    mutable_dic[@"timingIdentifier"] = @1;

    //昵称头像参数
    MMServiceCenter *serviceCenter = (MMServiceCenter*)[%c(MMContext) currentContext];
    CContactMgr* contactMgr = [serviceCenter getService:[%c(CContactMgr) class]];
    CContact * selfContact = [contactMgr getSelfContact];
    mutable_dic[@"nickName"] = [selfContact getContactDisplayName];
    mutable_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
    
    //将参数保存
    WXRedParamQueue * paramQueue = [WXRedParamQueue sharadInstance];
    [paramQueue enqueue:mutable_dic];
    NSLog(@"====拆开参数====：%@", mutable_dic);
    
    //拼接参数
    BOOL isGroupReceiver = [msgWrap.m_nsFromUsr rangeOfString:@"@chatroom"].location != NSNotFound;
    NSMutableDictionary* params =  [%c(NSMutableDictionary) dictionary];
    params[@"agreeDuty"] = @"0";
    params[@"inWay"] = isGroupReceiver?@"0":@"1";//1个人红包、0群红包
    params[@"channelid"] = url_dic[@"channelid"];
    params[@"msgType"] = @"1";
    params[@"nativeUrl"] = c2cNativeUrl;
    params[@"sendId"] = url_dic[@"sendid"];
    NSLog(@"====拆开参数====：%@", params);
    
    //判断是个人红包还是群红包-个人红包不拆包
    if (!isGroupReceiver) {
        %orig;
        NSLog(@"个人红包不好意思拆");
        return;
    }
    
    //拆开红包
    WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr  = [serviceCenter getService:[%c(WCRedEnvelopesLogicMgr) class]];
    [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    
    %orig;
}

/// 撤销一条消息
- (void)onNewSyncNotAddDBMessage:(id)arg1 {
    %log;
    if([[HBDefaults objectForKey:wx_game_deleteMsg_switch] intValue] == 0) {
        %orig;
    } else {
        NSLog(@"对方回撤了消息，但被阻止了");
    }
}

%end

%hook WCRedEnvelopesReceiveControlLogic
-(void)WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes {
    NSLog(@"%s======>来了", __func__);
    //%orig;
    //return;
    
    //1、消息解包
    WCRedEnvelopesControlData *m_data = MSHookIvar<WCRedEnvelopesControlData *>(self,"m_data");
    CMessageWrap *msgWrap = [m_data m_oSelectedMessageWrap];
    NSLog(@"msgWrap:%@", msgWrap);
    
    //2、构建支付信息
    WCPayInfoItem * payInfoItem  = [msgWrap m_oWCPayInfoItem];
    NSString * c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString * c2cNativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    NSDictionary * url_dic = [%c(WCBizUtil) dictionaryWithDecodedComponets:c2cNativeUrl2 separator:@"&"];
    NSMutableDictionary * mutalbe_dic = [%c(NSMutableDictionary) dictionary];
    mutalbe_dic[@"msgType"] = @"1";
    mutalbe_dic[@"sendId"] = url_dic[@"sendid"];
    mutalbe_dic[@"channelId"] = url_dic[@"channelid"];
    
    //3、设置用户信息参数
    MMServiceCenter * serviceCenter = (MMServiceCenter *)[%c(MMContext) currentContext];
    Class ccmgr = [%c(CContactMgr) class];
    CContactMgr * contactMgr = [serviceCenter getService:ccmgr];
    CContact * selfContact = [contactMgr getSelfContact];
    id displayName = [selfContact getContactDisplayName];
    mutalbe_dic[@"nickName"] = displayName;
    mutalbe_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
    if (msgWrap) {
        mutalbe_dic[@"nativeUrl"] = c2cNativeUrl;
    }
    
    //4、获取用户名称参数
    MMMsgLogicManager * redEvenlopsLogicMgr = [serviceCenter getService:[%c(MMMsgLogicManager) class]];
    WeixinContentLogicController * currentLogicContoller  = [redEvenlopsLogicMgr GetCurrentLogicController];
    if ( currentLogicContoller ) {
        CBaseContact * m_contact = [currentLogicContoller m_contact];
        if ( m_contact ) {
            CBaseContact * contact = [currentLogicContoller m_contact];
            NSString * nsUsrName = [contact m_nsUsrName];
            NSLog(@"nsUsrName:%@",nsUsrName);
            if (nsUsrName) {
                mutalbe_dic[@"sessionUserName"] = nsUsrName;
            }
        }
    }
    NSLog(@"%@",mutalbe_dic);
    
    //执行原始手动调用拆红包逻辑
    %orig;
    
    NSDictionary * m_dicBaseInfo = [m_data m_structDicRedEnvelopesBaseInfo];
    NSString * timingIdentifier = m_dicBaseInfo[@"timingIdentifier"];
    if ([timingIdentifier length]) {
        mutalbe_dic[@"timingIdentifier"] = timingIdentifier;
    }
    NSLog(@"timingIdentifier:%@",timingIdentifier);
    
    WCPayLogicMgr * payLogic = [serviceCenter getService:[%c(WCPayLogicMgr) class]];
    
    [payLogic setRealnameReportScene:(unsigned int)1003];
    id subScript = [m_dicBaseInfo objectForKeyedSubscript:@"agree_duty"];
    NSLog(@"subScript:%@  subScript.class:%@",subScript,[subScript class]);
    
    //打开红包
    [payLogic checkHongbaoOpenLicense:subScript acceptCallback:^() {
        WCRedEnvelopesLogicMgr * redEvenlopsLogicMgr  = [serviceCenter getService:[%c(WCRedEnvelopesLogicMgr) class]];
        [redEvenlopsLogicMgr OpenRedEnvelopesRequest:mutalbe_dic];
    } denyCallback:^() {
        
    }];
}

%end


/// 修改步数
%hook WCDeviceStepObject
- (int)m7StepCount {
    BOOL isOn = [[HBDefaults objectForKey:wx_sport_stepCount_switch] intValue] == 1;
    int count = [[HBDefaults valueForKey:wx_sport_stepCount] intValue];
    NSLog(@"m7StepCount-isOn:%d count:%d", isOn?1:0, count);
    if(isOn && count > 0) {
        count = count > 88888 ? 88888 : count;
        return count;
    }
    return %orig;
}
%end

%hook MoreViewController
- (void)viewDidAppear:(BOOL)animated {
    %orig;
    [self.view addSubview:[HBTestPage sharadInstance]];
}
%end
