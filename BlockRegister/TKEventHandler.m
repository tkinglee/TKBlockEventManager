//
//  TKEventHandler.m
//  3TK_client
//
//  Created by 李鑫 on 16/10/17.
//  Copyright © 2016年 3TK. All rights reserved.
//

#import "TKEventHandler.h"

@implementation TKEventHandler
- (void)executeBlockWithEventName:(NSString *)eventName datas:(NSArray *)datas{
    self.block(eventName,datas);
}

+ (instancetype)createEventHandler:(NSString *)eventName handler:(TKCommonBlock)block{
    return [self createEventHandler:eventName socketEvent:eventName handler:block];
}

+ (instancetype)createEventHandler:(NSString *)eventName socketEvent:(NSString *)socketEvent handler:(TKCommonBlock)block{
    TKEventHandler *handler = [[TKEventHandler alloc] init];
    handler.eventName = eventName;
    handler.socketEvent = socketEvent;
    handler.block = block;
    
    return handler;
}
@end
