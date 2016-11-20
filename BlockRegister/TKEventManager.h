//
//  TKEventManager.h
//  3TK_client
//
//  Created by 李鑫 on 16/10/17.
//  Copyright © 2016年 3TK. All rights reserved.
//
#import "TKEventHandler.h"
#import <Foundation/Foundation.h>

@interface TKEventManager : NSObject

@property (nonatomic,readonly) NSMutableDictionary *eventHandlers;

+ (void)registEvent:(NSString *)event handler:(TKCommonBlock)block;

+ (void)executeEvent:(NSString *)event datas:(NSArray *)datas;
@end

