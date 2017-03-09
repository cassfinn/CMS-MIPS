//
//  NewsViewController.m
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/15/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "NewsViewController.h"
#import "Presentation.h"
#import "WebViewController.h"


@interface NewsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arrPresentations;

@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, strong) Presentation *selectedPresentation;



@end



// The CMS Blog:
// https://blog.cms.gov/2016/09/08/QualityPaymentProgram-PickYourPace/
// Plans for the Quality Payment Program in 2017: Pick Your Pace

//Blog:
//http://www.hhs.gov/blog/2015/01/26/progress-towards-better-care-smarter-spending-healthier-people.html
//



@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButtonItemMenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    [barButtonItemMenu setImage:[UIImage imageNamed:@"hamburger.png"]];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    space.width = 30;
    NSArray *buttons = @[barButtonItemMenu, space];
    self.navigationItem.leftBarButtonItems = buttons;
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 90.0;
    
    self.arrPresentations = [[NSMutableArray alloc] initWithObjects:nil];
    
    [self loadPresentations];
    [self.tableView reloadData];
}

-(void)showMenu  {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)loadPresentations  {
    
    
    
    Presentation *p2c = [Presentation new];
    p2c.link = @"https://www.hhs.gov/about/news/2016/10/14/hhs-finalizes-streamlined-medicare-payment-system-rewards-clinicians-quality-patient-care.html";
    p2c.title = @"HHS finalizes streamlined Medicare payment system that rewards clinicians for quality patient care";
    p2c.subTitle = @"HHS Press Release - Oct 14, 2016";
    p2c.linkType = @"url";
    p2c.linkSummary = @"";
    p2c.linkId = @"1106";
    [self.arrPresentations addObject:p2c];

    
    Presentation *p0a = [Presentation new];
    p0a.link = @"http://www.hhs.gov/blog/2015/01/26/progress-towards-better-care-smarter-spending-healthier-people.html";
    p0a.title = @"Progress Towards Better HealthCare - Smarter Spending Healthier People";
    p0a.subTitle = @"The CMS Blog - Oct 14, 2016";
    p0a.linkType = @"url";
    p0a.linkId = @"1101";
    [self.arrPresentations addObject:p0a];
    
    
    Presentation *p4 = [Presentation new];
    p4.link = @"http://www.finance.senate.gov/chairmans-news/hatch-statement-on-cmss-macra-quality-payment-rule";
    p4.title = @"Hatch Statement on CMS’s MACRA Quality Payment Rule";
    p4.subTitle = @"U.S. Senate Finance Committee - Oct 14, 2016";
    p4.linkType = @"url";
    p4.linkSummary = @"";
    p4.linkId = @"1107";
    [self.arrPresentations addObject:p4];

    
    
  Presentation *p0 = [Presentation new];
    p0.link = @"https://blog.cms.gov/2016/09/08/QualityPaymentProgram-PickYourPace/";
    p0.title = @"Quality Payment Program - Pick Your Pace";
    p0.subTitle = @"The CMS Blog - Sep 8, 2016";
    p0.linkType = @"url";
    p0.linkId = @"1102";
    [self.arrPresentations addObject:p0];
    
    
    Presentation *p = [Presentation new];
    p.link = @"https://blog.cms.gov/2016/05/02/cms-finalizes-its-quality-measure-development-plan/";
    p.title = @"CMS Finalizes its QUality Measure Development Plan";
    p.subTitle = @"The CMS Blog - May 2, 2016";
    p.linkType = @"url";
    p.linkSummary = @"This presentation explains Delivery System Reform, Quality Payment Program, Merit-based Incentive Payment System (MIPS), Advanced Alternative Payment Model, and Timeline and Next Steps.";
    p.linkId = @"1103";
    [self.arrPresentations addObject:p];
    
    
    
    self.navigationItem.title = @"News";

    
    
    
    Presentation *p2 = [Presentation new];
    p2.link = @"https://blog.cms.gov/2016/10/12/improved-quality-of-medicare-health-and-drug-plans-means-great-news/";
    p2.title = @"Improved quality of Medicare health and drug plans means great news for Medicare beneficiaries";
    p2.subTitle = @"The CMS Blog - Oct 12, 2016";
    p2.linkType = @"url";
    p2.linkSummary = @"";
    p2.linkId = @"1104";
    [self.arrPresentations addObject:p2];
    
    
    Presentation *p2a = [Presentation new];
    p2a.link = @"https://blog.cms.gov/2016/10/05/talking-with-the-industry-about-the-future-of-health-care-in-america/";
    p2a.title = @"Talking with the industry about the future of health care in America";
    p2a.subTitle = @"The CMS Blog - Oct 5, 2016";
    p2a.linkType = @"url";
    p2a.linkSummary = @"";
    p2a.linkId = @"1105";
    [self.arrPresentations addObject:p2a];
    
    
    
}




-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section  {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(16,8,self.view.bounds.size.width-32,48)];
    if (section == 0)  {
        //   lbl.text = @"Required - Must do to earn any points";
        lbl.textColor = [UIColor redColor];
    }
    lbl.numberOfLines = 0;
    lbl.lineBreakMode = NSLineBreakByWordWrapping;
    
    [view addSubview:lbl];
    
    view.backgroundColor = [UIColor colorWithRed:241.0/255.0f green:241.0/255.0f blue:241.0/255.0f alpha:1.0];
    return view;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellId = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellId];
    }
    
    Presentation *p = [self.arrPresentations objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"\n%@", p.title];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@\n\n", p.subTitle];
    
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.selectedRow = indexPath.row;
    
    
    [self performSegueWithIdentifier:@"WebViewController" sender:self];
    
    self.navigationItem.hidesBackButton = NO;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //    if ( [segue.identifier isEqualToString:@"QualityDetailViewController"] )  {
    WebViewController *vc = segue.destinationViewController;
    vc.presentation = [self.arrPresentations objectAtIndex:self.selectedRow];
    
    
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrPresentations.count;
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
