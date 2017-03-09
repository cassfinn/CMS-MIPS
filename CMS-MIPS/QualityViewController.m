//
//  QualityViewController.m
//  MIPS
//
//  Created by Claudia Cassidy on 9/10/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//



#import "QualityViewController.h"
#import "CrossCutMeasure.h"
#import "CellState.h"
#import "QualityTableViewCell.h"
#import "SpecialtyMeasure.h"
#import "QualityDetailViewController.h"


@interface QualityViewController ()

@property (nonatomic, strong) NSMutableArray *arrSpecialty;

@property (nonatomic, strong) NSMutableArray *arrOther;

@property (nonatomic, strong) NSMutableArray *arrCrossCutting;
@property (nonatomic, strong) NSMutableArray *arrOutcome;
@property (nonatomic, strong) NSMutableArray *arrMeasures;
@property (nonatomic, strong) NSMutableArray *arrMeasuresAll;

@property (weak, nonatomic) IBOutlet UITableView *tableViewMeasures;

@property (strong, nonatomic) UITableView *tableViewFilter;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentBar;

@property (nonatomic, strong) NSMutableArray *arrMeasuresFiltered;


@property (nonatomic, assign) NSInteger selectedRow;


//@property (nonatomic, strong) NSMutableArray *arrCellState;


@property (nonatomic, assign) NSInteger selectedSpecialtyRow;

@property (nonatomic, strong) NSString *filterSpecialty;

@end



@implementation QualityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Measures";
    
    
    self.tableViewMeasures.dataSource = self;
    self.tableViewMeasures.delegate = self;
    
    self.tableViewFilter = [[UITableView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableViewFilter];
    self.tableViewFilter.delegate = self;
    self.tableViewFilter.dataSource = self;
    
  //  self.tableViewFilter.delegate = self;
  //  self.tableViewFilter.dataSource = self;
    // self.automaticallyAdjustsScrollViewInsets = false;
    
    self.tableViewMeasures.rowHeight = UITableViewAutomaticDimension;
    self.tableViewMeasures.estimatedRowHeight = 90.0;
    
    self.tableViewMeasures.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableViewMeasures.separatorColor = [UIColor colorWithRed:140.0/255.0f green:173.0/255.0f blue:174.0/255.0f alpha:0.5];
    
    self.tableViewFilter.rowHeight = UITableViewAutomaticDimension;
    self.tableViewFilter.estimatedRowHeight = 40.0;
    
    self.tableViewFilter.frame = CGRectMake(0,0,0,0);
  //  [self.tableViewFilter reloadData];
    self.tableViewFilter.hidden = YES;
   // [self.view sendSubviewToBack:self.tableViewFilter];

    
    self.arrSpecialty = [[NSMutableArray alloc] initWithObjects:@"All", @"Cardiology", @"Dermatology", @"Emergency", @"Gastroenterology", @"General Practice/Family Practice", @"General Surgery", @"Hospitalist", @"Internal Medicine", @"Mental Health", @"Multiple Chronic Conditions", @"Obstetrics/Gynecology", @"Oncology/Hematology", @"Opthalmology", @"Pathology", @"Physical Therapy/Occupational Therapy", @"Radiology", @"Urology", nil];
    
    
    
    [self loadCSV];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moreButtonTapped:) name:@"MoreButtonTapped" object:nil];
    
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:self action:@selector(filterBySpecialty)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    self.filterSpecialty = @"";
    
  //  self.tableView.tableHeaderView = self.segmentBar;
    [self.tableViewMeasures reloadData];
}


-(void)filterBySpecialty  {
    
    CGRect rect = self.tableViewFilter.frame;
    if (rect.size.width > 10 && self.tableViewFilter.isHidden == NO)  {
        UIView *view = [self.view viewWithTag:501];
        if (view)
            [view removeFromSuperview];
        self.tableViewFilter.frame = CGRectZero;
        [self.tableViewFilter reloadData];
        self.tableViewFilter.hidden = YES;
        [self.view sendSubviewToBack:self.tableViewFilter];
        [self.view bringSubviewToFront:self.tableViewMeasures];
        [self.tableViewMeasures reloadData];
        self.tableViewMeasures.hidden = NO;
        [self.view bringSubviewToFront:self.tableViewMeasures];
        self.tableViewMeasures.alpha = 1.0;
        [self.tableViewMeasures reloadData];
    }
    else  {
        UIView *viewBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableViewMeasures.bounds.size.width, self.tableViewMeasures.bounds.size.height)];
        viewBg.backgroundColor = [UIColor colorWithWhite:255 alpha:0.3];
        viewBg.tag = 501;
        [self.view addSubview:viewBg];
        
        
        self.tableViewFilter.frame = CGRectMake(32,0,self.view.bounds.size.width-32,self.tableViewMeasures.bounds.size.height-44);
        self.tableViewFilter.hidden = NO;
        self.tableViewFilter.alpha = 1.0;
        [self.view bringSubviewToFront:self.tableViewFilter];
        CGRect rect = self.tableViewFilter.bounds;
       [self.tableViewFilter reloadData];
    }
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //[self.tableView reloadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(contentSizeCategoryChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
}


