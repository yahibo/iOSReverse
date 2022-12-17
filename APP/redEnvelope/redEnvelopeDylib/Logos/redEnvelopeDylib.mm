#line 1 "/Users/hibo/Documents/iOSReverse/APP/redEnvelope/redEnvelopeDylib/Logos/redEnvelopeDylib.xm"


#import "WXHeader.h"
#import "WXRedParamQueue.h"
#import "HBFloatView.h"


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

@class MoreViewController; @class WCRedEnvelopesReceiveControlLogic; @class WCBizUtil; @class WCRedEnvelopesLogicMgr; @class CMessageMgr; @class GameController; @class NSMutableDictionary; @class MMMsgLogicManager; @class CContactMgr; @class WCDeviceStepObject; @class BaseMsgContentViewController; @class WCRedEnvelopesReceiveHomeView; @class WCPayLogicMgr; @class MMContext; 
static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, id); static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, id); static void (*_logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void (*_logos_orig$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST, SEL); static int (*_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount)(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static int _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static int (*_logos_orig$_ungrouped$WCDeviceStepObject$hkStepCount)(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static int _logos_method$_ungrouped$WCDeviceStepObject$hkStepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static int _logos_method$_ungrouped$WCDeviceStepObject$getCustomStepCountSource$origCount$(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL, NSString *, int); static void (*_logos_orig$_ungrouped$MoreViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL MoreViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$MoreViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL MoreViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$BaseMsgContentViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$BaseMsgContentViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$BaseMsgContentViewController$SendEmoticonMesssageToolView$)(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$BaseMsgContentViewController$SendEmoticonMesssageToolView$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$GameController$getMD5ByGameContent$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned int); static id _logos_meta_method$_ungrouped$GameController$getMD5ByGameContent$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned int); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCBizUtil(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCBizUtil"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCRedEnvelopesLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCRedEnvelopesLogicMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CContactMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CContactMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMMsgLogicManager(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMMsgLogicManager"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$NSMutableDictionary(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("NSMutableDictionary"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCPayLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCPayLogicMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMContext(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMContext"); } return _klass; }
#line 7 "/Users/hibo/Documents/iOSReverse/APP/redEnvelope/redEnvelopeDylib/Logos/redEnvelopeDylib.xm"
#pragma mark - 红包页面


static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"-[<WCRedEnvelopesReceiveHomeView: %p> OnOpenRedEnvelopes]", self);
    NSDictionary *m_dicBaseInfo = MSHookIvar<NSDictionary *>(self,"m_dicBaseInfo");
    NSLog(@"====》m_dicBaseInfo:%@", m_dicBaseInfo);
    _logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(self, _cmd);
}




#pragma mark - 开红包逻辑


static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, HongBaoRes * arg1, id arg2) {
    NSLog(@"-[<WCRedEnvelopesLogicMgr: %p> OnWCToHongbaoCommonResponse:%@ Request:%@]", self, arg1, arg2);


    
    NSError *err;
    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:arg1.retText.buffer options:NSJSONReadingMutableContainers error:&err];
    NSLog(@"====》responseDic:%@", responseDic);
    NSInteger receiveStatus = [responseDic[@"receiveStatus"] integerValue];
    
    if(arg1 != nil && arg2 != nil && arg1.cgiCmdid == 3 && receiveStatus == 0 ) {
        NSString *timingIdentifier = responseDic[@"timingIdentifier"];
        NSMutableDictionary *param = [[WXRedParamQueue sharadInstance] dequeue];
        if(param && timingIdentifier && param[@"timingIdentifier"]){
            param[@"timingIdentifier"] = timingIdentifier;
            
            MMServiceCenter *serviceCenter = (MMServiceCenter *)[_logos_static_class_lookup$MMContext() currentContext];
            WCRedEnvelopesLogicMgr *redEvenlopsLogicMgr  = [serviceCenter getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
            if(redEvenlopsLogicMgr) {
                float redTime = [[HBDefaults objectForKey:WX_REDENVELOPE_OPENDELAY] floatValue];
                redTime = redTime <= 0 ?0.5:redTime;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)redTime *NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    
                    [redEvenlopsLogicMgr OpenRedEnvelopesRequest:param];
                });
            }
        }
    } else {
        
    }
    _logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(self, _cmd, arg1, arg2);
}




#pragma mark - 新消息处理

