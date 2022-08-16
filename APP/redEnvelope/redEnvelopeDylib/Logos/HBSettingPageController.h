//
//  HBSettingPageController.h
//  redEnvelopeDylib
//
//  Created by hibo on 2021/12/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define HBDefaults [NSUserDefaults standardUserDefaults]

#define wx_redEnvelope_openDelay        @"wx_redEnvelope_openDelay"//拆包延迟时间
#define wx_sport_stepCount              @"wx_sport_stepCount"//运动步数
#define wx_game_pointCount              @"wx_game_pointCount"//骰子点数

#define wx_redEnvelope_openDelay_switch @"wx_redEnvelope_openDelay_switch"//拆包开关
#define wx_sport_stepCount_switch       @"wx_sport_stepCount_switch"//运动步数开关
#define wx_game_pointCount_switch       @"wx_game_pointCount_switch"//骰子点数开关
#define wx_game_deleteMsg_switch        @"wx_game_deleteMsg_switch"//消息回撤开关

@interface HBSettingPageController : UIViewController

@end

NS_ASSUME_NONNULL_END
