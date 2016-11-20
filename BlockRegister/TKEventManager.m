//
//  TKEventManager.m
//  3TK_client
//
//  Created by 李鑫 on 16/10/17.
//  Copyright © 2016年 3TK. All rights reserved.
//
#import "TKEventHandler.h"
#import "TKEventManager.h"

@implementation TKEventManager
- (instancetype)init{
    
    self = [super init];
    
    if(self)
    {
        _eventHandlers = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}
+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    static TKEventManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[TKEventManager alloc] init];
    });
    
    return manager;
}

+ (NSMutableDictionary *)handlerContainer{
    return [[TKEventManager sharedManager] eventHandlers];
}

#pragma mark - String Event Handle

+ (void)registEvent:(NSString *)event handler:(TKCommonBlock)block{
    TKEventHandler *handler = [TKEventHandler createEventHandler:event handler:block];
    [[TKEventManager handlerContainer] setObject:handler forKey:event];
}

+ (void)executeEvent:(NSString *)event datas:(NSArray *)datas{
    if([[[TKEventManager handlerContainer] allKeys] containsObject:event])
    {
        TKEventHandler *handler = [[TKEventManager handlerContainer] objectForKey:event];
        [handler executeBlockWithEventName:event datas:datas];
    }
    else
        NSLog(@"TKEventManager :>Event handler for event %@ not declared",event);
}
@end