static void _logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMessageWrap * msgWrap) {
    NSLog(@"-[<CMessageMgr: %p> onNewSyncAddMessage:%@]", self, msgWrap);
    if (MSHookIvar <unsigned int>(msgWrap, "m_uiMessageType") != 49) {
        _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, msgWrap);
        return;
    }
    
    if ([[HBDefaults objectForKey:WX_REDENVELOPE_OPENDELAY_SWITCH] intValue] == 0) {
        NSLog(@"====》手动抢红包");
        _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, msgWrap);
        return;
    }
    
    NSLog(@"====》准备抢红包");
    NSString *c2cNativeUrl = [[msgWrap m_oWCPayInfoItem] m_c2cNativeUrl];
    NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString *nativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    NSDictionary* url_dic = [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:nativeUrl2 separator:@"&"];
    
    NSMutableDictionary* mutable_dic =  [_logos_static_class_lookup$NSMutableDictionary() dictionary];
    mutable_dic[@"msgType"] = @"1";
    mutable_dic[@"sendid"] = url_dic[@"sendid"];
    mutable_dic[@"channelid"] = url_dic[@"channelid"];
    if(msgWrap) {
        mutable_dic[@"nativeUrl"] = c2cNativeUrl;
    }
    
    NSString *nsUsrName = MSHookIvar <NSString *>(msgWrap,"m_nsFromUsr");
    if ( nsUsrName ){
        mutable_dic[@"sessionUserName"] = nsUsrName;
    }
    mutable_dic[@"timingIdentifier"] = @"13f1c921a5c03d2e2352c44563ee83a2";

    
    MMServiceCenter *serviceCenter = (MMServiceCenter*)[_logos_static_class_lookup$MMContext() currentContext];
    CContactMgr* contactMgr = [serviceCenter getService:[_logos_static_class_lookup$CContactMgr() class]];
    CContact *selfContact = [contactMgr getSelfContact];
    mutable_dic[@"nickName"] = [selfContact getContactDisplayName];
    mutable_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
    
    
    WXRedParamQueue *paramQueue = [WXRedParamQueue sharadInstance];
    [paramQueue enqueue:mutable_dic];
    NSLog(@"====》拆开参数：%@", mutable_dic);
    
    
    BOOL isGroupReceiver = [msgWrap.m_nsFromUsr rangeOfString:@"@chatroom"].location != NSNotFound;
    NSMutableDictionary* params =  [_logos_static_class_lookup$NSMutableDictionary() dictionary];
    params[@"agreeDuty"] = @"0";
    params[@"inWay"] = isGroupReceiver?@"0":@"1";
    params[@"channelid"] = url_dic[@"channelid"];
    params[@"msgType"] = @"1";
    params[@"nativeUrl"] = c2cNativeUrl;
    params[@"sendId"] = url_dic[@"sendid"];
    NSLog(@"====》拆开参数：%@", params);
    
    
    int count = [[HBDefaults valueForKey:WX_SPORT_STEPCOUNT] intValue];
    if (!isGroupReceiver && count != 12345) {
        _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, msgWrap);
        NSLog(@"====》个人红包不好意思拆");
        return;
    }
    
    
    WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr  = [serviceCenter getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
    [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    
    _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, msgWrap);
}

#pragma mark - 撤销一条消息
static void _logos_method$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMessageWrap * msgWrap) {
    NSLog(@"-[<CMessageMgr: %p> onNewSyncNotAddDBMessage:%@]", self, msgWrap);
    if([[HBDefaults objectForKey:WX_MESSAGE_DELETED_SWITCH] intValue] == 1) {
        NSLog(@"====》对方回撤了消息，但被阻止了");
        NSString *str = [NSString stringWithFormat:@"\"%@\"想撤回一条消息，被我拒绝了", [msgWrap m_nsPushTitle]];
        HBToast(str);
    } else {
        _logos_orig$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$(self, _cmd, msgWrap);
    }
}



#pragma mark - 接收红包控制逻辑


