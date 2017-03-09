//
//  Presentation.h
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/8/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Presentation : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;

@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *linkType;

@property (nonatomic, strong) NSString *linkSummary;
@property (nonatomic, strong) NSString *linkId;


@end
