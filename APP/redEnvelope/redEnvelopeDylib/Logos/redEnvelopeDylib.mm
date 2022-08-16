#line 1 "/Users/hibo/Desktop/redEnvelope/redEnvelopeDylib/Logos/redEnvelopeDylib.xm"


#import"WXHeader.h"
#import "WXRedParamQueue.h"
#import "HBTestPage.h"



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class MMMsgLogicManager; @class WCDeviceStepObject; @class WCRedEnvelopesReceiveHomeView; @class CContactMgr; @class NSMutableDictionary; @class WCBizUtil; @class MMContext; @class WCPayLogicMgr; @class MoreViewController; @class WCRedEnvelopesReceiveControlLogic; @class CMessageMgr; @class WCRedEnvelopesLogicMgr; 
static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, id); static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, id); static void (*_logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void (*_logos_orig$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST, SEL); static int (*_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount)(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static int _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MoreViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL MoreViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$MoreViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL MoreViewController* _LOGOS_SELF_CONST, SEL, BOOL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CContactMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CContactMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCPayLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCPayLogicMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCBizUtil(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCBizUtil"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMContext(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMContext"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMMsgLogicManager(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMMsgLogicManager"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$NSMutableDictionary(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("NSMutableDictionary"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCRedEnvelopesLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCRedEnvelopesLogicMgr"); } return _klass; }
#line 8 "/Users/hibo/Desktop/redEnvelope/redEnvelopeDylib/Logos/redEnvelopeDylib.xm"

static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"%s======>来了",__func__);
    NSDictionary *m_dicBaseInfo = MSHookIvar<NSDictionary *>(self,"m_dicBaseInfo");
    for (id key in m_dicBaseInfo) {
        NSLog(@"key-value: %@ : %@", key, m_dicBaseInfo[key]);
    }
    _logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(self, _cmd);
}



static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, HongBaoRes * arg1, id arg2) {
    NSLog(@"%s======>来了", __func__);
    NSLog(@"======>arg1:%@  arg2:%@", arg1, arg2);
    
    
    
    NSError *err;
    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:arg1.retText.buffer options:NSJSONReadingMutableContainers error:&err];
    NSLog(@"responseDic:%@", responseDic);
    
    if(arg1 != nil && arg2 != nil && arg1.cgiCmdid == 3 &&[responseDic[@"receiveStatus"] integerValue] == 0 ) {
        NSString * timingIdentifier = responseDic[@"timingIdentifier"];
        NSLog(@"timingIdentifier :%@",timingIdentifier);
        NSMutableDictionary * param = [[WXRedParamQueue sharadInstance] dequeue];
        if(param && timingIdentifier && param[@"timingIdentifier"]){
            param[@"timingIdentifier"] = timingIdentifier;
            
            MMServiceCenter *serviceCenter = (MMServiceCenter *)[_logos_static_class_lookup$MMContext() currentContext];
            WCRedEnvelopesLogicMgr * redEvenlopsLogicMgr  = [serviceCenter getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
            if(redEvenlopsLogicMgr) {
                float redTime = [[HBDefaults objectForKey:wx_redEnvelope_openDelay] floatValue];
                redTime = redTime <= 0 ?0.5:redTime;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)redTime * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    
                    [redEvenlopsLogicMgr OpenRedEnvelopesRequest:param];
                });
            }
        }
    } else {
        
    }
    _logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(self, _cmd, arg1, arg2);
}







