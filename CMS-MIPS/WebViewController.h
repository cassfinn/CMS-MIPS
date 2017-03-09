//
//  WebViewController.h
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/8/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Presentation.h"
#import "YTPlayerView.h"
@import SafariServices;


@interface WebViewController : UIViewController <YTPlayerViewDelegate,SFSafariViewControllerDelegate>

@property (nonatomic, strong) Presentation *presentation;

@property (weak, nonatomic) IBOutlet YTPlayerView *youTubePlayerView;

@end
