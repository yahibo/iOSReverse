//
//  HBCommon.h
//  redEnvelope
//
//  Created by hibo on 2022/12/17.
//

#ifndef HBCommon_h
#define HBCommon_h

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH UIScreen.mainScreen.bounds.size.width
#define SCREEN_HEIGHT UIScreen.mainScreen.bounds.size.height
#define STATUSBAR_HEIGHT (StatusBarHeight())
#define NAV_HEIGHT STATUSBAR_HEIGHT + 44.0

#define keyWindow getKeyWindow()
#define rootController [keyWindow rootViewController]

static CGFloat StatusBarHeight(void) {
    if (@available(iOS 13.0, *)) {
        return UIApplication.sharedApplication.statusBarFrame.size.height;
    }
    return 0;
}

static UIColor *HBSetColor(UIColor *color, UIColor *deepColor) {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight?color:deepColor;
        }];
    } else {
        return color;
    }
}

static UIWindow *getKeyWindow(void) {
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    if (!window) {
        window = UIApplication.sharedApplication.windows.lastObject;
    }
    return window;
}

static void HBToast(NSString *str) {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT/2.0, SCREEN_WIDTH - 40, 100)];
    label.text = str;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    CGRect rect = label.frame;
    label.frame = CGRectMake((SCREEN_WIDTH - rect.size.width)/2.0, (SCREEN_HEIGHT - rect.size.height)/2.0 - 20, rect.size.width + 20, rect.size.height + 20);
    label.layer.cornerRadius = 10;
    label.layer.masksToBounds = YES;
    label.alpha = 0;
    [keyWindow addSubview:label];
    [UIView animateWithDuration:0.2 animations:^{
        label.alpha = 1;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2 animations:^{
            label.alpha = 0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    });
}

#define HBDefaults [NSUserDefaults standardUserDefaults]

#define WX_REDENVELOPE_OPENDELAY        @"WX_REDENVELOPE_OPENDELAY"//拆包延迟时间
#define WX_SPORT_STEPCOUNT              @"WX_SPORT_STEPCOUNT"//运动步数
#define WX_GAME_POINTCOUNT              @"WX_GAME_POINTCOUNT"//骰子点数

#define WX_REDENVELOPE_OPENDELAY_SWITCH @"WX_REDENVELOPE_OPENDELAY_SWITCH"//拆包开关
#define WX_SPORT_STEPCOUNT_SWITCH       @"WX_SPORT_STEPCOUNT_SWITCH"//运动步数开关
#define WX_GAME_POINTCOUNT_SWITCH       @"WX_GAME_POINTCOUNT_SWITCH"//骰子点数开关
#define WX_MESSAGE_DELETED_SWITCH       @"WX_MESSAGE_DELETED_SWITCH"//消息回撤开关

#endif /* HBCommon_h */
