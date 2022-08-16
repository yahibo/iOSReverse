//
//  WXRedParamQueue.m
//  redEnvelopeDylib
//
//  Created by hibo on 2021/12/30.
//

#import "WXRedParamQueue.h"

@interface WXRedParamQueue()

@property (nonatomic, strong) NSMutableArray *queue;

@end

@implementation WXRedParamQueue

+(instancetype)sharadInstance {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[WXRedParamQueue alloc] init];
    });
    return instance;
}

-(void)enqueue:(NSMutableDictionary *)param {
    [self.queue addObject:param];
}

-(NSMutableDictionary *)dequeue {
    if (self.queue.count == 0 && !self.queue.firstObject) return nil;
    NSMutableDictionary * first = self.queue.firstObject;
    [self.queue removeObjectAtIndex:0];
    return first;
}

- (NSMutableArray *)queue {
    if (!_queue) {
        _queue = [NSMutableArray array];
    }
    return _queue;
}

@end
