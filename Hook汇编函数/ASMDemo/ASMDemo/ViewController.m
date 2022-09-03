//
//  ViewController.m
//  ASMDemo
//
//  Created by hibo on 2022/9/3.
//

#import "ViewController.h"
#include "fishhook.h"
#include "CFunc.h"

@interface ViewController ()

@end

int sumFunc(int a, int b) {
    return a + b;
}

int sumFuncAsm(int a, int b);

@implementation ViewController

/// 原msgSend函数指针
__unused static id (*orig_objc_msgSend)(id, SEL, ...);

void test_hook_objc_msgSend(id self, SEL sel) {
    orig_objc_msgSend(self, sel);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    int res = sumFunc(1, 2);
//    printf("res:%d\n", res);
//    
//    res = sumFuncAsm(1, 2);
//    printf("res:%d\n", res);
    
//    normalFunc(1, 2);
//    nakedFunc(1, 2);
    
    //hook msgSend
//    hookStart();
    test1Func();
    
    struct rebinding reb = {"objc_msgSend", (void *)test_hook_objc_msgSend, (void **)&orig_objc_msgSend};
    struct rebinding rebs[] = {reb};
    rebind_symbols(rebs, sizeof(rebs)/sizeof(reb));
}

void test1Func(void) {
    test2Func();
    test3Func();
}

void test2Func(void) {
    
}

void test3Func(void) {
    
}

/// 普通函数
void normalFunc(int a, int b) {
    
}

/// 裸函数，不会生成bl、ret指令
__attribute__((__naked__))
void nakedFunc(int a, int b) {
    
}

@end
