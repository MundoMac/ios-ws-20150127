//
//  CountriesTVC.m
//  Taller 20150127
//
//  Created by Diego Mazzone on 5/2/15.
//  Copyright (c) 2015 MundoMac. All rights reserved.
//

#import "CountriesTVC.h"
#import "Country.h"
#import "LoginVC.h"

@interface CountriesTVC ()

@property (nonatomic) BOOL showLogin;

@end

@implementation CountriesTVC


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Load some countries
    
    Country *c1 = [Country new];
    c1.name = @"Uruguay";
    c1.flagURL = [NSURL URLWithString:@"http://www.theodora.com/flags/new9/uruguay-s.gif"];
    
    Country *c2 = [Country new];
    c2.name = @"Brasil";
    c2.flagURL = [NSURL URLWithString:@"http://www.theodora.com/flags/br-s.gif"];
    
    Country *c3 = [Country new];
    c3.name = @"Argentina";
    c3.flagURL = [NSURL URLWithString:@"http://www.theodora.com/flags/new2/ar_s.gif"];
    
    self.countries = @[c1, c2, c3];

    self.showLogin = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Present Login screen depending on condition
    if (self.showLogin == YES) {
        LoginVC *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
        [self presentViewController:loginVC animated:YES completion:nil];
        self.showLogin = NO;
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.countries count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CountryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Country *country = self.countries[indexPath.row];
    
    // Configure the cell...
    
    cell.textLabel.text = country.name;
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL:country.flagURL];
    [cell.imageView setImage:[UIImage imageWithData: imageData]];
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
