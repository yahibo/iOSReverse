//
//  ASMHook.c
//  MsgSendHook
//
//  Created by hibo on 2022/8/16.
//

#include "ASMHook.h"
#include <objc/message.h>
#include <pthread/pthread.h>
#include <dispatch/dispatch.h>
#include <stdarg.h>

/// 定义线程私有数据key
static pthread_key_t pthread_key;

/// 定义线程私有数据结构体
struct private_data {
    uintptr_t lr_list[10000];
    int lr_index;
} private_data;

/// 是否和线程关联的数据
static void release_pthread_key_data(void *ptr) {
    struct private_data *data = (struct private_data *)ptr;
    if (data) free(data);
}

/// 1、汇编调用c函数
#define asm_call_c(b, funcP)\
__asm volatile("stp x8, x9, [sp, #-16]! \n");\
__asm volatile("mov x12, %x0 \n"\
                 :\
                 : "r"(funcP));\
__asm volatile("ldp x8, x9, [sp], #16 \n");\
__asm volatile(#b " x12 \n");\

/// 2、hook前，保存寄存器值
#define save_context()\
__asm volatile( \
"stp x8, x9, [sp, #-16]!\n" \
"stp x6, x7, [sp, #-16]!\n" \
"stp x4, x5, [sp, #-16]!\n" \
"stp x2, x3, [sp, #-16]!\n" \
"stp x0, x1, [sp, #-16]!\n" \
"stp q6, q7, [sp, #-32]!\n" \
"stp q4, q5, [sp, #-32]!\n" \
"stp q2, q3, [sp, #-32]!\n" \
"stp q0, q1, [sp, #-32]!\n" );

/// 3、hook后，恢复寄存器值
#define resume_context()\
__asm volatile( \
"ldp q0, q1, [sp], #32\n" \
"ldp q2, q3, [sp], #32\n" \
"ldp q4, q5, [sp], #32\n" \
"ldp q6, q7, [sp], #32\n" \
"ldp x0, x1, [sp], #16\n" \
"ldp x2, x3, [sp], #16\n" \
"ldp x4, x5, [sp], #16\n" \
"ldp x6, x7, [sp], #16\n" \
"ldp x8, x9, [sp], #16\n" );

void (*my_func)(id param);

#pragma mark - 保存子程序返回地址（TSD解决线程安全问题）
static void save_lr(id self, SEL _cmd, id param1, id param2, uintptr_t lr) {
    const char * selector = sel_getName(_cmd);
    const char *clsName = class_getName(object_getClass(self));
    //printf("class : %s, methodname : %s",className,selector);
    if (strcmp( selector, "isEqualToString:" ) == 0) {
        printf("===>class:%s methodname:%s param1:%p\n", clsName, selector, param1);
    } else {
        printf("===>class:%s methodname:%s\n", clsName, selector);
    }
    if (strcmp( selector, "setName:" ) == 0) {
        my_func(param1);
        printf("===>class:%s methodname:%s param1:%p\n", clsName, selector, param1);
    }
    struct private_data *data = (struct private_data *)pthread_getspecific(pthread_key);
    if (data == NULL) {
        data = (struct private_data *)malloc(sizeof(struct private_data));
    }
    data->lr_list[data->lr_index++] = lr;
    pthread_setspecific(pthread_key, data);
}

#pragma mark - 恢复LR寄存器值（TSD解决线程安全问题）
static uintptr_t resume_lr(SEL _cmd, uintptr_t lr) {
    struct private_data *data = (struct private_data *)pthread_getspecific(pthread_key);
    if (data == NULL) return 0;
    int index = data->lr_index;
    data->lr_index = index > 0 ? index-1 : 0;
    return data->lr_list[data->lr_index];
}

#pragma mark - hook汇编函数
/// 原msgSend函数指针
__unused static id (*orig_objc_msgSend)(id, SEL, ...);
/// hook函数 声明裸函数，不生成入口代码和返回代码
__attribute__((__naked__))
static void hook_objc_msgSend() {
    //1、记录上下文，上文是汇编函数
    save_context();
    //2、设置参数，并记录lr寄存器值，保存子函数返回的地址
    __asm volatile("mov x4, lr \n");
    asm_call_c(blr, &save_lr);
    //3、恢复上下文
    resume_context();
    
    //4、调用原始汇编函数
    asm_call_c(blr, orig_objc_msgSend);
    
    //5、记录上下文
    save_context();
    //6、恢复lr寄存器值，找到返回的地址，并重新设置lr寄存器（函数返回值存放在x0寄存器）
    asm_call_c(blr, &resume_lr);
    __asm volatile("mov lr, x0 \n");
    //7、恢复上下文
    resume_context();
    //8、返回到上一级函数继续执行
    __asm volatile("ret \n");
}

#pragma mark - 开始hook
void hookStart(void *func) {
    my_func = func;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //创建线程私有数据，相同的key，在不同线程关联不同的数据，第二个参数为线程结束时回调的函数，用来释放数据
        pthread_key_create(&pthread_key, &release_pthread_key_data);
        //使用fishhook替换函数指针
        struct rebinding reb = {"objc_msgSend", (void *)hook_objc_msgSend, (void **)&orig_objc_msgSend};
        struct rebinding rebs[] = {reb};
        rebind_symbols(rebs, sizeof(rebs)/sizeof(reb));
    });
}