- (IBAction)segBarTapped:(id)sender {
    
    if ( self.segmentBar.selectedSegmentIndex == 0)  {
        NSLog(@"1");
        
        //filter by Course
        //   NSPredicate *p = [NSPredicate predicateWithFormat:@"isCrossCuttingMeasure = 1"];
        //  NSArray *filtered = [self.arrMeasures filteredArrayUsingPredicate:p];
    }
    else if ( self.segmentBar.selectedSegmentIndex == 1)  {
        NSLog(@"2");
        //filter by Outcome
    }
    else  {
        NSLog(@"3");
        // no filter
    }
    
    [self.tableViewMeasures setNeedsDisplay];
    [self.tableViewMeasures setNeedsLayout];
    [self.tableViewMeasures reloadData];
    
}



-(void)loadCSV  {
    
    self.arrMeasures = [[NSMutableArray alloc] init];
    self.arrCrossCutting = [[NSMutableArray alloc] init];
    self.arrOutcome = [[NSMutableArray alloc] init];
    self.arrOther = [[NSMutableArray alloc] init];
    
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"measuresSpecial" withExtension:@"csv"];
    NSURL *fileUrlDesc = [[NSBundle mainBundle] URLForResource:@"measureDescEnd" withExtension:@"csv"];
    
    NSString *csv = [NSString stringWithContentsOfURL: fileUrl encoding:NSUTF8StringEncoding error:nil];
    NSString *csvDesc = [NSString stringWithContentsOfURL: fileUrlDesc encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *rows = [csv componentsSeparatedByString:@"Measure Specification Manuals"];
    NSArray *rowsDesc = [csvDesc componentsSeparatedByString:@"END"];
    
    
    
    
    for (int i=0; i < rows.count-1; i++ )  {
        
        NSString *row = [rows objectAtIndex:i];
        
        row = [row stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
        
        NSArray* col = [row componentsSeparatedByString:@","];
        
        SpecialtyMeasure *m = [[SpecialtyMeasure alloc] init];
        m.pqrs = (NSInteger)[col objectAtIndex:3];
        m.nqf = [col objectAtIndex:2];
        m.descTitle = [col objectAtIndex:0];
        
        m.descTitle = [m.descTitle stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        m.descDetail = [rowsDesc objectAtIndex:i]; //[col objectAtIndex:5];
        
        m.nqsDomain = [col objectAtIndex:4];
        m.measureType = [col objectAtIndex:5];
        NSRange range = [m.measureType rangeOfString:@"Outcome"];
        if (range.location != NSNotFound)  {
            [self.arrOutcome addObject:m];
            m.isOutcomeMeasure = 1;
        }
        
        
        m.measureDeveloper1 = [col objectAtIndex:6];
        m.measureDeveloper2 = [col objectAtIndex:7];
        m.measureDeveloper3 = [col objectAtIndex:8];
        
        
        if ( [[col objectAtIndex:9] isEqualToString:@"X"])
            m.isRepClaims = 1;
        if ( [[col objectAtIndex:10] isEqualToString:@"X"])
            m.isRepEhr = 1;
        if ( [[col objectAtIndex:11] isEqualToString:@"X"])
            m.isRepGproWeb = 1;
        if ( [[col objectAtIndex:12] isEqualToString:@"X"])
            m.isRepMeasureGroups = 1;
        if ( [[col objectAtIndex:13] isEqualToString:@"X"])
            m.isRepRegistry = 1;
        
        m.measureGroups = [col objectAtIndex:17];
        
        if ( [[col objectAtIndex:16] isEqualToString:@"X"])  {
            m.isCrossCuttingMeasure = 1;
            [self.arrCrossCutting addObject:m];
        }
        
        if ( [[col objectAtIndex:17] isEqualToString:@"X"])
            m.isAco = 1;
        
        m.specialty = [col objectAtIndex:22];
        
        
        [self.arrMeasures addObject:m];
        
    }
    
    self.arrMeasuresAll = [[NSMutableArray alloc] initWithArray:self.arrMeasures];
    
    [self.tableViewMeasures reloadData];
    
}


-(NSString *)getSpecialty:(NSInteger)row  {
    
    if (row == 1)
        return @"Cardio";
    else if (row == 2)
        return @"Derma";
    else if (row == 3)
        return @"Emergency";
    else if (row == 4)
        return @"Gastro";
    else if (row == 5)
        return @"GenPractice";
    else if (row == 6)
        return @"GenSurgery";
    else if (row == 7)
        return @"Hospital";
    else if (row == 8)
        return @"Internal";
    else if (row == 9)
        return @"Mental";
    else if (row == 10)
        return @"MultiChronic";
    else if (row == 11)
        return @"ObGyn";
    else if (row == 12)
        return @"Oncology";
    else if (row == 13)
        return @"Optho";
    else if (row == 14)
        return @"Pathology";
    else if (row == 15)
        return @"PhysTherapy";
    else if (row == 16)
        return @"Radiology";
    else if (row == 17)
        return @"Urology";
    else
        return @"";
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section  {
    
    if (tableView == self.tableViewFilter) {
        
     //   [self.segmentBar removeFromSuperview];
        
        
        UIView *viewFilter = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableViewFilter.bounds.size.width, 60)];
        
  //      self.segmentBar.frame = CGRectMake(0,0,self.tableViewMeasures.bounds.size.width,34);
  //      [viewFilter addSubview:self.segmentBar];
        
        UILabel *lblFilter = [[UILabel alloc] initWithFrame:CGRectMake(16,34,self.tableViewFilter.bounds.size.width-32,24)];
        lblFilter.text = @"Filter by Specialization";
        viewFilter.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0f blue:241.0/255.0f alpha:1.0];
        [viewFilter addSubview:lblFilter];
        
        return viewFilter;
    }
    else  {
        UIView *viewFilter = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 24)];
        UILabel *lblFilter = [[UILabel alloc] initWithFrame:CGRectMake(16,2,self.view.bounds.size.width-32,24)];
        if (self.filterSpecialty.length <= 0)
            lblFilter.frame = CGRectZero;
        
        lblFilter.text = [self.arrSpecialty objectAtIndex:self.selectedSpecialtyRow]; //self.filterSpecialty;
        
        viewFilter.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:255.0/255.0f blue:241.0/255.0f alpha:1.0];
        [viewFilter addSubview:lblFilter];
        
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, lblFilter.frame.size.height, self.view.bounds.size.width, 52)];
        //    if (self.segmentBar.selectedSegmentIndex < 2)
        //       view.frame = CGRectMake(0, lblFilter.frame.size.height, self.view.bounds.size.width, 48);
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(16,8,self.view.bounds.size.width-16,20)];
        
        [view addSubview:lbl];
        
        if (self.segmentBar.selectedSegmentIndex == 0) {
            lbl.text = @"Required: at least 1 cross cutting measure";
            if (self.arrCrossCutting.count < 1)  {
                lbl.text = @"No cross cutting measures apply. Select one from the \"All\" group";
            }
        }
        else if (self.segmentBar.selectedSegmentIndex == 1)  {
            lbl.text = @"Required:  At least one outcome measure";
            if (self.arrOutcome.count < 1)  {
                lbl.text = @"No outcome measures apply. Select a measure from the \"All\" group";
            }
        }
        if (self.segmentBar.selectedSegmentIndex == 2)
            lbl.text = @"Required: at least 6 measures: \n1 cross-cutting, 1 outcome, + 4 more";
        
        
        lbl.numberOfLines = 0;
        
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        
        lbl.font = [UIFont fontWithName:@"AvenirNext" size:14]; //[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        
        [lbl sizeToFit];
        lbl.textColor = [UIColor redColor];
        
        view.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0f blue:244.0/255.0f alpha:1.0];
        
        //    view.layer.borderColor = [UIColor colorWithRed:248.0/255.0 green:248.0/255.0f blue:248.0/255.0f alpha:1.0].CGColor;
        //    view.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        //    view.layer.shadowOffset = CGSizeMake(1.0,1.0);
        //    view.layer.shadowRadius = 2.0f;
        //    view.layer.shadowOpacity = 0.3f;
        //    view.layer.masksToBounds = NO;
        
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,viewFilter.frame.size.height+view.frame.size.height)];
        [view2 addSubview:viewFilter];
        [view2 addSubview:view];
        
        return view2;
        
    }
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == self.tableViewFilter)  {
        return 60;
    }
    else  {
        CGFloat height = 54.0;
        if (self.filterSpecialty.length > 0)
            height += 28;
        return height;
    }
   
    return 54;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //    if (section == 0)
    
    if (tableView == self.tableViewFilter)
        return self.arrSpecialty.count;
    
    else  {
        if (self.segmentBar.selectedSegmentIndex == 0)
            return self.arrCrossCutting.count;
        else if (self.segmentBar.selectedSegmentIndex == 1)
            return self.arrOutcome.count;
        else
            return [self.arrMeasures count]-1;
    }
}

