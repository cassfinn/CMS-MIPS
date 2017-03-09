//
//  AboutWebViewController.m
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/15/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "AboutWebViewController.h"
#import "WebViewController.h"
#import "WelcomeTableViewCell.h"


@interface AboutWebViewController ()

@property (nonatomic, assign) CGFloat maxHeaderHeight;
@property (nonatomic, assign) CGFloat minHeaderHeight;

@property (nonatomic, assign) CGFloat previousScrollOffset;
@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, assign) CGRect cachedImageViewSize;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *arr;

@end


@implementation AboutWebViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"Details";
    
    self.arr = [[NSMutableArray alloc] init];

    [self.arr addObject:self.presentation.title];
    
    [self.arr addObject:self.presentation.linkSummary];
    [self.arr addObject:@"View Presentation"];
    [self.arr addObject:@"Share"];
     
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.maxHeaderHeight = 88.0f;
    self.minHeaderHeight = 44.0f;
    
    [self.navigationController setNavigationBarHidden:NO];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 400.0; // set to whatever your "average" cell height is
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 160.0)];
    self.imgView.image = [UIImage imageNamed:@"QPP-Widget-320x166.jpg"];
    self.imgView.contentMode = UIViewContentModeScaleAspectFill;
    self.cachedImageViewSize = self.imgView.frame;
    [self.tableView addSubview:self.imgView];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 170)];
    [self.tableView bringSubviewToFront:self.imgView];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}


-(void)viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    
}


-(void)viewDidAppear:(BOOL)animated  {
    
    UIView *viewDim = [self.view viewWithTag:101];
    if (viewDim)
        [viewDim removeFromSuperview];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat y = -scrollView.contentOffset.y;
    if (y > 0) {
        self.imgView.frame = CGRectMake(0, scrollView.contentOffset.y, self.cachedImageViewSize.size.width+y, self.cachedImageViewSize.size.height+y);
        self.imgView.center = CGPointMake(self.view.center.x, self.imgView.center.y);
    }
    
}


-(void)goBack  {
    [self.navigationController popViewControllerAnimated:YES];
}






- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;//120;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 120.0)];
        //headerView.contentMode = UIViewContentModeScaleToFill;
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 120.0f)];
        imgView.image = [UIImage imageNamed:@"welcome.png"];
        
        [headerView addSubview: imgView];
        
        
        // Return the headerView
        return headerView;
    }
    else return nil;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return self.arr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellAbout"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellAbout"];
    }
    
    NSString *text = [self.arr objectAtIndex:indexPath.row];

    if (indexPath.row == 0)  {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",text];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.font = [UIFont fontWithName:@"Avenir-Book" size:19];
        [cell.textLabel sizeToFit];
    }
    else if (indexPath.row == 1)  {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",text];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.font = [UIFont fontWithName:@"Avenir-Book" size:16];
        [cell.textLabel sizeToFit];
    }

    else if (indexPath.row == 2)  {
        cell.textLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:19];
        cell.textLabel.textAlignment = NSTextAlignmentRight;
        cell.textLabel.textColor = [UIColor colorWithRed:53.0/255.0f green:126.0/255.0f blue:250.0/255.0f alpha:1.0];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = text;
    }
    else if (indexPath.row == 3)  {
        cell.textLabel.font = [UIFont fontWithName:@"Avenir-Book" size:19];
        cell.textLabel.textAlignment = NSTextAlignmentRight;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = text;
    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == 2)  {
        [self performSegueWithIdentifier:@"WebViewController" sender:self];
        self.navigationItem.hidesBackButton = NO;
    }
    else if (indexPath.row == 3)  {
        [self shareText];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 
    WebViewController *vc = segue.destinationViewController;
    vc.presentation = self.presentation;
   
}


- (void)shareText  {
    
    // create a message
    NSString *theMessage = [NSString stringWithFormat:@"Info about the QPP from my CMS-MIPS app: %@",self.presentation.link];
    NSArray *items = @[theMessage];
    
    // build an activity view controller
    UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
    
    // and present it
    [self presentActivityController:controller];
}

- (void)presentActivityController:(UIActivityViewController *)controller {
    
    // for iPad: make the presentation a Popover
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.leftBarButtonItem;
    
    // access the completion handler
    controller.completionWithItemsHandler = ^(NSString *activityType,
                                              BOOL completed,
                                              NSArray *returnedItems,
                                              NSError *error){
        // react to the completion
        if (completed) {
            
            // user shared an item
            NSLog(@"We used activity type%@", activityType);
            
        } else {
            
            // user cancelled
            NSLog(@"We didn't want to share anything after all.");
        }
        
        if (error) {
            NSLog(@"An Error occured: %@, %@", error.localizedDescription, error.localizedFailureReason);
        }
    };
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate)  {
        [self expandHeader];
    }
    else  {
        [self collapseHeader];
    }
}

-(void)scrollViewDidStopScrolling  {
    
    CGFloat range = self.maxHeaderHeight - self.minHeaderHeight;
    CGFloat midPoint = self.minHeaderHeight + (range/2);
    
    
}




-(void)collapseHeader  {
    
    [self.view layoutIfNeeded];
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                     }
                     completion:^(BOOL finished){
                         
                         [self.view layoutIfNeeded];
                     }];
    
    
}

-(void)expandHeader  {
    
    [self.view layoutIfNeeded];
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                     }
                     completion:^(BOOL finished){
                         
                         [self.view layoutIfNeeded];
                     }];
    
}


-(void)setScrollPosition:(CGFloat)position  {
    
    self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, position);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
