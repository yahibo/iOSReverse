//
//  WXHeader.h
//  redEnvelopeDylib
//
//  Created by hibo on 2021/12/30.
//

#ifndef WXHeader_h
#define WXHeader_h

#import <UIKit/UIKit.h>
#import "HBSettingPageController.h"

/// 相关界面
@interface MMTableViewInfo
- (long long)numberOfSectionsInTableView:(id)arg1;
@end


@interface WCRedEnvelopesReceiveHomeView {
    id m_delegate;
    NSDictionary *m_dicBaseInfo;
}
@end


@interface WCPayInfoItem :NSObject
@property(retain, nonatomic) NSString *m_c2cNativeUrl;
@end


@interface CMessageWrap :NSObject
@property(retain, nonatomic) WCPayInfoItem *m_oWCPayInfoItem;
@property(retain, nonatomic) NSString *m_nsFromUsr;
@end


@interface WCRedEnvelopesControlData :NSObject
@property(retain, nonatomic) CMessageWrap *m_oSelectedMessageWrap;
@property(retain, nonatomic) NSDictionary *m_structDicRedEnvelopesBaseInfo;
@end


@interface WCRedEnvelopesControlLogic {
    WCRedEnvelopesControlData *m_data;
}
@end


@interface WCRedEnvelopesReceiveControlLogic:WCRedEnvelopesControlLogic

@end


@interface WCBizUtil: NSObject
+ (id)dictionaryWithDecodedComponets:(id)arg1 separator:(id)arg2;
@end


@interface MMServiceCenter
+(id)defaultCenter;
-(id)getService:(Class)arg1;
@end


@interface MMMsgLogicManager
-(id)GetCurrentLogicController;
@end


@interface WeixinContentLogicController
-(id)m_contact;
@end


@interface CContactMgr
-(id)getSelfContact;
@end


@interface CBaseContact
@property(retain, nonatomic) NSString *m_nsHeadImgUrl;
@property(retain, nonatomic) NSString *m_nsUsrName;
@end


@interface CContact :CBaseContact
-(id)getContactDisplayName;
@end


@interface WCPayLogicMgr
- (void)setRealnameReportScene:(unsigned int)arg1;
- (void)checkHongbaoOpenLicense:(id)arg1 acceptCallback:(void(^)())arg2 denyCallback:(void(^)())arg3;
@end


@interface BaseResponse
@property(nonatomic) int ret; // @dynamic ret;
@end


@interface SKBuiltinBuffer_t
@property(retain, nonatomic) NSData *buffer; // @dynamic buffer;
@property(nonatomic) unsigned int iLen; // @dynamic iLen;
@end


@interface HongBaoRes
@property(retain, nonatomic) BaseResponse *baseResponse; // @d
@property(retain, nonatomic) SKBuiltinBuffer_t *retText; // @dynamic retText;
@property(nonatomic) int cgiCmdid; // @dynamic cgiCmdid;
@property(retain, nonatomic) NSString *errorMsg; // @dynamic errorMsg;
@property(nonatomic) int errorType; // @dynamic errorType;
@property(retain, nonatomic) NSString *platMsg; // @dynamic platMsg;
@property(nonatomic) int platRet;
@end

@interface WCRedEnvelopesLogicMgr
-(void)OpenRedEnvelopesRequest:(id)dic;
- (void)ReceiverQueryRedEnvelopesRequest:(id)arg1;
- (void)OnWCToHongbaoCommonResponse:(HongBaoRes *)arg1 Request:(id)arg2;
@end

@interface MoreViewController : UIViewController

@end

#endif /* WXHeader_h */