static void _logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"-[<WCRedEnvelopesReceiveControlLogic: %p> WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes]", self);
    _logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(self, _cmd);
    return;
    
    
    WCRedEnvelopesControlData *m_data = MSHookIvar<WCRedEnvelopesControlData *>(self,"m_data");
    CMessageWrap *msgWrap = [m_data m_oSelectedMessageWrap];
    NSLog(@"====》msgWrap:%@", msgWrap);
    
    
    WCPayInfoItem *payInfoItem  = [msgWrap m_oWCPayInfoItem];
    NSString *c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString *c2cNativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    NSDictionary *url_dic = [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:c2cNativeUrl2 separator:@"&"];
    NSMutableDictionary *mutalbe_dic = [_logos_static_class_lookup$NSMutableDictionary() dictionary];
    mutalbe_dic[@"msgType"] = @"1";
    mutalbe_dic[@"sendId"] = url_dic[@"sendid"];
    mutalbe_dic[@"channelId"] = url_dic[@"channelid"];
    
    
    MMServiceCenter *serviceCenter = (MMServiceCenter *)[_logos_static_class_lookup$MMContext() currentContext];
    Class ccmgr = [_logos_static_class_lookup$CContactMgr() class];
    CContactMgr *contactMgr = [serviceCenter getService:ccmgr];
    CContact *selfContact = [contactMgr getSelfContact];
    id displayName = [selfContact getContactDisplayName];
    mutalbe_dic[@"nickName"] = displayName;
    mutalbe_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
    if (msgWrap) {
        mutalbe_dic[@"nativeUrl"] = c2cNativeUrl;
    }
    
    
    MMMsgLogicManager *redEvenlopsLogicMgr = [serviceCenter getService:[_logos_static_class_lookup$MMMsgLogicManager() class]];
    WeixinContentLogicController *currentLogicContoller  = [redEvenlopsLogicMgr GetCurrentLogicController];
    if (currentLogicContoller) {
        CBaseContact *m_contact = [currentLogicContoller m_contact];
        if (m_contact) {
            mutalbe_dic[@"sessionUserName"] = [m_contact m_nsUsrName];
        }
    }
    NSLog(@"====》mutalbe_dic：%@", mutalbe_dic);
    
    
    _logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(self, _cmd);
    
    NSDictionary *m_dicBaseInfo = [m_data m_structDicRedEnvelopesBaseInfo];
    NSString *timingIdentifier = m_dicBaseInfo[@"timingIdentifier"];
    mutalbe_dic[@"timingIdentifier"] = timingIdentifier;
    NSLog(@"====》timingIdentifier:%@", timingIdentifier);
    
    WCPayLogicMgr *payLogic = [serviceCenter getService:[_logos_static_class_lookup$WCPayLogicMgr() class]];
    [payLogic setRealnameReportScene:(unsigned int)1003];
    id subScript = [m_dicBaseInfo objectForKeyedSubscript:@"agree_duty"];
    NSLog(@"====》subScript:%@  subScript.class:%@", subScript, [subScript class]);
    
    
    [payLogic checkHongbaoOpenLicense:subScript acceptCallback:^() {
        WCRedEnvelopesLogicMgr *redEvenlopsLogicMgr  = [serviceCenter getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
        [redEvenlopsLogicMgr OpenRedEnvelopesRequest:mutalbe_dic];
    } denyCallback:^() {
        
    }];
}




#pragma mark - 修改步数
@interface WCDeviceStepObject

@property (nonatomic) unsigned int hkStepCount;
@property (nonatomic) unsigned int m7StepCount;

- (int)getCustomStepCountSource:(NSString *)source origCount:(int)origCount;

@end



static int _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [self getCustomStepCountSource:@"m7StepCount" origCount:_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount(self, _cmd)];
}

static int _logos_method$_ungrouped$WCDeviceStepObject$hkStepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [self getCustomStepCountSource:@"hkStepCount" origCount:_logos_orig$_ungrouped$WCDeviceStepObject$hkStepCount(self, _cmd)];
}


static int _logos_method$_ungrouped$WCDeviceStepObject$getCustomStepCountSource$origCount$(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * source, int origCount) {
    BOOL isOn = [[HBDefaults objectForKey:WX_SPORT_STEPCOUNT_SWITCH] intValue] == 1;
    int count = [[HBDefaults valueForKey:WX_SPORT_STEPCOUNT] intValue];
    NSLog(@"====》%@-isOn:%d origCount:%d count:%d", source, isOn?1:0, origCount, count);
    if(isOn && count > 0) {
        return count > 88888 ? 88888 : count;
    }
    return origCount;
}




#pragma mark - 在我的页面添加设置入口


static void _logos_method$_ungrouped$MoreViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL MoreViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    _logos_orig$_ungrouped$MoreViewController$viewWillAppear$(self, _cmd, animated);
    HBFloatView *floatView = [HBFloatView sharadInstance];
    floatView.frame = CGRectMake(SCREEN_WIDTH - 70, StatusBarHeight(), 60, 44);
    [self.view addSubview:floatView];
}




#pragma mark - 在聊天界面添加入口


static void _logos_method$_ungrouped$BaseMsgContentViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    _logos_orig$_ungrouped$BaseMsgContentViewController$viewWillAppear$(self, _cmd, animated);
    HBFloatView *floatView = [HBFloatView sharadInstance];
    floatView.frame = CGRectMake(SCREEN_WIDTH - 100, StatusBarHeight(), 60, 44);
    [self.view addSubview:floatView];
}

