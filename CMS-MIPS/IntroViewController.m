//
//  IntroViewController.m
//  MIPS
//
//  Created by Claudia Cassidy on 9/3/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "IntroViewController.h"
#import "WelcomeTableViewCell.h"
#import "MenuViewController.h"



@interface IntroViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, assign) CGFloat maxHeaderHeight;
@property (nonatomic, assign) CGFloat minHeaderHeight;

@property (nonatomic, assign) CGFloat previousScrollOffset;
@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, assign) CGRect cachedImageViewSize;

@end


@implementation IntroViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
     
    self.navigationItem.title = @"Welcome";

    UIBarButtonItem *barButtonItemMenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    [barButtonItemMenu setImage:[UIImage imageNamed:@"hamburger.png"]];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    space.width = 30;
    NSArray *buttons = @[barButtonItemMenu, space];
    self.navigationItem.leftBarButtonItems = buttons;
   
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.maxHeaderHeight = 88.0f;
    self.minHeaderHeight = 44.0f;
    
    [self.navigationController setNavigationBarHidden:NO];
 
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 400.0; // set to whatever your "average" cell height is
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 160.0)];
    self.imgView.image = [UIImage imageNamed:@"welcome5.jpg"];
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

-(void)showMenu  {
    
    [self goBack];
    return;
    
    NSLog(@"show menu");
    
    
    MenuViewController *tlc = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    [tlc.view setFrame:CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    [self addChildViewController:tlc];
    [self.view addSubview:tlc.view];
    [tlc didMoveToParentViewController:self];


    [self.navigationController.view setNeedsLayout];
    
    
    [self.navigationController setNavigationBarHidden:YES];
    
    UIView *viewDim = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height)];
    viewDim.backgroundColor = [UIColor whiteColor];
    viewDim.alpha = 0.9;
    viewDim.tag = 101;
    [self.view addSubview:viewDim];
    [self.view bringSubviewToFront:tlc.view];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.layoutMargins = UIEdgeInsetsMake(120, 90, 0, 0);
    
        [tlc.view setFrame:CGRectMake(-44, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        tlc.view.alpha = 1.0;

        
    }];
    
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"IntroViewController"])
    {
     }
    
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
    return 1;
}

/*
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath  {
    
    return 90.0f;
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {

    WelcomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WelcomeCell"];
    if (cell == nil)
    {
        cell = [[WelcomeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"WelcomeCell"];
    }
    
    NSString *text = @"The Center for Medicare and Medicaid Services"
    " is dedicated to individualizing your transition to the new Merit Based Incentive Payment System (MIPS) program.\n\n"
    "This guide will show what the program means for you, key dates, and how to successfully participate.\n\n"
    "Our goal is to help clinicians and their support teams understand the Merit-Based Incentive Payment System, the benefits of participation, and how you can move your practice towards quality based care.";
    
    cell.lblDesc.text = [NSString stringWithFormat:@"%@",text];
   
    [cell.lblDesc sizeToFit];
    
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
