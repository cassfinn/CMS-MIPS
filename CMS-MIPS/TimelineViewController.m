//
//  TimelineViewController.m
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/8/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "TimelineViewController.h"
#import "YearCollectionViewCell.h"


@interface TimelineViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *arrYears;
@property (nonatomic, strong) NSMutableArray *arrHtml;

@property (nonatomic, assign) NSInteger iSelectedRow;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSMutableArray *arrWeb;

@end

//Participation, Payments, Reporting Deadline



@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIBarButtonItem *barButtonItemMenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    [barButtonItemMenu setImage:[UIImage imageNamed:@"hamburger.png"]];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    space.width = 30;
    NSArray *buttons = @[barButtonItemMenu, space];
    self.navigationItem.leftBarButtonItems = buttons;

    
    
    self.arrYears = [[NSMutableArray alloc] initWithObjects:@"2016",@"2017",@"2018",@"2019",@"2020",@"2021",@"2022", nil];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
  //  UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    
    [self.collectionView reloadData];
    
    self.webView.delegate = self;
    
    [self setHtml];

    
    NSString *cmsIntro = @"MIPS and APMs will go into effect over a timeline from 2015 through 2021 and beyond.";

    NSString *other = @"Earn up to 27% more with your Medicare payments – or lose up to 9%.\nBy 2022, your MIPS score can significantly impact your Medicare reimbursement from -9% to +27%. However, with some advance planning it is possible to leverage your existing efforts and start investing in resources to help maximize your MIPS scores over the long term.";
    
    NSString *sYear = @"2016";
    NSString *doNow = @"The best way to get ready for MACRA and MIPS is to satisfy Meaningful Use Stage 2 requirements and continue to work on meeting Clinical Quality Measures. CMS has stated that those providers already attesting to Meaningful Use and PQRS will likely have no net new requirements.";
    NSString *notes = @"The first performance year for the Merit-Based Incentive Payment System (MIPS) begins in January 1, 2017. It’s important to prepare now to earn up to 12% more on your Medicare Part B payments and avoid future penalties. ";
    NSString *doNow1 = @"Implement certified EHR technology. A well-designed certified electronic health record (EHR) can help providers fulfill Meaningful Use and PQRS requirements with much less effort. EHRs can provide real-time summaries of quality measure progress and can be used to generate attestation documentation simplifying administrative efforts to successfully meet program goals.";
    NSString *doNow2 = @"Meet current quality reporting program measures. MIPS will combine and streamline these existing EHR Incentive Program and pay-for-performance program measurements into one program: Meaningful Use (MU), Physician Quality Reporting System (PQRS), Value-based Payment Modifier (VM). The sooner you start meeting the existing program measures successfully, the better prepared you’ll be to earn a higher payment bonus once MIPS starts. ";
    NSString *doNow3 = @"";
    
    
    NSString *s2017 = @"MIPS first performance year begins. The proposed rule specifies that the performance period for MIPS is the full calendar year (Jan. 1 through Dec. 31) two years prior to the payment adjustment year.  As such, MIPS payment adjustments in 2019 will be based on performance in 2017.";
    
    NSString *s2019	= @"MIPS Payment Adjustment (+/-) 4% plus up to a 12% bonus for achieving 25th percentile or Qualifying Alternate Payment Models (APM) Participant 5% Incentive Payment.";
    NSString *s2020	= @"MIPS Payment Adjustment (+/-) 5% plus up to a 15% bonus for achieving 25th percentile or Qualifying APM Participant 5% Incentive Payment.";
    NSString *s2021	= @"MIPS Payment Adjustment (+/-) 7% plus up to a 21% bonus for achieving 25th percentile or Qualifying APM 5% Participant Incentive Payment.";
    NSString *s2022	= @"MIPS Payment Adjustment (+/-) 9% plus up to a 27% bonus for achieving 25th percentile or Qualifying APM Participant 5% Incentive Payment.";
    
    [self.webView loadHTMLString:[self.arrWeb objectAtIndex:0] baseURL:nil];
    self.iSelectedRow = 0;
    
}


