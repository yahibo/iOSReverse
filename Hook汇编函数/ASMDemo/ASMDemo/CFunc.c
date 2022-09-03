//
//  CFunc.c
//  ASMDemo
//
//  Created by hibo on 2022/9/3.
//

#include "CFunc.h"
#include "fishhook.h"
#include <objc/message.h>

/// 原msgSend函数指针
__unused static id (*orig_objc_msgSend)(id, SEL, ...);

void test_hook_objc_msgSend(id self, SEL sel) {
    orig_objc_msgSend(self, sel);
}

void hookStart(void) {
    struct rebinding reb = {"objc_msgSend", (void *)test_hook_objc_msgSend, (void **)&orig_objc_msgSend};
    struct rebinding rebs[] = {reb};
    rebind_symbols(rebs, sizeof(rebs)/sizeof(reb));
}
