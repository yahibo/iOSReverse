//
//  ViewController.m
//  fishhookDemo
//
//  Created by 杨海波 on 2021/4/5.
//

#import "ViewController.h"
#import "fishhook.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// 1、hook系统log函数
    NSLog(@"fishhook_start");
//    [self exchangeLog];
//    NSLog(@"fishhook_end");
    
    /// 2、hook系统方法交换函数
//    [self exchangeMethodImp];
    
    /// 3、动态库防护-见动态库实现
    ///
    /**
     破解动态库防护：
     1、通过MachOView查看修改动态库可执行文件
     2、找到hook的函数，修改函数名称即“cstring”中的字段，修改data中的十六进制，修改保存，需要重新打开，value字段才会显示已经被修改了
     3、给动态库可执行文件执行权限，将修改过的framework复制到.app中的Frameworks文件下，替换之前的动态库即可
     4、重新运行则原防护代码变为无效
     */
    
    
    //代码防护
//    Method method1 = clZton];
    
    struct rebinding imp;
    imp.name = "random";
    imp.replacement = my_random;
    imp.replaced = &sys_random;
    struct rebinding rebs[1] = {imp};
    rebind_symbols(rebs, 1);
}
long my_random() {
    return 6;
}
/// 存放系统函数地址
static long (*sys_random)();


- (void)loginBtn {
    NSLog(@"%s",__func__);
}

- (void)my_login {
    NSLog(@"%s",__func__);
}

///// 交换系统函数指针
//- (void)exchangeMethodImp {
//    printf("开始交换指针：%s\n",__func__);
//    struct rebinding imp;
//    imp.name = "method_exchangeImplementations";
//    imp.replacement = my_method_imp;
//    imp.replaced = &sys_method_imp;
//    struct rebinding rebs[1] = {imp};
//    rebind_symbols(rebs, 1);
//}

///// 存放系统交换方法函数地址
//static void (*sys_method_imp)(Method method1, Method method2);
///// 替换原系统函数，监控函数是否被调用
//void my_method_imp(Method method1, Method method2) {
//    /// 在此处可以做hook收集统计上报
//    printf("⚠️⚠️⚠️⚠️系统方法交换函数被调用⚠️⚠️⚠️⚠️\n");
//    sys_method_imp(method1, method2);
//}


/// 交换函数指针
- (void)exchangeLog {
    printf("开始交换指针：%s\n",__func__);
    struct rebinding imp;
    imp.name = "NSLog";
    imp.replacement = my_NSLog;
    imp.replaced = &sys_nslog;
    struct rebinding rebs[1] = {imp};
    rebind_symbols(rebs, 1);
}

void my_NSLog(NSString *format, ...) {
    printf("拦截NSLog方法\n");
    sys_nslog(format);
}

/// 存放系统函数地址
static void (*sys_nslog)(NSString *format, ...);

@end
