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

static void view_func(id param) {
    NSString *_param = [NSString stringWithFormat:@"%@", param];
    NSLog(@"===hibo== param:%@", _param);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    hookStart(&view_func);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self myFunc];
    [self setName:[ViewController new]];
}

- (void)myFunc {
    
}

- (void)setName:(id)name {
    
}

@end
