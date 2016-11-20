//
//  BlockRegisterTests.m
//  BlockRegisterTests
//
//  Created by 李鑫 on 2016/11/20.
//  Copyright © 2016年 tkinglee. All rights reserved.
//

#import "TKEventManager.h"
#import <XCTest/XCTest.h>

@interface BlockRegisterTests : XCTestCase

@end

@implementation BlockRegisterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
   
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCTestExpectation *asyncExpectation = [self expectationWithDescription:@"AsyncTest"];
    
    [TKEventManager registEvent:@"SKEvent-Recive-Play" handler:^(id param, ...) {
        NSLog(@"%@",param);
        [asyncExpectation fulfill];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [TKEventManager executeEvent:@"SKEvent-Recive-Play"  datas:@[@"SKDatas"]];
    });
    
    [self waitForExpectationsWithTimeout:10.f handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
