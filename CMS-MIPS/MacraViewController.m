//
//  MacraViewController.m
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/8/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "MacraViewController.h"
#import "Presentation.h"
#import "WebViewController.h"
#import "AboutWebViewController.h"


@interface MacraViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arrPresentations;

@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, strong) Presentation *selectedPresentation;

@end


// Timeline:
// https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/Timeline.PDF


// LogIn to get updates from Listserv:
// https://public-dc2.govdelivery.com/accounts/USCMS/subscriber/new?topic_id=USCMS_12196
//Progress Towards Achieving Better Care, Smarter Spending, Healthier People


// FAQ
//https://innovation.cms.gov/Files/x/macra-faq.pdf



@implementation MacraViewController

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
    
    //Overview of QPP:
    
    Presentation *p0 = [Presentation new];
    p0.link = @"https://qpp.cms.gov";
    p0.title = @"The Quality Payment Program";
    p0.subTitle = @"Official website of the QPP";
    p0.linkSummary = @"What's the Quality Payment Program?  The QPP improves Medicare by helping you focus on care quality and the one thing that matters most - making patients healthier.";
    p0.linkType = @"url";
    p0.linkId = @"100";
    [self.arrPresentations addObject:p0];

    
    Presentation *p0d = [Presentation new];
    p0d.link = @"https://qpp.cms.gov/docs/Quality_Payment_Program_Overview_Fact_Sheet.pdf";
    p0d.title = @"The Quality Payment Program Overview Fact Sheet";
    p0d.subTitle = @"pdf Overview of the QPP";
    p0d.linkSummary = @"On October 14, 2016, the Department of Health and Human Services (HHS) issued its final rule with"
    "comment period implementing the Quality Payment Program that is part of the Medicare Access and CHIP Reauthorization Act of 2015 (MACRA). The Quality Payment Program improves Medicare by helping focus on care quality and the one thing that matters most — making patients healthier.";
    p0d.linkType = @"url";
    p0d.linkId = @"130";
    [self.arrPresentations addObject:p0d];
    
    Presentation *p0a = [Presentation new];
    p0a.link = @"n9zAn0jZEVc";
    p0a.title = @"What is MACRA?";
    p0a.subTitle = @"Video Introducing MACRA, MIPS, APM and the QPP";
    p0a.linkSummary = @"A video which explains what the Medicare Access and CHIP Reauthorization Act, Merit-Based Incentives and Alternate Payment Models.";
    p0a.linkType = @"youtube";
    p0a.linkId = @"100";
    [self.arrPresentations addObject:p0a];
    
    
    Presentation *p0b = [Presentation new];
    p0b.link = @"k6iN-0mw9QE";
    p0b.title = @"Medicare Quality Reporting - What Eligible Professionals Need to Know";
    p0b.linkSummary = @"Video Introducing MACRA, MIPS, APM and the QPP focusing on Eligible Particants. PQRS, Value Modifier, and how your participation this year will determine future reporting.";
    p0b.linkType = @"youtube";
    p0b.linkId = @"100";
    [self.arrPresentations addObject:p0b];

    
    
    
    
    Presentation *p = [Presentation new];
    p.link = @"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/Quality-Payment-Program-MACRA-NPRM-slides-consumer-version.pdf";
    p.title = @"Quality Payment Program for Consumers";
    p.subTitle = @"Slide deck - consumer version";
    p.linkType = @"url";
    p.linkSummary = @"This presentation explains Delivery System Reform, Quality Payment Program, Merit-based Incentive Payment System (MIPS), Advanced Alternative Payment Model, and Timeline and Next Steps.";
    p.linkId = @"101";
    [self.arrPresentations addObject:p];
    
    Presentation *p2 = [Presentation new];
    p2.link = @"7df7cHghaS4";
    p2.title = @"Delivery System Reform: Paying for What Works";
    p2.subTitle = @"Short video";
    p2.linkType = @"youtube";
    p2.linkSummary = @"A short video directed at patients which explains how MACRA changes in requirements will affect them.";
    p2.linkId = @"102";
    [self.arrPresentations addObject:p2];
   
    
    Presentation *p1 = [Presentation new];
    p1.link = @"https://www.stepsforward.org/modules/value-based-care";
    p1.title = @"AMA - Steps Forward Value Based Care";
    p1.subTitle = @"web tutorial from the AMA";
    p1.linkType = @"url";
    p1.linkSummary = @"What is Value Based Care?  Unlike traditional fee-for-service care models that link payment to the number and type of individual services utilized, value-based care is intended to at least partially link payments to patients’ health outcomes and/or quality of care. ";
    p1.linkId = @"101a";
    [self.arrPresentations addObject:p1];
    
    Presentation *p6 = [Presentation new];
    p6.link = @"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/Quality-Payment-Program-MIPS-NPRM-Slides.pdf";
    p6.title = @"MIPS Training";
    p6.subTitle = @"Slide deck";
    p6.linkType = @"Slide";
    p6.linkSummary = @"1) The Quality Payment Program and HHS Secretary’s Goals \n2) What is the Quality Payment Program?\n"
    "3) How do I submit comments on the proposed rule?\n"
    "4) The Merit-based Incentive Payment System (MIPS)\n"
    "5) What are the next steps?\n";
    p6.linkId = @"106";
    [self.arrPresentations addObject:p6];

    Presentation *p19 = [Presentation new];
    p19.link = @"https://innovation.cms.gov/Files/x/macra-faq.pdf";
    p19.title = @"FAQ - MACRA RFI Posting";
    p19.subTitle = @"Frequently Asked Questions about MACRA";
    p19.linkType = @"url";
    p19.linkSummary = @"General Answers to the most Frequently Asked Questions. Covers the legislation, background, and how to express your opinions about it.";
    p19.linkId = @"119";
    [self.arrPresentations addObject:p19];
    
    
    
    
    
    // How Payments Work

    
    // EHR
    Presentation *p17 = [Presentation new];
    p17.link = @"https://www.healthit.gov/playbook/value-based-care/";
    p17.title = @"EHR - Health IT Playbook";
    p17.subTitle = @"Information about electronic health record (EHR) systems, ";
    p17.linkType = @"web";
    p17.linkSummary = @"Health care payments should encourage improvements in care delivery and ensure patient centered care including care coordination, integration, and prevention and wellness is compensated appropriately. Reconfiguring payments for health care services to incentivize value will allow providers to invest in practice improvements that optimize the provision of care that is more focused on patient needs.";
    p17.linkId = @"117";
    [self.arrPresentations addObject:p17];
    
    Presentation *p2b = [Presentation new];
    p2b.link = @"XrxXEIFtfoQ";
    p2b.title = @"Electronic Health Records and Health Care Data";
    p2b.subTitle = @"Short video";
    p2b.linkType = @"youtube";
    p2b.linkSummary = @"A short video directed to patients, explaining the benefits of having electronic health records.";
    p2b.linkId = @"102";
    [self.arrPresentations addObject:p2b];

    Presentation *p5 = [Presentation new];
    p5.link = @"https://www.hhs.gov/healthcare/delivery-system-reform/unlocking-data/index.html";
    p5.title = @"Unlocking Data";
    p5.subTitle = @"Sharing electronic health records";
    p5.linkType = @"Short video";
    p5.linkSummary = @"Doctors and hospitals can share information with one another for the purposes of patient care and health."
    "There has been confusion over how individuals are allowed to access their own information. Individuals have a right to access their own information for low fees and direct it where they wish, including to third party apps.";
    p5.linkId = @"105";
    [self.arrPresentations addObject:p5];
    
    Presentation *p18 = [Presentation new];
    p18.link = @"https://www.youtube.com/watch?v=7bbwMKs43n8";
    p18.title = @"All Tribes Call: MACRA and MIPS Proposed Rule";
    p18.subTitle = @"Information about electronic health record (EHR) systems, ";
    p18.linkType = @"web";
    p18.linkSummary = @"The Centers for Medicare & Medicaid Services (CMS) released a proposed rule on April 27th, 2016, MIPs & APMs in Medicare-Fee-for-Service - CMS-5517-P, that is intended to align and modernize how Medicare payments are tied to the cost and quality of patient care for hundreds of thousands of doctors and other clinicians.";
    p18.linkId = @"118";
    [self.arrPresentations addObject:p18];

    
    
    // Purpose
    Presentation *p3 = [Presentation new];
    p3.link = @"https://www.hhs.gov/healthcare/delivery-system-reform/index.html";
    p3.title = @"Making Health Care Work Better for Everyone";
    p3.subTitle = @"web";
    p3.linkType = @"url";
    p3.linkSummary = @"Making Health Care Work Better For Everyone. Since President Obama signed the Affordable Care Act into law, we’ve made important progress to bring more access to quality, affordable health care. This progress has changed people’s lives, but it’s important to remember that the ACA has always been about more than affordable, quality coverage.";
    p3.linkId = @"103";
    [self.arrPresentations addObject:p3];
    
    
    Presentation *p4 = [Presentation new];
    p4.link = @"https://www.hhs.gov/healthcare/delivery-system-reform/paying-quality-care/index.html";
    p4.title = @"Paying for Quality Care";
    p4.subTitle = @"web";
    p4.linkType = @"url";
    p4.linkSummary = @"In many practices today, doctors get paid for each test, treatment and procedure separately. Not surprisingly, this way of paying for services leads to more services. But it doesn’t necessarily lead to better quality.";
    p4.linkId = @"104";
    [self.arrPresentations addObject:p4];

    Presentation *p7 = [Presentation new];
    p7.link = @"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/MACRA-LAN-PPT.pdf";
    p7.title = @"MACRA - Path to Value";
    p7.subTitle = @"Slide deck introducing MACRA";
    p7.linkType = @"web";
    p7.linkSummary = @"MACRA is part of a broader push towards value and quality. How the new Merit-based Incentive Payment System helps to link fee-for-service payments to quality and value.";
    p7.linkId = @"107";
    [self.arrPresentations addObject:p7];
    
    
    
 
 
    
    // Performance Categories & Scoring
    Presentation *p8 = [Presentation new];
    p8.link = @"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/Quality-Performance-Category-training-slide-deck.pdf";
    p8.title = @"MIPS - Quality Performance Category";
    p8.subTitle = @"Slide deck";
    p8.linkType = @"web";
    p8.linkSummary = @"Introducing the Quality Payment Program.  Covers MIPS Scoring, Incentives, Eligibility, and Reporting Options";
    p8.linkId = @"108";
    [self.arrPresentations addObject:p8];

    
    Presentation *p10 = [Presentation new];
    p10.link = @"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/CPIA-Performance-Category-slide-deck.pdf";
    p10.title = @"MIPS - Clinical Practice Improvement Activities Performance Category";
    p10.subTitle = @"Slide deck";
    p10.linkType = @"web";
    p10.linkSummary = @"MIPS - Resource Use Performance Category. Introduces MIPS, covers scoring and payments and explains the Clinical Practice Improvement Activities Performance Category.";
    p10.linkId = @"110";
    [self.arrPresentations addObject:p10];

    
    Presentation *p11 = [Presentation new];
    p11.link = @"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/MIPS-Scoring-Methodology-slide-deck.pdf";
    p11.title = @"MIPS - Scoring Methodology Overview";
    p11.subTitle = @"Slide deck";
    p11.linkType = @"web";
    p11.linkSummary = @"MIPS - Scoring Methodology Overview. Introduces MIPS, covers performance categories, Composite Performance Scoring, payment formulas, and how the MIPS Payment Adjustment is calculated. Also covers special scoring standards for MIPS APMs.";
    p11.linkId = @"111";
    [self.arrPresentations addObject:p11];

    
    Presentation *p13 = [Presentation new];
    p13.link = @"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/Quality-Payment-Program-All-Payer-Overview.pdf";
    p13.title = @"Quality Payment Program - All-Payer Combination Option";
    p13.subTitle = @"Slide deck";
    p13.linkType = @"web";
    p13.linkSummary = @"Key Topics:\n"
    "1) The Quality Payment Program and HHS Secretary’s Goals\n"
    "2) The Merit-based Incentive Payment System (MIPS) and Advanced Alternative Payment Models (Advanced APMs)\n"
    "3) Medicaid and Private Payers\n"
    "4) Next Steps";
    p13.linkId = @"113";
    [self.arrPresentations addObject:p13];


    
    // Small Practices
    
    Presentation *p14 = [Presentation new];
    p14.link = @"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/Small-Practices-Fact-Sheet.pdf";
    p14.title = @"Flexibilities and Support for Small Practices";
    p14.subTitle = @"Detailed";
    p14.linkType = @"web";
    p14.linkSummary = @"This paper details the flexibility and support available to small practices and practices in rural or health professional shortage areas in the proposed rule. CMS is committed to a continued dialogue regarding the obstacles and challenges these practices encounter, both during the rulemaking period and throughout the implementation of the Quality Payment Program.";
    p14.linkId = @"114";
    [self.arrPresentations addObject:p14];
 
    
    Presentation *p14a = [Presentation new];
    p14a.link = @"https://qpp.cms.gov/docs/QPP_Small_Practice.pdf";
    p14a.title = @"Support for Small Practices";
    p14a.subTitle = @"Summary";
    p14a.linkType = @"web";
    p14a.linkSummary = @"This paper details the flexibility and support available to small practices and practices in rural or health professional shortage areas in the proposed rule. CMS is committed to a continued dialogue regarding the obstacles and challenges these practices encounter, both during the rulemaking period and throughout the implementation of the Quality Payment Program.";
    p14a.linkId = @"114";
    [self.arrPresentations addObject:p14a];

    
    
    
    //very technical - not user friendly
    
    Presentation *p15 = [Presentation new];
    p15.link = @"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/Final-MDP.pdf";
    p15.title = @"CMS Quality Measure Development Plan";
    p15.subTitle = @"web - Detailed";
    p15.linkType = @"web";
    p15.linkSummary = @"How measurements are determined. CMS Quality Measure Development Plan: Supporting the Transition to the Merit-based Incentive Payment System (MIPS) and Alternative Payment Models (APMs)";
    p15.linkId = @"115";
    [self.arrPresentations addObject:p15];
  

     Presentation *p16 = [Presentation new];
    p16.link = @"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/MACRA-MIPS-and-APMs.html";
    p16.title = @"What's the Merit-Based Incentive Payment System (MIPS)?";
    p16.subTitle = @"web";
    p16.linkType = @"web";
    p16.linkSummary = @"A web page with links to more information about the Quality Payment Program and the CMS Quality Measure Development Plan.";
    p16.linkId = @"116";
    [self.arrPresentations addObject:p16];

    
    Presentation *p22 = [Presentation new];
    p22.link = @"https://qpp.cms.gov/docs/QPP_APMs_and_Improvement_Activities.pdf";
    p22.title = @"Scores for Improvement Activities in MIPS APMs in the 2017 Performance Period";
    p22.subTitle = @"List of Improvement Activity Measures";
    p22.linkSummary = @"Certain Alternative Payment Models (APMs) include MIPS eligible clinicians as participants and hold their participants accountable for the cost and quality of care provided to Medicare beneficiaries. This type of APM is called a “MIPS APM,” and participants in MIPS APMs receive special MIPS scoring under the APM scoring standard.";
    p22.linkType = @"url";
    p22.linkId = @"127";
    [self.arrPresentations addObject:p22];

  

    
    
    
    // Practical Info - How to Prepare
    
    //AMA:  http://www.ama-assn.org/ama/pub/advocacy/topics/medicare-new-payment-systems.page
    Presentation *p20 = [Presentation new];
    p20.link = @"http://www.ama-assn.org/ama/pub/advocacy/topics/medicare-new-payment-systems.page";
    p20.title = @"Scoring for Improvement Activities";
    p20.subTitle = @"AMA - Medicare Payment Reform";
    p20.linkType = @"url";
    p20.linkSummary = @"Scores for Improvement Activities in MIPS APMs in the 2017 Performance Period Certain Alternative Payment Models (APMs) include MIPS eligible clinicians as participants and hold their participants accountable for the cost and quality of care provided to Medicare beneficiaries.";
    p20.linkId = @"120";
    [self.arrPresentations addObject:p20];
    
    
    

 
    Presentation *p21d = [Presentation new];
    p21d.link = @"https://download.ama-assn.org/resources/doc/washington/16-0384-advocacy-macra-action-kit.pdf";
    p21d.title = @"AMA Action Kit to Prepare for MACRA";
    p21d.subTitle = @"pdf from AMA";
    p21d.linkType = @"url";
    p21d.linkSummary = @"AMA Action Kit to Prepare for MACRA.  With the repeal of the sustainable growth rate (SGR) behind us, we are moving into a new era of Medicare physician payment under the Medicare Access and CHIP Reauthorization Act (MACRA).";
    p21d.linkId = @"120";
    [self.arrPresentations addObject:p21d];

    
 
    
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

    
    [self performSegueWithIdentifier:@"AboutWebViewController" sender:self];
    
    self.navigationItem.hidesBackButton = NO;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //    if ( [segue.identifier isEqualToString:@"QualityDetailViewController"] )  {
    AboutWebViewController *vc = segue.destinationViewController;
    vc.presentation = [self.arrPresentations objectAtIndex:self.selectedRow];
    
    
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
    
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
