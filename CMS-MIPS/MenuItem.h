//
//  MenuItem.h
//  MIPS
//
//  Created by Claudia Cassidy on 9/5/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *linkTitle;

@property (nonatomic, strong) NSMutableArray *arrSubMenus;


@end
