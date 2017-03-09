//
//  QualityTableViewCell.h
//  cms
//
//  Created by John Cassidy on 7/16/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QualityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewType;

//@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
//@property (weak, nonatomic) IBOutlet UILabel *lblDetail;
//
//@property (nonatomic, assign) BOOL isExpanded;
//@property (nonatomic, assign) BOOL isSelected;
//@property (weak, nonatomic) IBOutlet UIButton *btnSeeMore;
//
//@property (nonatomic, assign) NSInteger row;


- (void)adjustSizeToMatchWidth:(CGFloat)width;


@end
