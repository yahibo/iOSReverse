//
//  WXRedParamQueue.h
//  redEnvelopeDylib
//
//  Created by hibo on 2021/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXRedParamQueue : NSObject

+(instancetype)sharadInstance;
-(void)enqueue:(NSMutableDictionary *)param;
-(NSMutableDictionary *)dequeue;

@end

NS_ASSUME_NONNULL_END
