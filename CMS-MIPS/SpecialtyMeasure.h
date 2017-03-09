//
//  SpecialtyMeasure.h
//  cms
//
//  Created by John Cassidy on 7/17/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialtyMeasure : NSObject

@property (nonatomic, assign) NSInteger pqrs;

@property (nonatomic, strong) NSString *nqf;

//@property(nonatomic,strong) NSMutableArray *arrReportingMethod;
//@property(nonatomic,strong) NSMutableArray *arrStrategyDomain;

@property(nonatomic,strong) NSString *descTitle;

@property(nonatomic,strong) NSString *descDetail;

@property(nonatomic,strong) NSString *nqsDomain;

@property (nonatomic, strong) NSString *measureType;

@property(nonatomic,assign) NSInteger isRepClaims;

@property(nonatomic,assign) NSInteger isRepEhr;

@property(nonatomic,assign) NSInteger isRepGproWeb;

@property(nonatomic,assign) NSInteger isRepMeasureGroups;

@property(nonatomic,assign) NSInteger isRepRegistry;


@property (nonatomic, strong) NSString *measureGroups;


@property(nonatomic,assign) NSInteger isCrossCuttingMeasure;
@property(nonatomic,assign) NSInteger isOutcomeMeasure;

@property(nonatomic,assign) NSInteger isAco;

@property (nonatomic, strong) NSString *specialty;


@property (nonatomic, strong) NSString *measureDeveloper1;
@property (nonatomic, strong) NSString *measureDeveloper2;
@property (nonatomic, strong) NSString *measureDeveloper3;



@end
