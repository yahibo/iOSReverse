//
//  HBSettingPageController.m
//  redEnvelopeDylib
//
//  Created by hibo on 2021/12/30.
//

#import "HBSettingPageController.h"
#import "fishhook.h"

@interface HBSettingPageController ()

@property (nonatomic, assign) CGFloat statusBarHeight;
@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, strong) NSArray *tfArr;
@property (nonatomic, strong) NSArray *switchArr;

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation HBSettingPageController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self closeBtn];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight?[UIColor whiteColor]:[UIColor blackColor];
        }];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    [self.view addSubview:self.closeButton];
    [self.closeButton addTarget:self action:@selector(closeBtn) forControlEvents:UIControlEventTouchUpInside];
    
    for (int i = 0; i < self.dataArr.count; i++) {
        NSDictionary *dic = self.dataArr[i];
        UILabel *titLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, self.statusBarHeight + 84 + i*54, 100, 50)];
        titLabel.text = dic[@"title"];
        [self.view addSubview:titLabel];
        CGRect rect = titLabel.frame;
        CGFloat h_x = rect.origin.x + rect.size.width + 20;
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(h_x, rect.origin.y + 5, 140, 40)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.placeholder = dic[@"placeholder"];
        textField.text = dic[@"text"];
        [self.view addSubview:textField];
        if ([dic[@"placeholder"] length] == 0) textField.hidden = YES;
        rect = textField.frame;
        h_x = rect.origin.x + rect.size.width + 20;
        
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(h_x, rect.origin.y + 5, 31, 31)];
        switchView.on = [dic[@"on"] intValue]==1;
        [self.view addSubview:switchView];
        
        textField.tag = i;
        switchView.tag = i;
        [textField addTarget:self action:@selector(tfEvent:) forControlEvents:UIControlEventEditingChanged];
        [switchView addTarget:self action:@selector(swEvent:) forControlEvents:UIControlEventValueChanged];
    }
    
    //骰子控制
    struct rebinding imp = {"random",my_random,(void *)&sys_random};
    struct rebinding rebs[1] = {imp};
    rebind_symbols(rebs, 1);
}

static long (*sys_random)(void);
static long my_random(void) {
    NSLog(@"random()被勾住了");
    BOOL isOn = [[HBDefaults objectForKey:wx_game_pointCount_switch] intValue] == 1;
    int count = [[HBDefaults objectForKey:wx_game_pointCount] intValue];
    count = count < 6 ? count : 6;
    NSLog(@"random-isOn:%d count:%d", isOn?1:0, count);
    if(isOn)
        return count;
    return sys_random();
}

- (void)closeBtn {
    for (int i = 0; i < self.dataArr.count; i++) {
        NSDictionary *dic = self.dataArr[i];
        NSString *keyTf = dic[@"keyTf"];
        NSString *keySw = dic[@"keySw"];
        if (keyTf.length != 0) [HBDefaults setObject:dic[@"text"] forKey:keyTf];
        if (keySw.length != 0) [HBDefaults setObject:dic[@"on"] forKey:keySw];
        [HBDefaults synchronize];
    }
    NSLog(@"dataArr:%@", self.dataArr);
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)tfEvent:(UITextField *)tf {
    NSMutableDictionary *dic = self.dataArr[tf.tag];
    dic[@"text"] = tf.text;

}

- (void)swEvent:(UISwitch *)sw {
    NSMutableDictionary *dic = self.dataArr[sw.tag];
    dic[@"on"] = sw.isOn?@"1":@"0";
}

- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _closeButton.frame = CGRectMake(0, self.statusBarHeight, 60, 44);
        [_closeButton setTitle:@"关闭" forState:UIControlStateNormal];
        _closeButton.titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _closeButton;
}

-(NSArray *)defualtArr {
    NSString *redDelayTime = [HBDefaults objectForKey:wx_redEnvelope_openDelay];
    NSString *stepCount = [HBDefaults objectForKey:wx_sport_stepCount];
    NSString *pointCount = [HBDefaults objectForKey:wx_game_pointCount];
    redDelayTime = redDelayTime?redDelayTime:@"0.5";
    stepCount = stepCount?stepCount:@"12345";
    pointCount = pointCount?pointCount:@"6";
    return @[redDelayTime, stepCount, pointCount, @""];
}
- (NSArray *)switchArr {
    NSString *redDelayTime = [HBDefaults objectForKey:wx_redEnvelope_openDelay_switch];
    NSString *stepCount = [HBDefaults objectForKey:wx_sport_stepCount_switch];
    NSString *pointCount = [HBDefaults objectForKey:wx_game_pointCount_switch];
    NSString *deleteMsg = [HBDefaults objectForKey:wx_game_deleteMsg_switch];
    
    redDelayTime = redDelayTime?redDelayTime:@"0";
    stepCount = stepCount?stepCount:@"0";
    pointCount = pointCount?pointCount:@"1";
    deleteMsg = deleteMsg?deleteMsg:@"1";
    
    return @[redDelayTime, stepCount, pointCount, deleteMsg];
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        NSMutableArray *array = [NSMutableArray array];
        NSArray *titleArr = @[@"自动拆包", @"修改步数", @"设置骰子", @"消息防回撤"];
        NSArray *placeholderArr = @[@"输入延迟时间", @"输入步数", @"输入点数", @""];
        NSArray *keyTfArr = @[wx_redEnvelope_openDelay, wx_sport_stepCount, wx_game_pointCount, @""];
        NSArray *keySwArr = @[wx_redEnvelope_openDelay_switch, wx_sport_stepCount_switch, wx_game_pointCount_switch, wx_game_deleteMsg_switch];
        
        for (int i=0; i<titleArr.count; i++) {
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            dic[@"title"] = titleArr[i];
            dic[@"placeholder"] = placeholderArr[i];
            dic[@"text"] = self.defualtArr[i];
            dic[@"on"] = self.switchArr[i];
            dic[@"keyTf"] = keyTfArr[i];
            dic[@"keySw"] = keySwArr[i];
            [array addObject:dic];
        }
        _dataArr = array;
    }
    return _dataArr;
}

- (CGFloat)statusBarHeight {
    if (@available(iOS 13.0, *)) {
        return UIApplication.sharedApplication.statusBarFrame.size.height;
    }
    return 0;
}

@end
