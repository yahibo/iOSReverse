//
//  HBSettingsController.m
//  redEnvelopeDylib
//
//  Created by hibo on 2021/12/30.
//

#import "HBSettingsController.h"
#import "HBCommon.h"
#import "fishhook.h"

@interface HBSettingsController ()

@property (nonatomic, strong) NSArray *tfArr;
@property (nonatomic, strong) NSArray *switchArr;

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation HBSettingsController

+ (void)load {
    //骰子控制
    struct rebinding imp = {"arc4random", my_arc4random,(void *)&sys_arc4random};
    struct rebinding rebs[1] = {imp};
    rebind_symbols(rebs, 1);
}

static long (*sys_arc4random)(void);
static long my_arc4random(void) {
    NSLog(@"arc4random()被勾住了");
    BOOL isOn = [[HBDefaults objectForKey:WX_GAME_POINTCOUNT_SWITCH] intValue] == 1;
    int count = [[HBDefaults objectForKey:WX_GAME_POINTCOUNT] intValue] - 1;
    count = count < 5 ? count : 5;
    NSLog(@"arc4random-isOn:%d count:%d", isOn?1:0, count);
    if(isOn)
        return count;
    return sys_arc4random();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HBSetColor([UIColor whiteColor], [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1]);
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(doneEvent)];
    [rightBar setTitleTextAttributes:@{NSForegroundColorAttributeName:HBSetColor([UIColor blackColor], [UIColor whiteColor])} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    for (int i = 0; i < self.dataArr.count; i++) {
        NSDictionary *dic = self.dataArr[i];
        CGFloat y = NAV_HEIGHT + 20 + i*50;
        UILabel *titLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, y, 100, 40)];
        titLabel.text = dic[@"title"];
        [self.view addSubview:titLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(130, y, SCREEN_WIDTH - 230, 40)];
        textField.text = dic[@"text"];
        textField.placeholder = dic[@"placeholder"];
        textField.hidden = [dic[@"placeholder"] length] == 0;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.keyboardType = UIKeyboardTypeDecimalPad;
        [self.view addSubview:textField];
        
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, y - 5, 50, 50)];
        switchView.on = [dic[@"on"] intValue]==1;
        [self.view addSubview:switchView];
        
        textField.tag = i;
        switchView.tag = i;
        [textField addTarget:self action:@selector(tfEvent:) forControlEvents:UIControlEventEditingChanged];
        [switchView addTarget:self action:@selector(swEvent:) forControlEvents:UIControlEventValueChanged];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self saveSettings];
}

- (void)doneEvent {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveSettings {
    for (int i = 0; i < self.dataArr.count; i++) {
        NSDictionary *dic = self.dataArr[i];
        NSString *keyTf = dic[@"keyTf"];
        NSString *keySw = dic[@"keySw"];
        if (keyTf.length != 0) [HBDefaults setObject:dic[@"text"] forKey:keyTf];
        if (keySw.length != 0) [HBDefaults setObject:dic[@"on"] forKey:keySw];
    }
    [HBDefaults synchronize];
    NSLog(@"====》dataArr:%@", self.dataArr);
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

- (NSArray *)defualtArr {
    NSString *redDelayTime = [HBDefaults objectForKey:WX_REDENVELOPE_OPENDELAY];
    NSString *stepCount = [HBDefaults objectForKey:WX_SPORT_STEPCOUNT];
    NSString *pointCount = [HBDefaults objectForKey:WX_GAME_POINTCOUNT];
    redDelayTime = redDelayTime?redDelayTime:@"0.5";
    stepCount = stepCount?stepCount:@"12345";
    pointCount = pointCount?pointCount:@"6";
    return @[redDelayTime, stepCount, pointCount, @""];
}
- (NSArray *)switchArr {
    NSString *redDelayTime = [HBDefaults objectForKey:WX_REDENVELOPE_OPENDELAY_SWITCH];
    NSString *stepCount = [HBDefaults objectForKey:WX_SPORT_STEPCOUNT_SWITCH];
    NSString *pointCount = [HBDefaults objectForKey:WX_GAME_POINTCOUNT_SWITCH];
    NSString *deleteMsg = [HBDefaults objectForKey:WX_MESSAGE_DELETED_SWITCH];
    
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
        NSArray *keyTfArr = @[WX_REDENVELOPE_OPENDELAY, WX_SPORT_STEPCOUNT, WX_GAME_POINTCOUNT, @""];
        NSArray *keySwArr = @[WX_REDENVELOPE_OPENDELAY_SWITCH, WX_SPORT_STEPCOUNT_SWITCH, WX_GAME_POINTCOUNT_SWITCH, WX_MESSAGE_DELETED_SWITCH];
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

@end
