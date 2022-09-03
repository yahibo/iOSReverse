//
//  ViewController.m
//  MsgSendHook
//
//  Created by hibo on 2022/8/16.
//

#import "ViewController.h"
#import "ASMHook.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *myName;

@end

@implementation ViewController

#pragma mark - 获取hook到的参数
static void view_func(const char *clsName, const char *selector) {
    printf("===hibo== clsName:%s sel:%s\n", clsName, selector);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    hookStart(&view_func);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setName:[ViewController new]];
}

- (void)myFunc {
    
}

- (void)setName:(id)name {
    
}

@end