static void _logos_method$_ungrouped$BaseMsgContentViewController$SendEmoticonMesssageToolView$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    NSLog(@"-[<BaseMsgContentViewController: %p> SendEmoticonMesssageToolView:%@]", self, arg1);
    _logos_orig$_ungrouped$BaseMsgContentViewController$SendEmoticonMesssageToolView$(self, _cmd, arg1);
}




#pragma mark - 设置骰子点数（无效）


static id _logos_meta_method$_ungrouped$GameController$getMD5ByGameContent$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned int arg1) {
    NSLog(@"+[<GameController: %p> getMD5ByGameContent:%u]", self, arg1);
    BOOL isOn = [[HBDefaults objectForKey:WX_GAME_POINTCOUNT_SWITCH] intValue] == 1;
    int count = [[HBDefaults objectForKey:WX_GAME_POINTCOUNT] intValue];
    if (isOn) {
        arg1 = count + 3;
    }
    return _logos_meta_orig$_ungrouped$GameController$getMD5ByGameContent$(self, _cmd, arg1);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView = objc_getClass("WCRedEnvelopesReceiveHomeView"); { MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView, @selector(OnOpenRedEnvelopes), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes);}Class _logos_class$_ungrouped$WCRedEnvelopesLogicMgr = objc_getClass("WCRedEnvelopesLogicMgr"); { MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesLogicMgr, @selector(OnWCToHongbaoCommonResponse:Request:), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$);}Class _logos_class$_ungrouped$CMessageMgr = objc_getClass("CMessageMgr"); { MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(onNewSyncAddMessage:), (IMP)&_logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$);}{ MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(onNewSyncNotAddDBMessage:), (IMP)&_logos_method$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$onNewSyncNotAddDBMessage$);}Class _logos_class$_ungrouped$WCRedEnvelopesReceiveControlLogic = objc_getClass("WCRedEnvelopesReceiveControlLogic"); { MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveControlLogic, @selector(WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes);}Class _logos_class$_ungrouped$WCDeviceStepObject = objc_getClass("WCDeviceStepObject"); { MSHookMessageEx(_logos_class$_ungrouped$WCDeviceStepObject, @selector(m7StepCount), (IMP)&_logos_method$_ungrouped$WCDeviceStepObject$m7StepCount, (IMP*)&_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount);}{ MSHookMessageEx(_logos_class$_ungrouped$WCDeviceStepObject, @selector(hkStepCount), (IMP)&_logos_method$_ungrouped$WCDeviceStepObject$hkStepCount, (IMP*)&_logos_orig$_ungrouped$WCDeviceStepObject$hkStepCount);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'i'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); _typeEncoding[i] = 'i'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WCDeviceStepObject, @selector(getCustomStepCountSource:origCount:), (IMP)&_logos_method$_ungrouped$WCDeviceStepObject$getCustomStepCountSource$origCount$, _typeEncoding); }Class _logos_class$_ungrouped$MoreViewController = objc_getClass("MoreViewController"); { MSHookMessageEx(_logos_class$_ungrouped$MoreViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$MoreViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$MoreViewController$viewWillAppear$);}Class _logos_class$_ungrouped$BaseMsgContentViewController = objc_getClass("BaseMsgContentViewController"); { MSHookMessageEx(_logos_class$_ungrouped$BaseMsgContentViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$BaseMsgContentViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$BaseMsgContentViewController$viewWillAppear$);}{ MSHookMessageEx(_logos_class$_ungrouped$BaseMsgContentViewController, @selector(SendEmoticonMesssageToolView:), (IMP)&_logos_method$_ungrouped$BaseMsgContentViewController$SendEmoticonMesssageToolView$, (IMP*)&_logos_orig$_ungrouped$BaseMsgContentViewController$SendEmoticonMesssageToolView$);}Class _logos_class$_ungrouped$GameController = objc_getClass("GameController"); Class _logos_metaclass$_ungrouped$GameController = object_getClass(_logos_class$_ungrouped$GameController); { MSHookMessageEx(_logos_metaclass$_ungrouped$GameController, @selector(getMD5ByGameContent:), (IMP)&_logos_meta_method$_ungrouped$GameController$getMD5ByGameContent$, (IMP*)&_logos_meta_orig$_ungrouped$GameController$getMD5ByGameContent$);}} }
#line 297 "/Users/hibo/Documents/iOSReverse/APP/redEnvelope/redEnvelopeDylib/Logos/redEnvelopeDylib.xm"
