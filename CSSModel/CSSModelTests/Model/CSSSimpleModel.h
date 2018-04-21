//
//  CSSSimpleModel.h
//  CSSModelTests
//
//  Created by Joslyn Wu on 2018/1/31.
//  Copyright © 2018年 joslyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSSModel.h"

CSSModelProtocol(CSSSimpleSubModel)
@interface CSSSimpleSubModel : NSObject

@property (nonatomic, copy) NSString *subName;
@property (nonatomic, copy) NSString *subUid;
@property (nonatomic, copy) NSString *subSummary;

@end

@interface CSSSimpleModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, strong) CSSSimpleSubModel *subModel;
@property (nonatomic, strong) id obj;

@end
