//
//  WebViewController.m
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/8/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "WebViewController.h"



@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    self.webView.backgroundColor = [UIColor whiteColor];
    
    
   // <iframe width="640" height="360" src="https://www.youtube.com/embed/3DqSRcQSUxU?list=PLaV7m2-zFKpihHxb4AiWNjbsIUUKCGljK" frameborder="0" allowfullscreen></iframe>
    
    
    if ([[self.presentation.linkType lowercaseString] isEqualToString:@"youtube"])  {
        
        [self.view bringSubviewToFront:self.youTubePlayerView];
        self.webView.frame = CGRectZero;
        
        self.youTubePlayerView.delegate = self;
        
  
        
        [self.youTubePlayerView loadWithVideoId:self.presentation.link];
        
        CGRect rect = self.youTubePlayerView.frame;
        
     }
    
    else  {
        
        self.youTubePlayerView.frame = CGRectZero;
       
//        [self.view bringSubviewToFront:self.webView];
        NSString *url = self.presentation.link;
//        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
//        [self.webView loadRequest:urlRequest];
        
        
        SFSafariViewController *safariVC = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:url] entersReaderIfAvailable:NO];
        safariVC.delegate = self;
        [self presentViewController:safariVC animated:NO completion:nil];

        
    }
}


- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
    switch (state) {
        case kYTPlayerStatePlaying:
            NSLog(@"Started playback");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Paused playback");
            break;
        default:
            break;
    }
}
#pragma mark - SFSafariViewController delegate methods
-(void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
    // Load finished
}

-(void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    [self.navigationController popViewControllerAnimated:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
