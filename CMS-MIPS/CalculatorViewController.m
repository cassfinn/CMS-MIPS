//
//  CalculatorViewController.m
//  MIPS
//
//  Created by Claudia Cassidy on 9/10/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "CalculatorViewController.h"
#import "QualityViewController.h"
#import "AciViewController.h"
#import "WebViewController.h"
#import "Presentation.h"


@interface CalculatorViewController ()

@property (nonatomic, strong) NSMutableArray *arrCategories;
@property (weak, nonatomic) IBOutlet UIButton *btnQuality;
@property (weak, nonatomic) IBOutlet UIButton *btnAdvancing;
@property (weak, nonatomic) IBOutlet UIButton *btnClinical;
@property (weak, nonatomic) IBOutlet UIButton *btnCost;
@property (weak, nonatomic) IBOutlet UILabel *lblDesc;
@property (weak, nonatomic) IBOutlet UIButton *btnCompositeScore;

@end



@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"MIPS Calculator";

    
    UIBarButtonItem *barButtonItemMenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    [barButtonItemMenu setImage:[UIImage imageNamed:@"hamburger.png"]];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    space.width = 30;
    NSArray *buttons = @[barButtonItemMenu, space];
    self.navigationItem.leftBarButtonItems = buttons;

    
    
    self.arrCategories = [[NSMutableArray alloc] initWithObjects:@"Quality (50%)",@"Advancing care information (25%)",@"Clinical practice improvement activities (15%)", @"Cost (10%) - CMS Calculates, no reporting required",nil];

    self.btnQuality.layer.cornerRadius = 12; //self.btnQuality.frame.size.height/2.0f;
    self.btnAdvancing.layer.cornerRadius = 12; //self.btnAdvancing.frame.size.height/2.0f;;
    self.btnClinical.layer.cornerRadius = 12; //self.btnClinical.bounds.size.height/2.0f;;
    
    
    self.btnQuality.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.btnQuality.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.btnQuality setTitle: @"\nQuality\n60%\n" forState: UIControlStateNormal];
   // [self.btnQuality.titleLabel setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:21]];
    self.btnQuality.layer.borderColor = [UIColor colorWithRed:221.0/255.0f green:221.0/255.0f blue:221.0/255.0f alpha:1.0].CGColor;
    self.btnQuality.layer.borderWidth = 3.0f;
    self.btnQuality.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.btnQuality.layer.shadowOffset = CGSizeMake(-1.0,1.0);
    self.btnQuality.layer.shadowOpacity = 0.3;
    self.btnQuality.layer.masksToBounds = NO;
    self.btnQuality.layer.shadowRadius = 2.0f;
//    self.btnQuality.imageView.center = CGPointMake(self.btnQuality.center.x,self.btnQuality.bounds.size.height );
//    self.btnQuality.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 12);
//    self.btnQuality.titleEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 2);
    
    self.btnAdvancing.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.btnAdvancing.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.btnAdvancing setTitle: @"Advancing\nCare\nInformation\n\n25%" forState: UIControlStateNormal];
    self.btnAdvancing.layer.masksToBounds = NO;
    self.btnAdvancing.layer.borderColor = [UIColor colorWithRed:221.0/255.0f green:221.0/255.0f blue:221.0/255.0f alpha:1.0].CGColor;
    self.btnAdvancing.layer.borderWidth = 3.0f;

    
    self.btnClinical.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.btnClinical.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.btnClinical setTitle: @"Clinical\nPractice\nImprovement\n\n15%" forState: UIControlStateNormal];
    self.btnClinical.layer.masksToBounds = NO;
    self.btnClinical.layer.borderColor = [UIColor colorWithRed:221.0/255.0f green:221.0/255.0f blue:221.0/255.0f alpha:1.0].CGColor;
    self.btnClinical.layer.borderWidth = 3.0f;

/*
    self.btnCost.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.btnCost.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.btnCost setTitle: @"\nCost\n\n\n10%" forState: UIControlStateNormal];
    self.btnCost.layer.masksToBounds = YES;
    self.btnCost.layer.borderColor = [UIColor colorWithRed:221.0/255.0f green:221.0/255.0f blue:221.0/255.0f alpha:1.0].CGColor;
    self.btnCost.layer.borderWidth = 1.0f;
*/
    
    self.btnCompositeScore.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.btnCompositeScore.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.btnCompositeScore setTitle: @"\nComposite\nPerformance\nScore\n100%" forState: UIControlStateNormal];
    self.btnCompositeScore.layer.masksToBounds = YES;
    self.btnCompositeScore.layer.borderColor = [UIColor colorWithRed:221.0/255.0f green:221.0/255.0f blue:221.0/255.0f alpha:1.0].CGColor;
    self.btnCompositeScore.layer.borderWidth = 1.0f;

    
    
    self.lblDesc.text = @"Three categories make up your total score. Tap on each to see what's required.";
    //[self.lblDesc sizeToFit];
    
}

-(void)showMenu  {
    [self.navigationController popViewControllerAnimated:YES];
}



-(IBAction)showQuality:(id)sender  {
    
    [self performSegueWithIdentifier:@"QualityViewController" sender:self];
    self.navigationItem.hidesBackButton = NO;
    self.navigationItem.backBarButtonItem.title = @" ";
    

}

-(IBAction)showACI:(id)sender  {
    
  //  [self performSegueWithIdentifier:@"AciViewController" sender:self];
    self.navigationItem.hidesBackButton = NO;
    self.navigationItem.backBarButtonItem.title = @" ";
    
}


-(IBAction)showCPI:(id)sender  {
    [self performSegueWithIdentifier:@"WebViewController" sender:self];
    self.navigationItem.backBarButtonItem.title = @" ";

    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender  {
    
    if ( [segue.identifier isEqualToString:@"WebViewController"] )  {
        WebViewController *vc = segue.destinationViewController;
        Presentation *p = [Presentation new];
        p.link = @"https://qpp.cms.gov/measures/ia";
        vc.presentation = p;
        
    }
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
