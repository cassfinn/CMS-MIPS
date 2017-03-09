//
//  ChecklistViewController.m
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/9/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "ChecklistViewController.h"
#import "ChecklistCollectionViewCell.h"
#import "ChecklistItem.h"
#import "WebViewController.h"
#import "Presentation.h"


@interface ChecklistViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *arrList;
@property (nonatomic, assign) NSInteger selectedItem;

@end

@implementation ChecklistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIBarButtonItem *barButtonItemMenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    [barButtonItemMenu setImage:[UIImage imageNamed:@"hamburger.png"]];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    space.width = 30;
    NSArray *buttons = @[barButtonItemMenu, space];
    self.navigationItem.leftBarButtonItems = buttons;

    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);

    [self setupChecklist];
    
    
    [self.collectionView reloadData];
    
}

-(void)showMenu  {
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)setupChecklist  {
    
    self.arrList = [[NSMutableArray alloc] init];
    
//    ChecklistItem *item = [ChecklistItem new];
//    item.title = @"Determine if you are eligible to participate in MIPS or APM";
//    item.webLink = @"https://www.ama-assn.org/ama/pub/advocacy/topics/medicare-new-payment-systems.page"; //@"https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/MIPS-Scoring-Methodology-slide-deck.pdf";
//    item.summary = @"Whether you ultimately participate in an APM or the MIPS, taking action in the following areas can position your practice for success in the future.<br>"
//    "General Considerations<br>"
//    "<li>Determine whether you have $10,000 or less in Medicare charges and 100 or fewer Medicare patients annually. If so, you are exempt from MIPS participation.<br>"
//    "If you are not already participating in a patient clinical data registry, contact your specialty society about participating in theirs—data registries can streamline reporting and assist with MIPS performance scoring.<br>"
//    "Physicians in a practice of more than one eligible clinician should decide whether to report individually or as a group.<br>"
//    "Determine whether your practice meets the requirements for small, rural or non-patient- facing physician accommodations.";
//    [self.arrList addObject:item];
    
    
    
    ChecklistItem *item2a = [ChecklistItem new];
    item2a.title = @"Determine if you should participate in MIPS as an individual or a group.";
    item2a.webLink = @"https://qpp.cms.gov/learn/getprepared";
    [self.arrList addObject:item2a];

    
    ChecklistItem *item2b = [ChecklistItem new];
    item2b.title = @"Check that your electronic health record is certified for MACRA reporting.";
    item2b.webLink = @"https://chpl.healthit.gov/#/search";
    [self.arrList addObject:item2b];

    
    
    ChecklistItem *item2 = [ChecklistItem new];
    item2.title = @"Understand MIPS quality metrics and reporting requirements.";
    item2.webLink = @"https://qpp.cms.gov/measures/performance";
    [self.arrList addObject:item2];
    
    
    
    
   
    ChecklistItem *item3 = [ChecklistItem new];
    item3.title = @"Review your current Quality resource use reports.";
    item3.webLink = @"https://www.cms.gov/Medicare/Medicare-Fee-for-Service-Payment/PhysicianFeedbackProgram/Obtain-2013-QRUR.html";
    [self.arrList addObject:item3];
    
    ChecklistItem *item4 = [ChecklistItem new];
    item4.title = @"Review current PQRS and feedback reports.";
    item4.webLink = @"https://www.cms.gov/Medicare/Medicare-Fee-for-Service-Payment/PhysicianFeedbackProgram/Obtain-2013-QRUR.html";
    [self.arrList addObject:item4];
    
    
    ChecklistItem *item5 = [ChecklistItem new];
    item5.title = @"Review Clinical Practice Improvement Activities and identify which might work for your practice.";
    item5.webLink = @"https://qpp.cms.gov/measures/ia";
    [self.arrList addObject:item5];

    ChecklistItem *item6 = [ChecklistItem new];
    item6.title = @"Sign up to report quality data to a qualified clinical data registry.";
    item6.webLink = @"https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/Downloads/EHR_CentRepos_Form.pdf";
    [self.arrList addObject:item6];
    
    
    ChecklistItem *item7= [ChecklistItem new];
    item7.title = @"Plan to conduct a security risk analysis in early 2017.";
    item7.webLink = @"https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/Downloads/2016_SecurityRiskAnalysis.pdf";
    [self.arrList addObject:item7];
    
//    ChecklistItem *item8= [ChecklistItem new];
//    item8.title = @"Plan to conduct a security risk analysis in early 2017.";
//    item8.webLink = @"https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/Downloads/EHR_CentRepos_Form.pdf";
//    [self.arrList addObject:item8];

    
//    item.title = @"Conduct a security risk analysis";
//    item.title = @"Identify additional public health registries for reporting";
//    item.title = @"Update your EHR system";
    

}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    return CGSizeMake(self.view.bounds.size.width/1.0-(16*2), (self.view.bounds.size.width/3-(16*2))*1.16 );
     
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
          return self.arrList.count;
  
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    ChecklistCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"CellChecklist" forIndexPath:indexPath];
    ChecklistItem *item = [self.arrList objectAtIndex:indexPath.row];
    
    cell.lblTitle.text = item.title;
    [cell.lblTitle sizeToFit];
    
    
    cell.layer.borderColor = [UIColor colorWithRed:241.0/255.0f green:241.0/255.0f blue:241.0/255.0f alpha:0.8].CGColor;
    cell.layer.borderWidth = 1.0f;
    cell.layer.cornerRadius = 8.0f;
    
    // load the image for this cell
    //    NSString *imageToLoad = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    //    cell.image.image = [UIImage imageNamed:imageToLoad];
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didselect");
    self.selectedItem = indexPath.row;
//    self.navigationItem.hidesBackButton = YES;
    [self performSegueWithIdentifier:@"WebViewController" sender:self];
    
    self.navigationItem.hidesBackButton = NO;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //    if ( [segue.identifier isEqualToString:@"QualityDetailViewController"] )  {
    WebViewController *vc = segue.destinationViewController;
    ChecklistItem *item = [self.arrList objectAtIndex:self.selectedItem];
    Presentation *presentation = [Presentation new];
    presentation.title = item.title;
    presentation.link = item.webLink;
    vc.presentation = presentation;
    
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
