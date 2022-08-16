//
//  HBTestPage.m
//  redEnvelopeDylib
//
//  Created by hibo on 2021/12/30.
//

#import "HBTestPage.h"
#import "HBSettingPageController.h"

#define screen_width UIScreen.mainScreen.bounds.size.width
#define screen_height UIScreen.mainScreen.bounds.size.height

static CGFloat HBTestPageStatusBarHeight(void) {
    if (@available(iOS 13.0, *)) {
        return UIApplication.sharedApplication.statusBarFrame.size.height;
    }
    return 0;
}

@interface HBTestPage ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, assign) BOOL slideFlag;

@end

@implementation HBTestPage

+(instancetype)sharadInstance {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [HBTestPage createHBTestPageWithFrame:CGRectMake(screen_width - 70, HBTestPageStatusBarHeight(), 60, 44)];
    });
    return instance;
}

+ (instancetype)createHBTestPageWithFrame:(CGRect)frame {
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    UITabBarController *tabbar = (UITabBarController*)window.rootViewController;
    UIViewController *ctr = tabbar.viewControllers.firstObject;
    if ([ctr isKindOfClass:UINavigationController.class]) {
        ctr = [(UINavigationController *)ctr viewControllers].firstObject;
    }
    HBTestPage *view = [[HBTestPage alloc] initWithFrame:frame];
    [ctr.view addSubview:view];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.label = [[UILabel alloc] initWithFrame:self.bounds];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.text = @"设置";
        [self addSubview:self.label];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapEvent {
    HBSettingPageController *setPage = [HBSettingPageController new];
    setPage.modalPresentationStyle = UIModalPresentationFullScreen;
    [UIApplication.sharedApplication.delegate.window.rootViewController presentViewController:setPage animated:YES completion:nil];
}

@end