-(void)filterBySpecialtyType:(NSInteger)row  {
    
    if (row == 0)  {
        self.arrMeasures = self.arrMeasuresAll;
        [self.tableViewMeasures reloadData];
        return;
    }
    
    self.selectedSpecialtyRow = row;
    NSString *str = [self getSpecialty:row];
    
    
    self.arrMeasures = self.arrMeasuresAll;
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"specialty CONTAINS %@",str];
    
    self.arrMeasures = [self.arrMeasures filteredArrayUsingPredicate:predicate];
    
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"(specialty CONTAINS %@) AND (isCrossCuttingMeasure = 1)",str];
    
    NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"(specialty CONTAINS %@) AND (measureType = 'Outcome')",str];
    
    
    self.arrCrossCutting = [self.arrMeasuresAll filteredArrayUsingPredicate:predicate2];
    
    self.arrOutcome = [self.arrMeasuresAll filteredArrayUsingPredicate:predicate3];
    
    
    [self.tableViewMeasures reloadData];
    
    self.filterSpecialty = str;
   // self.navigationItem.rightBarButtonItem.title = str;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //    if ( [segue.identifier isEqualToString:@"QualityDetailViewController"] )  {
    QualityDetailViewController *vc = segue.destinationViewController;
    vc.measure = [self.arrMeasures objectAtIndex:self.selectedRow];
    
    if (self.segmentBar.selectedSegmentIndex == 0)
        vc.measure = [self.arrCrossCutting objectAtIndex:self.selectedRow];
    
    else if (self.segmentBar.selectedSegmentIndex == 1)
        vc.measure = [self.arrOutcome objectAtIndex:self.selectedRow];
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRow = indexPath.row;
    
    if (tableView == self.tableViewFilter)  {
        [self filterBySpecialtyType:indexPath.row];
        [self filterBySpecialty];
        return;
    }
    
    [self performSegueWithIdentifier:@"QualityDetailViewController" sender:self];

    self.navigationItem.backBarButtonItem.title = @" ";

    
    self.navigationItem.hidesBackButton = NO;

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.tableViewFilter)  {
        
        static NSString *CellIdentifier = @"CellFilter";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.textLabel.text = [self.arrSpecialty objectAtIndex:indexPath.row];
        cell.contentView.backgroundColor = [UIColor colorWithRed:255.0/255.0f green:255.0/255.0f blue:221.0/255.0f alpha:1.0];
        cell.textLabel.backgroundColor = [UIColor clearColor];
        
        return cell;
    }
    
    else  {
        //    static NSString *CellId = @"CellQuality";
        
        QualityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellQuality"];
        if (cell == nil)
        {
            cell = [[QualityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellQuality"];
        }
        
        // CrossCutMeasure *cc = [self.arrCrossCutting objectAtIndex:indexPath.row];
        
        SpecialtyMeasure *m = [self.arrMeasures objectAtIndex:indexPath.row];
        if (self.segmentBar.selectedSegmentIndex == 0)  {
            m = [self.arrCrossCutting objectAtIndex:indexPath.row];
        }
        else if (self.segmentBar.selectedSegmentIndex == 1)  {
            m = [self.arrOutcome objectAtIndex:indexPath.row];
        }
        cell.lblTitle.text = m.descTitle;
        cell.lblTitle.numberOfLines = 0;
        cell.lblTitle.lineBreakMode = NSLineBreakByWordWrapping;
        [cell.lblTitle sizeToFit];
        
        
        //    if (m.isOutcomeMeasure == 1)  {
        //        cell.imgViewType.image = [UIImage imageNamed:@"outcomeO.png"];
        //    }
        //    else if (m.isCrossCuttingMeasure == 1)  {
        //        cell.imgViewType.image = [UIImage imageNamed:@"crossCutC.png"];
        //    }
        //    else  {
        cell.imgViewType.image = nil;
        //    }
        
        
        //  [cell setNeedsLayout];
        
        
        cell.backgroundColor = [UIColor whiteColor];
        
        //   [cell layoutSubviews];
        
        [cell setNeedsDisplay];
        
        return cell;
    }
   
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