static void _logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMessageWrap * msgWrap) {
    NSLog(@"%s======>来了",__func__);
    NSLog(@"msgWrap:%@", msgWrap);
    
    if (MSHookIvar <unsigned int>(msgWrap,"m_uiMessageType") != 49) {
        _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, msgWrap);
        return;
    }
    if ([[HBDefaults objectForKey:wx_redEnvelope_openDelay_switch] intValue] == 0) {
        _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, msgWrap);
        NSLog(@"手动抢红包");
        return;
    }
    
    
    NSLog(@"====准备抢红包====");
    NSString *c2cNativeUrl = [[msgWrap m_oWCPayInfoItem] m_c2cNativeUrl];
    NSUInteger len  = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString *nativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    NSDictionary* url_dic = [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:nativeUrl2 separator:@"&"];
    
    NSMutableDictionary* mutable_dic =  [_logos_static_class_lookup$NSMutableDictionary() dictionary];
    mutable_dic[@"msgType"] = @"1";
    mutable_dic[@"sendid"] = url_dic[@"sendid"];
    mutable_dic[@"channelid"] = url_dic[@"channelid"];
    if(msgWrap) {
        mutable_dic[@"nativeUrl"] = c2cNativeUrl;
    }
    
    NSString * nsUsrName = MSHookIvar <NSString *>(msgWrap,"m_nsFromUsr");
    if ( nsUsrName ){
        mutable_dic[@"sessionUserName"] = nsUsrName;
    }
    mutable_dic[@"timingIdentifier"] = @1;

    
    MMServiceCenter *serviceCenter = (MMServiceCenter*)[_logos_static_class_lookup$MMContext() currentContext];
    CContactMgr* contactMgr = [serviceCenter getService:[_logos_static_class_lookup$CContactMgr() class]];
    CContact * selfContact = [contactMgr getSelfContact];
    mutable_dic[@"nickName"] = [selfContact getContactDisplayName];
    mutable_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
    
    
    WXRedParamQueue * paramQueue = [WXRedParamQueue sharadInstance];
    [paramQueue enqueue:mutable_dic];
    NSLog(@"====拆开参数====：%@", mutable_dic);
    
    
    BOOL isGroupReceiver = [msgWrap.m_nsFromUsr rangeOfString:@"@chatroom"].location != NSNotFound;
    NSMutableDictionary* params =  [_logos_static_class_lookup$NSMutableDictionary() dictionary];
    params[@"agreeDuty"] = @"0";
    params[@"inWay"] = isGroupReceiver?@"0":@"1";
    params[@"channelid"] = url_dic[@"channelid"];
    params[@"msgType"] = @"1";
    params[@"nativeUrl"] = c2cNativeUrl;
    params[@"sendId"] = url_dic[@"sendid"];
    NSLog(@"====拆开参数====：%@", params);
    
    
    if (!isGroupReceiver) {
        _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, msgWrap);
        NSLog(@"个人红包不好意思拆");
        return;
    }
    
    
    WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr  = [serviceCenter getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
    [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    
    _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, msgWrap);
}


static void _logos_method$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    NSLog(@"-[<CMessageMgr: %p> onNewSyncNotAddDBMessage:%@]", self, arg1);
    if([[HBDefaults objectForKey:wx_game_deleteMsg_switch] intValue] == 0) {
        _logos_orig$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$(self, _cmd, arg1);
    } else {
        NSLog(@"对方回撤了消息，但被阻止了");
    }
}




