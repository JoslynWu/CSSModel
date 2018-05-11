//
//  CSSCloneTests.m
//  CSSModelTests
//
//  Created by Joslyn Wu on 2018/4/21.
//  Copyright © 2018年 joslyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CSSModel.h"
#import "CSSSimpleModel.h"

@interface CSSCloneTests : XCTestCase

@end

@implementation CSSCloneTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testClone {
    NSDictionary *person = @{@"subName": @"Joslyn 某", @"subUid": @"18"};
    NSDictionary *data = @{@"name": @"aaa", @"summary": @"描述", @"subModel": person};
    CSSSimpleModel *model = [CSSSimpleModel css_modelWithJson:data];
    CSSSimpleModel *cloneModel = model.css_clone;
    XCTAssertEqualObjects(model.name, cloneModel.name);
    XCTAssertEqualObjects(model.summary, cloneModel.summary);
    XCTAssertEqualObjects(model.subModel.subName, cloneModel.subModel.subName);
    XCTAssertEqualObjects(model.subModel.subUid, cloneModel.subModel.subUid);
    
    // address
    XCTAssertNotEqual(model, cloneModel);
    XCTAssertNotEqual(model.subModel, cloneModel.subModel);
    XCTAssertNotEqual(model.subModel.subName, cloneModel.subModel.subName);
    XCTAssertNotEqual(model.subModel.subUid, cloneModel.subModel.subUid);
}



@end
