//
//  MenuViewController.m
//  MIPS
//
//  Created by Claudia Cassidy on 9/5/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuItem.h"
#import "CalculatorViewController.h"
#import "MacraViewController.h"
#import "TimelineViewController.h"
#import "ChecklistViewController.h"
#import "NewsViewController.h"
#import "ContactsViewController.h"


@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *viewBg;

@property (nonatomic, assign) CGFloat maxHeaderHeight;
@property (nonatomic, assign) CGFloat minHeaderHeight;

@property (nonatomic, assign) CGFloat previousScrollOffset;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, assign) CGRect cachedImageViewSize;

@property (nonatomic, strong) NSMutableArray *arrMenu;

@property (nonatomic, strong) UILabel *lbl;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"";
    [self.navigationController setNavigationBarHidden:NO];
    
    [self.view sendSubviewToBack:self.viewBg];
    [self.view bringSubviewToFront:self.tableView];
     
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
 
    self.maxHeaderHeight = 88.0f;
    self.minHeaderHeight = 44.0f;

    self.navigationItem.title = @"MACRA Physician's Handbook";
    
 //   self.tableView.backgroundColor = [UIColor orangeColor];
    self.tableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.tableView.layer.borderWidth = 1.0;
    self.tableView.layer.cornerRadius = 3.0f;
    self.tableView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.tableView.layer.shadowOpacity = 0.25;
    self.tableView.layer.shadowOffset = CGSizeMake(1.0,1.0);
    self.tableView.layer.masksToBounds = YES;
    
    
    self.tableView.frame = CGRectMake(0,-90.0,self.view.bounds.size.width,self.view.bounds.size.height+90);
    
    self.arrMenu = [[NSMutableArray alloc] init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"mipsmenu" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

    NSArray *arr = [json objectForKey:@"menus"];
    
    for ( int i=0; i < arr.count; i++ )  {
        
        NSDictionary *dict = [arr objectAtIndex:i];
        
        MenuItem *m = [[MenuItem alloc] init];
        m.title = [dict valueForKey:@"title"];
        m.subTitle = [dict valueForKey:@"subTitle"];
        m.link = [dict valueForKey:@"link"];
        m.type = [dict valueForKey:@"type"];
        
        [self.arrMenu addObject:m];
    }
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 160.0)];
    self.imgView.image = [UIImage imageNamed:@"welcome5.jpg"];
    self.imgView.backgroundColor = [UIColor orangeColor];
    self.imgView.contentMode = UIViewContentModeScaleAspectFill;
    
//    self.lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 128, self.view.bounds.size.width-0, 34)];
//    self.lbl.textColor = [UIColor whiteColor];
//    self.lbl.text = @"MACRA Physician's Handbook";
//    self.lbl.font = [UIFont fontWithName:@"Avenir-Roman" size:21];
//    self.lbl.textAlignment = NSTextAlignmentCenter;
//    self.lbl.backgroundColor = [UIColor colorWithRed:0.0/255.0f green:0.0/255.0f blue:0.0/255.0f alpha:0.3];
//    [self.imgView addSubview:self.lbl];
    
    
    self.cachedImageViewSize = self.imgView.frame;
    [self.tableView addSubview:self.imgView];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 170)];
    [self.tableView bringSubviewToFront:self.imgView];
    [self.tableView bringSubviewToFront:self.lbl];

//    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveLeft:)];
//    [panRecognizer setMinimumNumberOfTouches:1];
//    [panRecognizer setMaximumNumberOfTouches:1];
//    [panRecognizer setDelegate:self];
//    
//    [self.view addGestureRecognizer:panRecognizer];
    
    
}


-(void)moveLeft:(id)sender  {
    
    
    
    CGPoint velocity = [sender velocityInView:self.view];
    CGPoint translation = [sender translationInView:self.view];
    if (velocity.x < 0 && translation.x < -50) {
        
        [self.navigationController setNavigationBarHidden:NO];
       
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            
            
            
            [UIView animateWithDuration:0.3 animations:^{
                
                UIView *viewDim = [self.parentViewController.view viewWithTag:101];
                if (viewDim)
                    [viewDim removeFromSuperview];
                
            }];
            
                
             [self.navigationController.view setNeedsLayout];

            [self removeFromParentViewController];
            
        }];
    }
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat y = -scrollView.contentOffset.y;
    if (y > 0) {
        self.imgView.frame = CGRectMake(0, scrollView.contentOffset.y, self.cachedImageViewSize.size.width+y, self.cachedImageViewSize.size.height+y);
        self.imgView.center = CGPointMake(self.view.center.x, self.imgView.center.y);
//        self.lbl.center = CGPointMake(self.view.center.x,self.lbl.center.y);
//        self.lbl.frame = CGRectMake(0, 128, self.cachedImageViewSize.size.width+y, 32);
        
    }
    
}



-(void)viewWillLayoutSubviews  {
    
    //test

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
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(32, 16, self.view.bounds.size.width-64, 34)];
        lbl.textColor = [UIColor whiteColor];
        lbl.text = @"MACRA Physician's Handbook";
        lbl.font = [UIFont fontWithName:@"Avenir-Roman" size:21];
        [headerView addSubview:lbl];
        
        // Return the headerView
        return headerView;
    }
    else return nil;
}






//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//  
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
//    view.backgroundColor = [UIColor orangeColor];
//    
//    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(32, 16, view.bounds.size.width-64, 34)];
//    
//    lbl.textColor = [UIColor whiteColor];
//    lbl.text = @"MACRA Physician's Handbook";
//    lbl.font = [UIFont fontWithName:@"Avenir-Roman" size:21];
//    
//  //  [viewBot addSubview:lbl];
//    
//    
//    [view addSubview:lbl];
//  //  [view addSubview:viewBot];
//    
//    
//    return view;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 76; //34;//180.0f;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return self.arrMenu.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath  {
    
    return 58.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    MenuItem *m = [self.arrMenu objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",m.title];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Book" size:16];
    cell.detailTextLabel.text = m.subTitle;
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath  {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MenuItem *m = [self.arrMenu objectAtIndex:indexPath.row];

    if (indexPath.row == 0)  {
        [self performSegueWithIdentifier:@"IntroViewController" sender:self];
        self.navigationItem.hidesBackButton = NO;
        self.navigationItem.backBarButtonItem.title = @"Back";
        
    }
    
    else if (indexPath.row == 1)  {
        [self performSegueWithIdentifier:@"MacraViewController" sender:self];
        self.navigationItem.hidesBackButton = NO;
        self.navigationItem.backBarButtonItem.title = @"";
        
    }
    else if (indexPath.row == 2)  {
        [self performSegueWithIdentifier:@"CalculatorViewController" sender:self];
        self.navigationItem.hidesBackButton = NO;
    }
    else if (indexPath.row == 3)  {
        [self performSegueWithIdentifier:@"TimelineViewController" sender:self];
        self.navigationItem.hidesBackButton = NO;
    }

    else if (indexPath.row == 4)  {
        [self performSegueWithIdentifier:@"ChecklistViewController" sender:self];
        self.navigationItem.hidesBackButton = NO;
    }
  
    else if (indexPath.row == 5)  {
        [self performSegueWithIdentifier:@"NewsViewController" sender:self];
        self.navigationItem.hidesBackButton = YES;
    }
    else if (indexPath.row == 6)  {
        [self performSegueWithIdentifier:@"ContactsViewController" sender:self];
        self.navigationItem.hidesBackButton = YES;
    }
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
