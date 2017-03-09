//
//  AciViewController.m
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/2/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "AciViewController.h"
#import "QualityTableViewCell.h"
#import "AciCategory.h"
#import "AciMeasure.h"


@interface AciViewController ()

@property (nonatomic, strong) NSMutableArray *arrBase;
@property (nonatomic, strong) NSMutableArray *arrPerformanceObjectives;
@property (nonatomic, strong) NSMutableArray *arrBonus;

@property (nonatomic, strong) NSMutableArray *arrRequired;
@property (nonatomic, strong) NSMutableArray *arrMustFillOut;
@property (nonatomic, strong) NSMutableArray *arrEarnPoints;

@property (nonatomic, strong) NSMutableArray *arrCategories;



@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AciViewController

//https://www.cms.gov/Medicare/Quality-Initiatives-Patient-Assessment-Instruments/Value-Based-Programs/MACRA-MIPS-and-APMs/Advancing-Care-Information-Fact-Sheet.pdf

//Blog: ACI:  https://blog.cms.gov/2016/04/27/moving-toward-improved-care-through-information/


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Advancing Care Information";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 90.0;
   
    
    self.arrCategories = [[NSMutableArray alloc] init];
    
    AciCategory *cat = [AciCategory new];
    cat.name = @"Protect Patient Health Information";
    AciMeasure *measure = [AciMeasure new];
    measure.name = @"Security Risk Analysis";
    measure.desc = @"Conduct or review a security risk analysis, including addressing the security (including encryption) of electronic personal health information created or maintained by CEHRT; implement security updates as necessary, and correct identified security deficiencies as part of the provider’s risk management process.";
    measure.type = @"Yes required";
    measure.isRequired = @"1";
    cat.arrMeasure = [[NSMutableArray alloc] initWithObjects:measure, nil];
    
    
    
    
    AciCategory *cat2 = [AciCategory new];
    cat2.name = @"Electronic Prescribing";
    AciMeasure *measure2 = [AciMeasure new];
    measure2.name = @"Electronic Prescribing";
    measure2.desc = @"At least one permissible prescription written by the provider is queried for a drug formulary and transmitted electronically using CEHRT.";
    measure2.type = @"x/y at least 1 in numerator";
    measure2.isRequired = @"1";
    cat2.arrMeasure = [[NSMutableArray alloc] initWithObjects:measure2, nil];
    
    
    
    AciCategory *cat3 = [AciCategory new];
    cat3.name = @"Patient Electronic Access";
    
    AciMeasure *measure3a = [AciMeasure new];
    measure3a.name = @"Patient Access Measure";
    measure3a.desc = @"For at least one unique patient seen by the provider, (1) the patient (or patient-authorized representative) is provided timely access to view online, download, and transmit his or her health information, and (2) the provider ensures the patient’s health information is available for the patient (or patient-authorized representative) to access using any application of his or her choice that is configured to meet the technical specifications of the Application Programming Interface (API) in the provider’s CEHRT.";
    measure3a.type = @"x/y at least 1 in numerator";
    measure3a.isRequired = @"1";
    
    AciCategory *cat3b = [AciCategory new];
    cat3b.name = @"Patient Electronic Access";
    AciMeasure *measure3b = [AciMeasure new];
    measure3b.name = @"Patient-Specific Education Measure";
    measure3b.desc = @"The provider must use clinically relevant information from the CEHRT to identify patient-specific educational resources, and provide electronic access to those materials, to at least one unique patient seen by the provider.";
    measure3b.type = @"x/y at least 1 in numerator";
    measure3b.isRequired = @"1";
    
    cat3.arrMeasure = [[NSMutableArray alloc] initWithObjects:measure3a,measure3b, nil];
    
    
    
    AciCategory *cat4 = [AciCategory new];
    cat4.name = @"Coordination of Care through Patient Engagement";
    
    AciMeasure *measure4 = [AciMeasure new];
    measure4.name = @"View, Download, Transmit Measure";
    measure4.desc = @"At least one unique patient (or patient-authorized representative) seen by the provider during the performance period actively engages with the EHR made accessible by the provider. A provider may meet the measure by having a patient either (1) view, download, or transmit to a third party his or her health information; or (2) access his or her health information through the use of an API that can be used by applications chosen by the patient and configured to the API in the provider’s CEHRT; or (3) a combination of (1) and (2).";
    measure4.type = @"x/y at least 1 in numerator";
    measure4.isRequired = @"1";
    
    AciMeasure *measure4b = [AciMeasure new];
    measure4b.name = @"Secure Messaging Measure";
    measure4b.desc = @"For at least one unique patient seen by the provider during the performance period, a secure message was sent using the electronic messaging function of the CEHRT to the patient (or patient-authorized representative), or in response to a secure message sent by the patient (or patient- authorized representative).";
    measure4b.isRequired = @"1";

     AciMeasure *measure4c = [AciMeasure new];
    measure4c.name = @"Patient-Generated Health Data Measure";
    measure4c.desc = @"Patient-generated health data or data from a non-clinical setting is incorporated into the CEHRT for at least one unique patient seen by the provider during the performance period";
    measure4c.isRequired = @"1";
    cat4.arrMeasure = [[NSMutableArray alloc] initWithObjects:measure4,measure4b,measure4c, nil];

    
    AciCategory *cat5 = [AciCategory new];
    cat4.name = @"Health Information Exchange";
    
    AciMeasure *measure5 = [AciMeasure new];
    measure5.name = @"Patient Care Record Exchange Measure";
    measure5.desc = @"For at least one transition of care or referral, the provider who transitions or refers his or her patient to another setting of care or health care provider (1) creates a summary of care record using CEHRT; and (2) electronically exchanges the summary of care record.";
    measure5.isRequired = @"1";

    AciMeasure *measure5b = [AciMeasure new];
    measure5b.name = @"Request/Accept Patient Care Record Measure";
    measure5b.desc = @"For at least one transition of care or referral received or patient encounter in which the provider has never before encountered the patient, the provider received, or retrieves and incorporates into the patient’s record, an electronic summary of care document.";
    measure5b.isRequired = @"1";
    
    AciMeasure *measure5c = [AciMeasure new];
    measure5c.name = @"Clinical Information Reconciliation Measure";
    measure5c.desc = @"For at least one transition of care or referral received or patient encounter in which the provider has never before encountered the patient, the provider performs clinical information reconciliation. The provider must implement clinical information reconciliation for the following three clinical information sets: (1) Medication— Review of the patient’s medication including the name, dosage, frequency, and route of each medication; (2) Medication Allergy—Review of the patient’s known medication allergies; and (3) Current Problem List—Review of the patient’s current and active diagnoses.";
    measure5c.isRequired = @"1";
    cat5.arrMeasure = [[NSMutableArray alloc] initWithObjects:measure5,measure5b,measure5c, nil];

    
    
    
    
    
    @"Must Do - or no points earned";
    @"Must Enter Yes or No - or no points earned";
    @"Earn points for these";
    
    
    
    
    
    self.arrBase = [[NSMutableArray alloc] initWithObjects:@"Protect Patient Health Information", @"Electronic Prescribing", @"Patient Electronic Access", @"Coordination of Care through Patient Engagement", @"Health Information Exchange", @"Public Health and Clinical Data Registry Reporting", nil];
    
    NSString *note = @"Because of the importance of protecting patient privacy and security, physicians and other clinicians must be able to report “yes” to the Protect Patient Health Information objective to receive any score in the Advance Care Information performance category.";
    
    
    self.arrPerformanceObjectives = [[NSMutableArray alloc] initWithObjects:@"Patient Electronic Access", @"Coordination of Care through Patient Engagement", @"Health Information Exchange", nil];
    
    self.arrBonus = [[NSMutableArray alloc] initWithObjects:@"Public Health Registry", nil];
    
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(8,4, viewHeader.bounds.size.width-16, 44)];
    lbl.numberOfLines = 0;
    lbl.lineBreakMode = NSLineBreakByWordWrapping;
    lbl.text = @"Confirm that you do the following in order to earn points. ";
    [viewHeader addSubview:lbl];
    
    self.tableView.tableHeaderView = viewHeader;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section  {

      
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(16,8,self.view.bounds.size.width-32,48)];
    if (section == 0)  {
        lbl.text = @"Required - Must do to earn any points";
        lbl.textColor = [UIColor redColor];
    }
    else if (section == 1)  {
        lbl.text = @"Required - Enter yes or no to earn the 50 points Base Score";
        lbl.textColor = [UIColor redColor];
   }
    else if (section == 2)  {
        lbl.text = @"Enter yes to at least 5 to get the maximum 100 points in the Performance score";
        lbl.textColor = [UIColor darkTextColor];
   }
    else if (section == 3)  {
        lbl.text = @"Bonus of 1 point";
        lbl.textColor = [UIColor darkTextColor];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    
    if (indexPath.section == 0)  {
        if (indexPath.row == 0)
            cell.textLabel.text = @"Protect Patient Health Information. (Required)";
        else if (indexPath.row == 1)
            cell.textLabel.text = @"Public Health and Clinical Data Registry Reporting. (Required)";
    }
    else if (indexPath.section == 1)  {
        if (indexPath.row == 0)
            cell.textLabel.text = @"Electronic Prescribing";
    }
    else if (indexPath.section == 2)  {
        if (indexPath.row == 0)
            cell.textLabel.text = @"Patient Electronic Access - Patent Access";
        else if (indexPath.row == 1)
            cell.textLabel.text = @"Patient Electronic Access - Patent-Specific Education";

        
        else if (indexPath.row == 2)
            cell.textLabel.text = @"Coordination of Care Through Patient Engagement - View Download and Transmit (VDT)";
        else if (indexPath.row == 3)
            cell.textLabel.text = @"Coordination of Care Through Patient Engagement - Secure Messaging";
        else if (indexPath.row == 4)
            cell.textLabel.text = @"Coordination of Care Through Patient Engagement - Patient-Generated Health Data";
        
        
        
        else if (indexPath.row == 5)
            cell.textLabel.text = @"Health Information Exchange - Exchange information with other physicians or clinicians";
        else if (indexPath.row == 6)
            cell.textLabel.text = @"Health Information Exchange - Exchange information with patients";
        else if (indexPath.row == 7)
            cell.textLabel.text = @"Health Information Exchange - Clinical Informaton Reconciliation";
        
        
        
    }
    else if (indexPath.section == 3)  {
        if (indexPath.row == 0)  {
            cell.textLabel.text = @"Public Health Registry";
        }
    }
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;

    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    if (indexPath.section == 0)  {
        
    }
    
 //   [self performSegueWithIdentifier:@"QualityDetailViewController" sender:self];
    
 //   self.navigationItem.hidesBackButton = NO;
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
      return 60;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0)
        return 2;
    else if (section == 1)
        return 1;
    else if (section == 2)
        return 8;
    else if (section == 3)
        return 1;

    return 1;
    
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
