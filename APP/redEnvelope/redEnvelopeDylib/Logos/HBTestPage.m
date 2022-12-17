//
//  HBFloatView.m
//  redEnvelopeDylib
//
//  Created by hibo on 2021/12/30.
//

#import "HBFloatView.h"
#import "WXHeader.h"
#import "HBSettingsController.h"

@interface HBFloatView ()

@property (nonatomic, strong) UIButton *setButton;
@property (nonatomic, assign) BOOL slideFlag;

@end

@implementation HBFloatView

+(instancetype)sharadInstance {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [HBFloatView createHBFloatViewWithFrame:CGRectMake(SCREEN_WIDTH - 70, StatusBarHeight(), 60, 44)];
    });
    return instance;
}

+ (instancetype)createHBFloatViewWithFrame:(CGRect)frame {
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    UITabBarController *tabbar = (UITabBarController*)window.rootViewController;
    UIViewController *ctr = tabbar.viewControllers.firstObject;
    if ([ctr isKindOfClass:UINavigationController.class]) {
        ctr = [(UINavigationController *)ctr viewControllers].firstObject;
    }
    HBFloatView *view = [[HBFloatView alloc] initWithFrame:frame];
    [ctr.view addSubview:view];
    return view;
}

+ (void)HBToast:(NSString *)str {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT/2.0, SCREEN_WIDTH - 40, 100)];
    label.text = [NSString stringWithFormat:@"  %@  ", str];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    CGRect rect = label.frame;
    label.frame = CGRectMake((SCREEN_WIDTH - rect.size.width)/2.0, (SCREEN_HEIGHT - rect.size.height)/2.0, rect.size.width +10, rect.size.height + 20);
    label.layer.cornerRadius = 10;
    label.layer.masksToBounds = YES;
    
    UIWindow *window = UIApplication.sharedApplication.windows.lastObject;
    [window addSubview:label];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [label removeFromSuperview];
    });
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.setButton.frame = self.bounds;
        [self.setButton addTarget:self action:@selector(setClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.setButton];
    }
    return self;
}

- (void)setClick {
    HBSettingsController *setPage = [HBSettingsController new];
    setPage.title = self.setButton.titleLabel.text;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:setPage];
//    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [RootController presentViewController:nav animated:YES completion:nil];
}

- (UIButton *)setButton {
    if (!_setButton) {
        _setButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_setButton setTitleColor:HBSetColor([UIColor blackColor], [UIColor whiteColor]) forState:UIControlStateNormal];
        [_setButton setTitle:@"设置" forState:UIControlStateNormal];
    }
    return _setButton;
}

@end
