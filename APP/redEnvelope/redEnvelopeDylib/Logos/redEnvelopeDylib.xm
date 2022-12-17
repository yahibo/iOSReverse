// See http://iphonedevwiki.net/index.php/Logos

#import "WXHeader.h"
#import "WXRedParamQueue.h"
#import "HBFloatView.h"

#pragma mark - 红包页面
%hook WCRedEnvelopesReceiveHomeView

- (void)OnOpenRedEnvelopes {
    %log;
    NSDictionary *m_dicBaseInfo = MSHookIvar<NSDictionary *>(self,"m_dicBaseInfo");
    NSLog(@"====》m_dicBaseInfo:%@", m_dicBaseInfo);
    %orig;
}

%end


#pragma mark - 开红包逻辑
%hook WCRedEnvelopesLogicMgr

- (void)OnWCToHongbaoCommonResponse:(HongBaoRes *)arg1 Request:(id)arg2 {
    %log;
//    %orig;
//    return;
    
    NSError *err;
    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:arg1.retText.buffer options:NSJSONReadingMutableContainers error:&err];
    NSLog(@"====》responseDic:%@", responseDic);
    NSInteger receiveStatus = [responseDic[@"receiveStatus"] integerValue];
    //是否为未抢过的红包
    if(arg1 != nil && arg2 != nil && arg1.cgiCmdid == 3 && receiveStatus == 0 ) {
        NSString *timingIdentifier = responseDic[@"timingIdentifier"];
        NSMutableDictionary *param = [[WXRedParamQueue sharadInstance] dequeue];
        if(param && timingIdentifier && param[@"timingIdentifier"]){
            param[@"timingIdentifier"] = timingIdentifier;
            //开始抢红包
            MMServiceCenter *serviceCenter = (MMServiceCenter *)[%c(MMContext) currentContext];
            WCRedEnvelopesLogicMgr *redEvenlopsLogicMgr  = [serviceCenter getService:[%c(WCRedEnvelopesLogicMgr) class]];
            if(redEvenlopsLogicMgr) {
                float redTime = [[HBDefaults objectForKey:WX_REDENVELOPE_OPENDELAY] floatValue];
                redTime = redTime <= 0 ?0.5:redTime;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)redTime *NSEC_PER_SEC), dispatch_get_main_queue(), ^{
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


#pragma mark - 新消息处理
%hook CMessageMgr
- (void)onNewSyncAddMessage:(CMessageWrap *)msgWrap {
    %log;
    if (MSHookIvar <unsigned int>(msgWrap, "m_uiMessageType") != 49) {
        %orig;
        return;
    }
    //判断是否开启自动抢红包
    if ([[HBDefaults objectForKey:WX_REDENVELOPE_OPENDELAY_SWITCH] intValue] == 0) {
        NSLog(@"====》手动抢红包");
        %orig;
        return;
    }
    //自动抢红包 - 将WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes逻辑移植过来
    NSLog(@"====》准备抢红包");
    NSString *c2cNativeUrl = [[msgWrap m_oWCPayInfoItem] m_c2cNativeUrl];
    NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
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
    NSString *nsUsrName = MSHookIvar <NSString *>(msgWrap,"m_nsFromUsr");
    if ( nsUsrName ){
        mutable_dic[@"sessionUserName"] = nsUsrName;
    }
    mutable_dic[@"timingIdentifier"] = @"13f1c921a5c03d2e2352c44563ee83a2";

    //昵称头像参数
    MMServiceCenter *serviceCenter = (MMServiceCenter*)[%c(MMContext) currentContext];
    CContactMgr* contactMgr = [serviceCenter getService:[%c(CContactMgr) class]];
    CContact *selfContact = [contactMgr getSelfContact];
    mutable_dic[@"nickName"] = [selfContact getContactDisplayName];
    mutable_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
    
    //将参数保存
    WXRedParamQueue *paramQueue = [WXRedParamQueue sharadInstance];
    [paramQueue enqueue:mutable_dic];
    NSLog(@"====》拆开参数：%@", mutable_dic);
    
    //拼接参数
    BOOL isGroupReceiver = [msgWrap.m_nsFromUsr rangeOfString:@"@chatroom"].location != NSNotFound;
    NSMutableDictionary* params =  [%c(NSMutableDictionary) dictionary];
    params[@"agreeDuty"] = @"0";
    params[@"inWay"] = isGroupReceiver?@"0":@"1";//1个人红包、0群红包
    params[@"channelid"] = url_dic[@"channelid"];
    params[@"msgType"] = @"1";
    params[@"nativeUrl"] = c2cNativeUrl;
    params[@"sendId"] = url_dic[@"sendid"];
    NSLog(@"====》拆开参数：%@", params);
    
    //判断是个人红包还是群红包-个人红包不拆包
    int count = [[HBDefaults valueForKey:WX_SPORT_STEPCOUNT] intValue];
    if (!isGroupReceiver && count != 12345) {
        %orig;
        NSLog(@"====》个人红包不好意思拆");
        return;
    }
    
    //拆开红包
    WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr  = [serviceCenter getService:[%c(WCRedEnvelopesLogicMgr) class]];
    [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    
    %orig;
}

#pragma mark - 撤销一条消息
- (void)onNewSyncNotAddDBMessage:(CMessageWrap *)msgWrap {
    %log;
    if([[HBDefaults objectForKey:WX_MESSAGE_DELETED_SWITCH] intValue] == 1) {
        NSLog(@"====》对方回撤了消息，但被阻止了");
        NSString *str = [NSString stringWithFormat:@"\"%@\"想撤回一条消息，被我拒绝了", [msgWrap m_nsPushTitle]];
        HBToast(str);
    } else {
        %orig;
    }
}

%end

#pragma mark - 接收红包控制逻辑
%hook WCRedEnvelopesReceiveControlLogic

- (void)WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes {
    %log;
    %orig;
    return;
    
    //1、消息解包
    WCRedEnvelopesControlData *m_data = MSHookIvar<WCRedEnvelopesControlData *>(self,"m_data");
    CMessageWrap *msgWrap = [m_data m_oSelectedMessageWrap];
    NSLog(@"====》msgWrap:%@", msgWrap);
    
    //2、构建支付信息
    WCPayInfoItem *payInfoItem  = [msgWrap m_oWCPayInfoItem];
    NSString *c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString *c2cNativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    NSDictionary *url_dic = [%c(WCBizUtil) dictionaryWithDecodedComponets:c2cNativeUrl2 separator:@"&"];
    NSMutableDictionary *mutalbe_dic = [%c(NSMutableDictionary) dictionary];
    mutalbe_dic[@"msgType"] = @"1";
    mutalbe_dic[@"sendId"] = url_dic[@"sendid"];
    mutalbe_dic[@"channelId"] = url_dic[@"channelid"];
    
    //3、设置用户信息参数
    MMServiceCenter *serviceCenter = (MMServiceCenter *)[%c(MMContext) currentContext];
    Class ccmgr = [%c(CContactMgr) class];
    CContactMgr *contactMgr = [serviceCenter getService:ccmgr];
    CContact *selfContact = [contactMgr getSelfContact];
    id displayName = [selfContact getContactDisplayName];
    mutalbe_dic[@"nickName"] = displayName;
    mutalbe_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
    if (msgWrap) {
        mutalbe_dic[@"nativeUrl"] = c2cNativeUrl;
    }
    
    //4、获取用户名称参数
    MMMsgLogicManager *redEvenlopsLogicMgr = [serviceCenter getService:[%c(MMMsgLogicManager) class]];
    WeixinContentLogicController *currentLogicContoller  = [redEvenlopsLogicMgr GetCurrentLogicController];
    if (currentLogicContoller) {
        CBaseContact *m_contact = [currentLogicContoller m_contact];
        if (m_contact) {
            mutalbe_dic[@"sessionUserName"] = [m_contact m_nsUsrName];
        }
    }
    NSLog(@"====》mutalbe_dic：%@", mutalbe_dic);
    
    //执行原始手动调用拆红包逻辑
    %orig;
    
    NSDictionary *m_dicBaseInfo = [m_data m_structDicRedEnvelopesBaseInfo];
    NSString *timingIdentifier = m_dicBaseInfo[@"timingIdentifier"];
    mutalbe_dic[@"timingIdentifier"] = timingIdentifier;
    NSLog(@"====》timingIdentifier:%@", timingIdentifier);
    
    WCPayLogicMgr *payLogic = [serviceCenter getService:[%c(WCPayLogicMgr) class]];
    [payLogic setRealnameReportScene:(unsigned int)1003];
    id subScript = [m_dicBaseInfo objectForKeyedSubscript:@"agree_duty"];
    NSLog(@"====》subScript:%@  subScript.class:%@", subScript, [subScript class]);
    
    //打开红包
    [payLogic checkHongbaoOpenLicense:subScript acceptCallback:^() {
        WCRedEnvelopesLogicMgr *redEvenlopsLogicMgr  = [serviceCenter getService:[%c(WCRedEnvelopesLogicMgr) class]];
        [redEvenlopsLogicMgr OpenRedEnvelopesRequest:mutalbe_dic];
    } denyCallback:^() {
        
    }];
}

%end


#pragma mark - 修改步数
@interface WCDeviceStepObject

@property (nonatomic) unsigned int hkStepCount;
@property (nonatomic) unsigned int m7StepCount;

- (int)getCustomStepCountSource:(NSString *)source origCount:(int)origCount;

@end

%hook WCDeviceStepObject

- (int)m7StepCount {
    return [self getCustomStepCountSource:@"m7StepCount" origCount:%orig];
}

- (int)hkStepCount {
    return [self getCustomStepCountSource:@"hkStepCount" origCount:%orig];
}

%new
- (int)getCustomStepCountSource:(NSString *)source origCount:(int)origCount {
    BOOL isOn = [[HBDefaults objectForKey:WX_SPORT_STEPCOUNT_SWITCH] intValue] == 1;
    int count = [[HBDefaults valueForKey:WX_SPORT_STEPCOUNT] intValue];
    NSLog(@"====》%@-isOn:%d origCount:%d count:%d", source, isOn?1:0, origCount, count);
    if(isOn && count > 0) {
        return count > 88888 ? 88888 : count;
    }
    return origCount;
}

%end


#pragma mark - 在我的页面添加设置入口
%hook MoreViewController

- (void)viewWillAppear:(BOOL)animated {
    %orig;
    HBFloatView *floatView = [HBFloatView sharadInstance];
    floatView.frame = CGRectMake(SCREEN_WIDTH - 70, StatusBarHeight(), 60, 44);
    [self.view addSubview:floatView];
}

%end


#pragma mark - 在聊天界面添加入口
%hook BaseMsgContentViewController

- (void)viewWillAppear:(BOOL)animated {
    %orig;
    HBFloatView *floatView = [HBFloatView sharadInstance];
    floatView.frame = CGRectMake(SCREEN_WIDTH - 100, StatusBarHeight(), 60, 44);
    [self.view addSubview:floatView];
}

- (void)SendEmoticonMesssageToolView:(id)arg1 {
    %log;
    %orig;
}

%end


#pragma mark - 设置骰子点数（无效）
%hook GameController

+ (id)getMD5ByGameContent:(unsigned int)arg1 {
    %log;
    BOOL isOn = [[HBDefaults objectForKey:WX_GAME_POINTCOUNT_SWITCH] intValue] == 1;
    int count = [[HBDefaults objectForKey:WX_GAME_POINTCOUNT] intValue];
    if (isOn) {
        arg1 = count + 3;
    }
    return %orig(arg1);
}

%end
