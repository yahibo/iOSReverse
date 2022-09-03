//
//  Insert.m
//  WCDemo
//
//  Created by 杨海波 on 2021/4/18.
//

#import "Insert.h"
#import "fishhook.h"

@implementation Insert

- (instancetype)init {
    self = [super init];
    if (self) {
        struct rebinding imp;
        imp.name = "random";
        imp.replacement = my_random;
        imp.replaced = &sys_random;
        struct rebinding rebs[1] = {imp};
        rebind_symbols(rebs, 1);
    }
    return self;
}
long my_random(void) {
    return 6;
}
/// 存放系统函static static 数地址
static long (*sys_random)(void);

@end
