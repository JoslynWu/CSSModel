//
//  CSSToDictionaryTests.m
//  CSSModelTests
//
//  Created by Joslyn Wu on 2018/1/31.
//  Copyright © 2018年 joslyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CSSModel.h"
#import "CSSSimpleModel.h"
#import <objc/runtime.h>

@interface CSSToDictionaryTests : XCTestCase

@end

@implementation CSSToDictionaryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictToDict {
    NSDictionary *data = @{@"name": @"aaa", @"summary": @"摘要"};
    NSDictionary *toDict = (NSDictionary *)data.css_JSONObject;
    XCTAssertTrue([data[@"name"] isEqualToString:toDict[@"name"]]);
    XCTAssertTrue([data[@"summary"] isEqualToString:toDict[@"summary"]]);
    XCTAssertTrue([toDict[@"name"] isEqualToString:@"aaa"]);
    XCTAssertTrue([toDict[@"summary"] isEqualToString:@"摘要"]);
}

- (void)testSimpleModelToDict {
    NSDictionary *data = @{@"name": @"aaa", @"summary": @"摘要"};
    CSSSimpleModel *model = [CSSSimpleModel css_modelWithJson:data];
    NSDictionary *toDict = (NSDictionary *)model.css_JSONObject;
    XCTAssertTrue([data[@"name"] isEqualToString:toDict[@"name"]]);
    XCTAssertTrue([data[@"summary"] isEqualToString:toDict[@"summary"]]);
    XCTAssertTrue([toDict[@"name"] isEqualToString:@"aaa"]);
    XCTAssertTrue([toDict[@"summary"] isEqualToString:@"摘要"]);
}

- (void)testArrayToDict {
    NSArray *data = @[@"aaa", @"摘要"];
    NSArray *toDict = (NSArray *)data.css_JSONObject;
    XCTAssertTrue([data[0] isEqualToString:toDict[0]]);
    XCTAssertTrue([data[1] isEqualToString:toDict[1]]);
}

- (void)testNestDictToDict {
    NSDictionary *subDict0 = @{@"url": @"https://baidu.com", @"title": @"0子标题"};
    NSDictionary *data = @{@"name": @"aaa", @"summary": @"摘要", @"sub": subDict0};

    NSDictionary *toDict = (NSDictionary *)data.css_JSONObject;
    
    XCTAssertTrue([data[@"name"] isEqualToString:toDict[@"name"]]);
    XCTAssertTrue([data[@"summary"] isEqualToString:toDict[@"summary"]]);
    XCTAssertTrue([toDict[@"name"] isEqualToString:@"aaa"]);
    XCTAssertTrue([toDict[@"summary"] isEqualToString:@"摘要"]);
    XCTAssertTrue([toDict[@"sub"][@"title"] isEqualToString:@"0子标题"]);
    XCTAssertTrue([toDict[@"sub"][@"url"] isEqualToString:@"https://baidu.com"]);
}


@end
