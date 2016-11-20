//
//  TKEventHandler.h
//  3TK_client
//
//  Created by 李鑫 on 16/10/17.
//  Copyright © 2016年 3TK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TKCommonBlock)(id param,...);

@interface TKEventHandler : NSObject

@property (nonatomic,strong) NSString *eventName;
@property (nonatomic,strong) NSString *socketEvent;
@property (nonatomic,copy) TKCommonBlock block;

- (void)executeBlockWithEventName:(NSString *)eventName
               datas:(NSArray *)datas;

+ (instancetype)createEventHandler:(NSString *)eventName handler:(TKCommonBlock)block;

+ (instancetype)createEventHandler:(NSString *)eventName socketEvent:(NSString *)socketEvent handler:(TKCommonBlock)block;

@end