-(void)showMenu  {
    [self.navigationController popViewControllerAnimated:YES];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    // if (collectionView == self.collectionViewAllBooks)  {
    return CGSizeMake(self.view.bounds.size.width/5, 54 );
    // }
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   
    return self.arrYears.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    YearCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"CellYear" forIndexPath:indexPath];
    cell.lblYear.text = [self.arrYears objectAtIndex:indexPath.row];

    cell.lblYear.layer.cornerRadius = 8.0f;

    if (indexPath.row != self.iSelectedRow)  {
        cell.lblYear.backgroundColor = [UIColor clearColor];
        cell.lblYear.textColor = [UIColor colorWithRed:21.0/255.0f green:61.0/255.0f blue:130.0/255.0f alpha:1.0];
    }
    else  {
        cell.lblYear.textColor = [UIColor whiteColor];
        cell.lblYear.backgroundColor = [UIColor colorWithRed:21.0/255.0f green:61.0/255.0f blue:130.0/255.0f alpha:1.0];
    }
    
    cell.layer.borderColor = [UIColor colorWithRed:241.0/255.0f green:241.0/255.0f blue:241.0/255.0f alpha:0.8].CGColor;
    cell.layer.borderWidth = 1.0f;
    cell.layer.cornerRadius = 1.0f;
    cell.lblYear.layer.cornerRadius = 6.0f;
    cell.lblYear.layer.masksToBounds = YES;

    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didselect");

    [self resetLabels:indexPath.row];
    
    YearCollectionViewCell *cell = (YearCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];

//    UILabel *lbl = cel  //[cell.contentView viewWithTag:[[self.arrYears objectAtIndex:indexPath.row] integerValue]];
    cell.lblYear.textColor = [UIColor whiteColor];
    cell.lblYear.backgroundColor = [UIColor colorWithRed:21.0/255.0f green:61.0/255.0f blue:130.0/255.0f alpha:1.0];
    cell.lblYear.layer.cornerRadius = 6.0f;
    cell.lblYear.layer.masksToBounds = YES;
    
    self.iSelectedRow = indexPath.row;
    
    [self.collectionView setNeedsDisplay];
    
    
    [self.webView loadHTMLString:[self.arrWeb objectAtIndex:indexPath.row] baseURL:nil];

    
}


-(void)resetLabels:(NSInteger)selectedRow  {
    
    for (int i=0; i <= self.arrYears.count; i++)  {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        YearCollectionViewCell *cell = (YearCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        
        cell.lblYear.textColor = [UIColor colorWithRed:21.0/255.0f green:61.0/255.0f blue:130.0/255.0f alpha:1.0];
        cell.lblYear.backgroundColor = [UIColor clearColor];

    }
    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:selectedRow inSection:0];
//    YearCollectionViewCell *cell = (YearCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
//    
//    cell.lblYear.textColor = [UIColor whiteColor];
//    cell.lblYear.backgroundColor = [UIColor colorWithRed:21.0/255.0f green:61.0/255.0f blue:130.0/255.0f alpha:1.0];

}