static void _logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"%s======>来了", __func__);
    
    
    
    
    WCRedEnvelopesControlData *m_data = MSHookIvar<WCRedEnvelopesControlData *>(self,"m_data");
    CMessageWrap *msgWrap = [m_data m_oSelectedMessageWrap];
    NSLog(@"msgWrap:%@", msgWrap);
    
    
    WCPayInfoItem * payInfoItem  = [msgWrap m_oWCPayInfoItem];
    NSString * c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString * c2cNativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    NSDictionary * url_dic = [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:c2cNativeUrl2 separator:@"&"];
    NSMutableDictionary * mutalbe_dic = [_logos_static_class_lookup$NSMutableDictionary() dictionary];
    mutalbe_dic[@"msgType"] = @"1";
    mutalbe_dic[@"sendId"] = url_dic[@"sendid"];
    mutalbe_dic[@"channelId"] = url_dic[@"channelid"];
    
    
    MMServiceCenter * serviceCenter = (MMServiceCenter *)[_logos_static_class_lookup$MMContext() currentContext];
    Class ccmgr = [_logos_static_class_lookup$CContactMgr() class];
    CContactMgr * contactMgr = [serviceCenter getService:ccmgr];
    CContact * selfContact = [contactMgr getSelfContact];
    id displayName = [selfContact getContactDisplayName];
    mutalbe_dic[@"nickName"] = displayName;
    mutalbe_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
    if (msgWrap) {
        mutalbe_dic[@"nativeUrl"] = c2cNativeUrl;
    }
    
    
    MMMsgLogicManager * redEvenlopsLogicMgr = [serviceCenter getService:[_logos_static_class_lookup$MMMsgLogicManager() class]];
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
    
    
    _logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(self, _cmd);
    
    NSDictionary * m_dicBaseInfo = [m_data m_structDicRedEnvelopesBaseInfo];
    NSString * timingIdentifier = m_dicBaseInfo[@"timingIdentifier"];
    if ([timingIdentifier length]) {
        mutalbe_dic[@"timingIdentifier"] = timingIdentifier;
    }
    NSLog(@"timingIdentifier:%@",timingIdentifier);
    
    WCPayLogicMgr * payLogic = [serviceCenter getService:[_logos_static_class_lookup$WCPayLogicMgr() class]];
    
    [payLogic setRealnameReportScene:(unsigned int)1003];
    id subScript = [m_dicBaseInfo objectForKeyedSubscript:@"agree_duty"];
    NSLog(@"subScript:%@  subScript.class:%@",subScript,[subScript class]);
    
    
    [payLogic checkHongbaoOpenLicense:subScript acceptCallback:^() {
        WCRedEnvelopesLogicMgr * redEvenlopsLogicMgr  = [serviceCenter getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
        [redEvenlopsLogicMgr OpenRedEnvelopesRequest:mutalbe_dic];
    } denyCallback:^() {
        
    }];
}






static int _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BOOL isOn = [[HBDefaults objectForKey:wx_sport_stepCount_switch] intValue] == 1;
    int count = [[HBDefaults valueForKey:wx_sport_stepCount] intValue];
    NSLog(@"m7StepCount-isOn:%d count:%d", isOn?1:0, count);
    if(isOn && count > 0) {
        count = count > 88888 ? 88888 : count;
        return count;
    }
    return _logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount(self, _cmd);
}



static void _logos_method$_ungrouped$MoreViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL MoreViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    _logos_orig$_ungrouped$MoreViewController$viewDidAppear$(self, _cmd, animated);
    [self.view addSubview:[HBTestPage sharadInstance]];
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView = objc_getClass("WCRedEnvelopesReceiveHomeView"); { MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView, @selector(OnOpenRedEnvelopes), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes);}Class _logos_class$_ungrouped$WCRedEnvelopesLogicMgr = objc_getClass("WCRedEnvelopesLogicMgr"); { MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesLogicMgr, @selector(OnWCToHongbaoCommonResponse:Request:), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$);}Class _logos_class$_ungrouped$CMessageMgr = objc_getClass("CMessageMgr"); { MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(onNewSyncAddMessage:), (IMP)&_logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$);}{ MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(onNewSyncNotAddDBMessage:), (IMP)&_logos_method$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$);}Class _logos_class$_ungrouped$WCRedEnvelopesReceiveControlLogic = objc_getClass("WCRedEnvelopesReceiveControlLogic"); { MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveControlLogic, @selector(WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes);}Class _logos_class$_ungrouped$WCDeviceStepObject = objc_getClass("WCDeviceStepObject"); { MSHookMessageEx(_logos_class$_ungrouped$WCDeviceStepObject, @selector(m7StepCount), (IMP)&_logos_method$_ungrouped$WCDeviceStepObject$m7StepCount, (IMP*)&_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount);}Class _logos_class$_ungrouped$MoreViewController = objc_getClass("MoreViewController"); { MSHookMessageEx(_logos_class$_ungrouped$MoreViewController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$MoreViewController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$MoreViewController$viewDidAppear$);}} }
#line 242 "/Users/hibo/Desktop/redEnvelope/redEnvelopeDylib/Logos/redEnvelopeDylib.xm"
