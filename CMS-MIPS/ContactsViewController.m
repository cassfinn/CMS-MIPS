//
//  ContactsViewController.m
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 10/15/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "ContactsViewController.h"
#import "Presentation.h"
#import "WebViewController.h"


@interface ContactsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *arrPresentations;

@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, strong) Presentation *selectedPresentation;

@end


@implementation ContactsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButtonItemMenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    [barButtonItemMenu setImage:[UIImage imageNamed:@"hamburger.png"]];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    space.width = 30;
    NSArray *buttons = @[barButtonItemMenu, space];
    self.navigationItem.leftBarButtonItems = buttons;
    
    self.navigationItem.title = @"Contacts";
    
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
    p2c.link = @"https://www.cms.gov/apps/contacts/";
    p2c.title = @"CMS - Center for Medicare & Medicaid";
    p2c.subTitle = @"Find contacts near you";
    p2c.linkType = @"url";
    p2c.linkSummary = @"";
    p2c.linkId = @"1206";
    [self.arrPresentations addObject:p2c];
    
    
    Presentation *p0a = [Presentation new];
    p0a.link = @"https://qpp.cms.gov/docs/QPP_Where_to_Go_for_Help.pdf";
    p0a.title = @"QPP - Where to Find Help";
    p0a.subTitle = @"";
    p0a.linkType = @"url";
    p0a.linkId = @"1201";
    [self.arrPresentations addObject:p0a];
    
    
    Presentation *p4 = [Presentation new];
    p4.link = @"https://innovation.cms.gov/initiatives/Transforming-Clinical-Practices/";
    p4.title = @"Transforming Clinical Practice Initiative (TCPI)";
    p4.subTitle = @"web - Find support near you";
    p4.linkType = @"url";
    p4.linkSummary = @"";
    p4.linkId = @"1207";
    [self.arrPresentations addObject:p4];
    
//    Presentation *p5 = [Presentation new];
//    p5.link = @"https://innovation.cms.gov/initiatives/Transforming-Clinical-Practices/";
//    p5.title = @"Transforming Clinical Practice Initiative";
//    p5.subTitle = @"web - Find help near you";
//    p5.linkType = @"url";
//    p5.linkSummary = @"";
//    p5.linkId = @"1207";
//    [self.arrPresentations addObject:p5];

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
