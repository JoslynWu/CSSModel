//
//  CSSModelTests.m
//  CSSModelTests
//
//  Created by Joslyn Wu on 2018/1/20.
//  Copyright © 2018年 joslyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+CSSModel.h"
#import "CSSSimpleModel.h"

@interface CSSModelTests : XCTestCase

@end

@implementation CSSModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSimpleModel {
    NSDictionary *data = @{@"name": @"aaa", @"summary": @"摘要"};
    CSSSimpleModel *model = [CSSSimpleModel css_modelWithJson:data];
    XCTAssertNotNil(model);
    XCTAssertNotNil(model.name);
    XCTAssertEqual(model.name, @"aaa");
    XCTAssertEqual(model.summary, @"摘要");
}

@end
