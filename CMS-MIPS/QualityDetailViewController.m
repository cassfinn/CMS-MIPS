//
//  QualityDetailViewController.m
//  cms
//
//  Created by John Cassidy on 7/22/16.
//  Copyright © 2016 Claudia Cassidy. All rights reserved.
//

#import "QualityDetailViewController.h"
#import "QualityTableViewCell.h"


@interface QualityDetailViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSMutableArray *arrDet;

@end


@implementation QualityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"measure = %@",self.measure.descTitle);
    
    
    self.arrDet = [[NSMutableArray alloc] init];
    
    
    NSString *cssPath = [[NSBundle mainBundle] pathForResource:@"measuredetails" ofType:@"css"];
    
    NSString *sHtmlHead = [NSString stringWithFormat:@"<!DOCTYPE html><html><head>"
                       "<link href=\"%@\" rel=stylesheet type=\"text/css\">"
                       "</head>"
                       "<body>",cssPath];
    
    

    
    if (self.measure.descTitle)  {
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:self.measure.descTitle, @"title", nil];
        [self.arrDet addObject:dict];
    }
    if (self.measure.descDetail)  {
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:self.measure.descDetail, @"info", nil];
        [self.arrDet addObject:dict];
    }
    if (self.measure.nqsDomain)  {
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:self.measure.nqsDomain, @"info", @"NQS Domain", @"title", nil];
        [self.arrDet addObject:dict];
    }
    if (self.measure.measureType)  {
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:self.measure.measureType, @"info", @"Measure Type", @"title", nil];
        [self.arrDet addObject:dict];
    }
    NSString *str = @"";
    if (self.measure.measureDeveloper1 && self.measure.measureDeveloper1.length > 5)  {
        str = [NSString stringWithFormat:@"\t- %@",self.measure.measureDeveloper1];
        if (self.measure.measureDeveloper2 && self.measure.measureDeveloper2.length > 5)  {
            str = [NSString stringWithFormat:@"%@\n\n\t-%@",str,self.measure.measureDeveloper2];
            if (self.measure.measureDeveloper3 && self.measure.measureDeveloper3.length > 5)  {
                str = [NSString stringWithFormat:@"%@\n\n\t-%@",str,self.measure.measureDeveloper3];
                }
        }
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:str, @"info", @"Measure Developer", @"title", nil];
        [self.arrDet addObject:dict];
    }
    
    if (self.measure.measureGroups && self.measure.measureGroups.length > 5)  {
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:self.measure.measureGroups, @"info", @"Measure Groups", @"title", nil];
        [self.arrDet addObject:dict];
    }
    
    
    
    NSString *sHtml = [NSString stringWithFormat:@"<h4>%@</h4>%@<p></body></html>",self.measure.descTitle,self.measure.descDetail];

    if (self.measure.specialty.length > 2)  {
        NSString *specialty = [self.measure.specialty stringByReplacingOccurrencesOfString:@"|" withString:@", "];
        sHtml = [NSString stringWithFormat:@"%@<p><br><b>Specialties:</b> %@",sHtml,specialty];
    }
    
    sHtml = [NSString stringWithFormat:@"%@<p><b>Domain:</b> %@<p><b>Measure Type: </b>%@ <br>",sHtml,self.measure.nqsDomain,self.measure.measureType];
    

    
    if ( self.measure.isCrossCuttingMeasure == 1)  {
        sHtml = [NSString stringWithFormat:@"%@<p><b>Measure Groups:</b><br>Cross Cutting",sHtml];
    }
    
    
    
    sHtml = [NSString stringWithFormat:@"%@<p><br><b>Measure Developers: </b>",sHtml];
    
    if (self.measure.measureDeveloper1.length > 2)  {
        sHtml = [NSString stringWithFormat:@"%@<li>%@</li>",sHtml,self.measure.measureDeveloper1];
    }
    if (self.measure.measureDeveloper2.length > 2)  {
        sHtml = [NSString stringWithFormat:@"%@<li>%@</li>",sHtml,self.measure.measureDeveloper2];
    }
    if (self.measure.measureDeveloper3.length > 2)  {
        sHtml = [NSString stringWithFormat:@"%@<li>%@</li>",sHtml,self.measure.measureDeveloper3];
    }
    
    NSString *sHtmlFinal = [NSString stringWithFormat:@"%@%@</body></html>",sHtmlHead,sHtml];

    //<p>Measure Developer: %@<p>Measure Groups: %@<br></body></html>
    
    NSURL *baseUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    
    [self.webView loadHTMLString:sHtmlFinal baseURL:baseUrl];

    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    QualityTableViewCell *cell = (QualityTableViewCell *)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[QualityTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dict = [self.arrDet objectAtIndex:indexPath.row];
    NSString *title = [dict valueForKey:@"title"];
    if (title)
        cell.textLabel.text = title;
    
    NSString *info = [dict valueForKey:@"info"];
    if (info)
        cell.detailTextLabel.text = info;
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [cell.textLabel sizeToFit];
    
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [cell.detailTextLabel sizeToFit];
    
    //[cell layoutSubviews];
    
    [cell setNeedsDisplay];
    
    
    return cell;
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
