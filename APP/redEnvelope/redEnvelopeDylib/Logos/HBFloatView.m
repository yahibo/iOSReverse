//
//  HBFloatView.m
//  redEnvelopeDylib
//
//  Created by hibo on 2021/12/30.
//

#import "HBFloatView.h"
#import "HBCommon.h"
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
        instance = [[HBFloatView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, StatusBarHeight(), 60, 44)];
    });
    return instance;
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
    HBSettingsController *controller = [HBSettingsController new];
    controller.title = self.setButton.titleLabel.text;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
//    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [rootController presentViewController:nav animated:YES completion:nil];
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
