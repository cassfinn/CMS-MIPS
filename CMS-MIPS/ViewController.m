//
//  ViewController.m
//  CMS-MIPS
//
//  Created by Claudia Cassidy on 9/23/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "ViewController.h"
#import "BookCollectionViewCell.h"
#import "IntroViewController.h"
#import "MenuViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewMyBooks;
@property (nonatomic, strong) NSMutableArray *arrMyBooks;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewAllBooks;
@property (nonatomic, strong) NSMutableArray *arrBooks;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayoutAll;

@property (weak, nonatomic) IBOutlet UIView *viewSearchBar;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation ViewController

/*
- (BOOL)prefersStatusBarHidden {
    return YES;
}
*/

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
 
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars=NO;
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    */
    self.navigationItem.title = @"Medicare - MIPS";
    
    
    self.arrMyBooks = [[NSMutableArray alloc] initWithObjects:@"MACRA Physician's Handbook", nil];
    self.arrBooks = [[NSMutableArray alloc] initWithObjects:@"MACRA Physician's Handbook",@"MACRA Radiologist Handbook",@"MACRA Office Manager",@"MACRA EHR Vendor",@"MACRA Quality Analyst", @"Nurse Practioner", @"Admin Assistant", @"General Info", @"Cardiology", nil];
    
    self.collectionViewMyBooks.delegate = self;
    self.collectionViewMyBooks.dataSource = self;
    
    self.collectionViewAllBooks.delegate = self;
    self.collectionViewAllBooks.dataSource = self;
    
    
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionViewMyBooks.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
    
    _flowLayoutAll.sectionInset = UIEdgeInsetsMake(16, 16, 16, 16);
    
    
    
    [self.collectionViewMyBooks reloadData];
    // Do any additional setup after loading the view, typically from a nib.
    
    

}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath  {
    
   // if (collectionView == self.collectionViewAllBooks)  {
        return CGSizeMake(self.view.bounds.size.width/3.0-16-4, (self.view.bounds.size.width/3.0-16-4)*1.16 );
   // }
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.collectionViewMyBooks)
        return self.arrMyBooks.count;
    else
        return self.arrBooks.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (cv == self.collectionViewMyBooks)  {
        BookCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"BookCell" forIndexPath:indexPath];
        cell.lblTitle.text = @"Mine";
        cell.lblTitle.text = [self.arrMyBooks objectAtIndex:indexPath.row];
        [cell.lblTitle sizeToFit];
        cell.backgroundColor = [UIColor whiteColor];
        cell.layer.cornerRadius = 5.0f;
        cell.layer.borderColor = [UIColor colorWithRed:53.0/255.0f green:126.0/255.0f blue:250.0/255.0f alpha:1.0].CGColor;
        cell.layer.borderWidth = 2.0f;
        cell.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        cell.layer.shadowOffset = CGSizeMake(-1.0,-1.0);
        cell.layer.shadowRadius = 3.0f;
        return cell;
    }
    
    BookCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"BookCellAll" forIndexPath:indexPath];
    cell.lblTitle.text = [self.arrBooks objectAtIndex:indexPath.row];
    [cell.lblTitle sizeToFit];
    cell.lblTitle.textColor = [UIColor darkGrayColor];
    
    cell.layer.borderColor = [UIColor colorWithRed:241.0/255.0f green:241.0/255.0f blue:241.0/255.0f alpha:0.8].CGColor;
    cell.layer.borderWidth = 2.0f;
    cell.layer.cornerRadius = 8.0f;
    
    // load the image for this cell
    //    NSString *imageToLoad = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    //    cell.image.image = [UIImage imageNamed:imageToLoad];
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.collectionViewMyBooks)  {
        [self performSegueWithIdentifier:@"MenuViewController" sender:self];
        self.navigationItem.hidesBackButton = YES;
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"IntroViewController"])
    {
        //    NSIndexPath *selectedIndexPath = [self.collectionViewMine indexPathsForSelectedItems][0];
        
        // load the image, to prevent it from being cached we use 'initWithContentsOfFile'
        //   NSString *imageNameToLoad = [NSString stringWithFormat:@"%ld_full", (long)selectedIndexPath.row];
        //   UIImage *image = [UIImage imageNamed:imageNameToLoad];
      //  IntroViewController *detailViewController = segue.destinationViewController;
        //    detailViewController.image = image;
    }
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
