//
//  CSSubModel.m
//  CSSModelTests
//
//  Created by Joslyn Wu on 2018/1/21.
//  Copyright © 2018年 joslyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+CSSModel.h"

@interface CSSubPersonModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@end

@implementation CSSubPersonModel
@end


@interface CSSubModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, strong) CSSubPersonModel *person;
@end

@implementation CSSubModel
@end


@interface CSSubModelTests : XCTestCase

@end

@implementation CSSubModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSubModel {
    NSDictionary *person = @{@"name": @"Joslyn 某", @"age": @"18"};
    NSDictionary *data = @{@"name": @"aaa", @"summary": @"描述", @"person": person};
    NSArray *models = [CSSubModel css_modelsWithArray:@[data, data]];
    CSSubModel *model = models.firstObject;
    XCTAssertNotNil(model);
    XCTAssertNotNil(model.name);
    XCTAssertEqual(model.name, @"aaa");
    XCTAssertEqual(model.summary, @"描述");
    XCTAssertEqual(model.person.name, @"Joslyn 某");
    XCTAssertEqual(model.person.age, @"18");
}

- (void)testSubModelJson {
    NSString *json = @"{\"name\": \"aaa\", \"summary\": \"描述\", \"person\": {\"name\": \"Joslyn 某\", \"age\": \"18\"}}";
    CSSubModel *model = [CSSubModel css_modelWithJson:json];
    XCTAssertNotNil(model);
    XCTAssertNotNil(model.name);
    XCTAssertTrue([model.name isEqualToString:@"aaa"]);
}

@end
