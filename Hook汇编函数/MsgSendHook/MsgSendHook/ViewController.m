//
//  ViewController.m
//  MsgSendHook
//
//  Created by hibo on 2022/8/16.
//

#import "ViewController.h"
#import "ASMHook.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    hookStart();
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self myFunc];
}

- (void)myFunc {
    
}

@end