-(void)setHtml  {
    
//    NSString *sHtml16 = @"<html><head><style>"
//    "p.heading { background-color: #dddddd; color:#000; font-family: \"Avenir Next\" !important;  }"
//    "p.text  { background-color: #fff; color:#333; font-family: \"Avenir Next\" !important; }"
//    "</style></head><body>"
//    
//    
//    "<div class='heading'><p class='heading'>Performance Period (Jan-Dec)</p></div>"
//    "<div class='text'><p class='text'>1st Feedback Report (July)<br><br>First MACRA measurement period begins, with flexibility.<br><br>"
//    "<li>Eligible clinicians who are ready to submit information for the full calendar year begin their reporting period now."
//    "<li>Providers who are planning to submit for a partial calendar year can begin their reporting for any period of time between this date and Jan. 1, 2018."
//    "<li>Eligible clinicians who choose to test will also send in data for the 2017 calendar year."
//    "</div>"
//    
//    "<div class='heading'><p class='heading'>Eligibility</p></div>"
//    "<div class='text'><p class='text'>In the first two years of the MIPS program, a \“MIPS eligible clinician\” is defined as physicians (MD/DO and DMD/DDS), physician assistants (PAs), nurse practitioners (NPs), clinical nurse specialists (CNS), and certified registered nurse anesthetists (CRNA).</div>"
//    "</body></html>";

    NSString *sHtml16 = @"<html><head><style>"
    "p.heading { background-color: #dddddd; color:#000; font-family: \"Avenir Next\" !important; padding:8px; }"
    "p.text  { background-color: #fff; color:#333; font-family: \"Avenir Next\" !important; }"
    "li.text  { background-color: #fff; color:#333; font-family: \"Avenir Next\" !important; }"
    "body  { margin:16px; }"
    "</style></head><body>"
    "<div class='heading'><p class='heading'>Fall 2016</p></div>"
    "<div class='text'><p class='text'>Final MACRA Rule Issued</p>"
    "</div>"
    
    "<div class='heading'><p class='heading'>MIPS Measurement Plan Released</p></div>"
    "<div class='text'><p class='text'>MACRA requires that CMS release an annual list of MIPS quality measures no later than Nov. 1 of the year prior to each performance year. The measurement plan will further clarify what measures and associated technical specifications MIPS clinicians will be required to report or choose from in 2017.</div>"
    "</body></html>";

    
    NSString *sHtml17 = @"<html><head><style>"
    "p.heading { background-color: #dddddd; color:#000; font-family: \"Avenir Next\" !important; padding:8px; }"
    "p.text  { background-color: #fff; color:#333; font-family: \"Avenir Next\" !important; }"
    "li.text  { background-color: #fff; color:#333; font-family: \"Avenir Next\" !important; }"
    "</style></head><body>"
    "<p class='text'>The proposed rule specifies that the performance period for MIPS is the calendar year (Jan. 1 through Dec. 31) 2 years prior to the payment adjustment year. As such, MIPS payment adjustments in 2019 will be based on performance in 2017. This process continues with a 2-year \“performance year\” review in subsequent calendar years.</p>"
    "<div class='heading'><p class='heading'>Performance Period (Jan-Dec)</p></div>"
    "<div class='text'><p class='text'>1st Feedback Report (July)<br><br>First MACRA measurement period begins, with flexibility:"
    "<li class='text'>Eligible clinicians who are ready to submit information for the full calendar year begin their reporting period now."
    "<li class='text'>Providers who are planning to submit for a partial calendar year can begin their reporting for any period of time between this date and Jan. 1, 2018."
    "<li class='text'>Eligible clinicians who choose to test will also send in data for the 2017 calendar year."
    "</div>"

    "<div class='heading'><p class='heading'>Eligibility</p></div>"
    "<div class='text'><p class='text'>In the first two years of the MIPS program, a \“MIPS eligible clinician\” is defined as physicians (MD/DO and DMD/DDS), physician assistants (PAs), nurse practitioners (NPs), clinical nurse specialists (CNS), and certified registered nurse anesthetists (CRNA).</div>"
    "</body></html>";
    
   
    NSString *sHtml18 = @"<html><head><style>"
    "p.heading { background-color: #dddddd; color:#000; font-family: \"Avenir Next\" !important;  }"
    "p.text  { background-color: #fff; color:#333; font-family: \"Avenir Next\" !important; }"
    "</style></head><body>"
    "<div class='heading'><p class='heading'>Second Performance Period (Jan-Jun)</p></div>"
    "<div class='text'><p class='text'>Reporting and Data Collection<br><br>Analysis and Scoring of 2017 data.<br><br></div>"
    "<div class='heading'><p class='heading'>Second Feedback Report (July)</p></div>"
    "<div class='text'><p class='text'>Targeted Review based on 2017 MIPS performance</div>"
    "</body></html>";

    
    NSString *sHtml19 = @"<html><head><style>"
    "p.heading { background-color: #dddddd; color:#000; font-family: \"Avenir Next\" !important;  }"
    "p.text  { background-color: #fff; color:#333; font-family: \"Avenir Next\" !important; }"
    "</style></head><body>"
    
    "<div class='heading'><p class='heading'>MIPS Payment Adjustments based on 2017 data Begin</p></div>"
    "<div class='text'><p class='text'>Based on a MIPS Composite Performance Score, clinicians will receive +/- or neutral adjustments up to 4 percent.<br><br>The potential maximum adjustment % will increase each year from 2019 to 2022.<br><br>MIPS payment adjustments will begin in 2019 based on physicians’ performances across the 4 MIPS domains in 2017.</div>"
    "<div class='heading'><p class='heading'>Eligibility</p></div>"
    "<div class='text'><p class='text'>The definition of \“eligible clinician\” under MIPS may expand in future years to include physical or occupational therapists, speech-language pathologists, audiologists, nurse midwives, clinical social workers, clinical psychologists, and/or dietitians/nutritional professionals.</div>"
    "</body></html>";
    
    
    NSString *sHtml20 = @"<html><head><style>"
    "p.heading { background-color: #dddddd; color:#000; font-family: \"Avenir Next\" !important;  }"
    "p.text  { background-color: #fff; color:#333; font-family: \"Avenir Next\" !important; }"
    "</style></head><body>"
   
    "<div class='heading'><p class='heading'>MIPS Payment Adjustments in Effect</p></div>"
    "<div class='text'><p class='text'>Based on a MIPS Composite Performance Score, clinicians will receive +/- or neutral adjustments up to 5 percent.<br><br>The potential maximum adjustment % will increase each year from 2019 to 2022</div>"
    "</body></html>";

    
    NSString *sHtml21 = @"<html><head><style>"
    "p.heading { background-color: #dddddd; color:#000; font-family: \"Avenir Next\" !important;  }"
    "p.text  { background-color: #fff; color:#333; font-family: \"Avenir Next\" !important; }"
    "</style></head><body>"
    
    "<div class='heading'><p class='heading'>MIPS Payment Adjustments in Effect</p></div>"
    "<div class='text'><p class='text'>Based on a MIPS Composite Performance Score, clinicians will receive +/- or neutral adjustments up to 7 percent.<br><br>The potential maximum adjustment % will increase each year from 2019 to 2022</div>"
    "</body></html>";
    
    NSString *sHtml22 = @"<html><head><style>"
    "p.heading { background-color: #dddddd; color:#000; font-family: \"Avenir Next\" !important;  }"
    "p.text  { background-color: #fff; color:#333; font-family: \"Avenir Next\" !important; }"
    "</style></head><body>"
   
    "<div class='heading'><p class='heading'>MIPS Payment Adjustments in Effect</p></div>"
    "<div class='text'><p class='text'>Based on a MIPS Composite Performance Score, clinicians will receive +/- or neutral adjustments up to 9 percent.<br><br>The potential maximum adjustment % will increase each year from 2019 to 2022</div>"
    "</body></html>";
    

    self.arrWeb = [[NSMutableArray alloc] initWithObjects:sHtml16,sHtml17,sHtml18,sHtml19,sHtml20,sHtml21,sHtml22, nil];

    
//    NSURL *url = [NSURL URLWithString:[sHtml stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
 //   [_webView loadHTMLString:sHtml baseURL:nil];
  //  [self.webView loadHTMLString:sHtml baseURL:nil];
    
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
