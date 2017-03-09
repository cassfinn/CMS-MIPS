//
//  ChecklistItem.h
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/9/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ChecklistItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *webLink;
@property (nonatomic, strong) NSString *summary;


@end
