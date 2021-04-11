//
//  ReverseHook.m
//  ReverseGuard
//
//  Created by 杨海波 on 2021/4/5.
//

#import "ReverseHook.h"
#import <objc/runtime.h>
#import "fishhook.h"

@implementation ReverseHook

+ (void)load {
    NSLog(@"开始防护");
    [self exchangeMethodImp];
}
/// 交换系统函数指针
+ (void)exchangeMethodImp {
    printf("开始交换指针：%s\n",__func__);
    struct rebinding imp;
    imp.name = "method_exchangeImplementations";
    imp.replacement = my_method_imp;
    imp.replaced = &sys_method_imp;
    struct rebinding rebs[1] = {imp};
    rebind_symbols(rebs, 1);
}

/// 存放系统交换方法函数地址
static void (*sys_method_imp)(Method method1, Method method2);
/// 替换原系统函数，监控函数是否被调用
void my_method_imp(Method method1, Method method2) {
    /// 在此处可以做hook收集统计上报
    printf("⚠️⚠️⚠️⚠️系统方法交换函数被调用⚠️⚠️⚠️⚠️\n");
    /// 注释该函数，逆向hook将不再生效
    sys_method_imp(method1, method2);
}

@end
