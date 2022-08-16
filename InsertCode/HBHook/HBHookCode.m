//
//  HBHookCode.m
//  HBHook
//
//  Created by hibo on 2022/1/15.
//

#import "HBHookCode.h"
#import <objc/message.h>

@implementation HBHookCode

+ (void)load {
    NSLog(@"注入成功");
    [self modifyWxStep];
}

//修改微信步数
+ (void)modifyWxStep {
    Class class = objc_getClass("WCDeviceStepObject");
    SEL select = sel_registerName("m7StepCount");
    
    Method method = class_getInstanceMethod(class, select);
    const char *typeEncoding = method_getTypeEncoding(method);
    NSLog(@"typeEncoding:%s",typeEncoding);
    class_replaceMethod(class, select, (IMP)my_m7StepCount, typeEncoding);
}

int my_m7StepCount(id self, SEL _cmd) {
    return 56382;
}

@end
