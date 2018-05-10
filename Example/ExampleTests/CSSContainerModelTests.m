//
//  CSSContainerModelTests.m
//  CSSModelTests
//
//  Created by Joslyn Wu on 2018/1/21.
//  Copyright © 2018年 joslyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+CSSModel.h"

CSSModelProtocol(CSSPersonModel)
@interface CSSPersonModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSArray<CSSPersonModel> *list;
@end

@implementation CSSPersonModel
@end


@interface CSSContainerModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSArray<CSSPersonModel> *list;
@end

@implementation CSSContainerModel
@end


@interface CSSContainerModelTests : XCTestCase

@end

@implementation CSSContainerModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSDictionary *person1 = @{@"name": @"Joslyn", @"age": @"18"};
    NSDictionary *person2 = @{@"name": @"某某", @"age": @"25"};
    NSDictionary *person3 = @{@"name": @"某某", @"age": @"25", @"list": @[person1, person2]};
    NSDictionary *data = @{@"name": @"aaa", @"summary": @"描述", @"list": @[person1, person2, person3]};
    CSSContainerModel *model = [CSSContainerModel css_modelWithJson:data];
    CSSPersonModel *personModel = model.list.firstObject;
    XCTAssertNotNil(model);
    XCTAssertNotNil(model.name);
    XCTAssertEqual(model.name, @"aaa");
    XCTAssertEqual(model.summary, @"描述");
    XCTAssertEqual(personModel.name, @"Joslyn");
    XCTAssertEqual(personModel.age, @"18");
}

@end
