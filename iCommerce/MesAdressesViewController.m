//
//  MesAdressesViewController.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 20/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "MesAdressesViewController.h"
#import "MesAdressesCell.h"

@interface MesAdressesViewController ()

@end

@implementation MesAdressesViewController

@synthesize entree, user;

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([user.appartement isEqualToString: @""] || [user.appartement isEqualToString: nil]) {
        return 85;
    }
    else {
        return 100;
    }
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if([user.appartement isEqualToString: @""] || [user.appartement isEqualToString: nil]) {
        NSDictionary *cell1 = [[NSDictionary alloc] initWithObjectsAndKeys: [user.numRue stringByAppendingString: [@", " stringByAppendingString: user.nomRue]], @"adresse1", [user.numCodePostal stringByAppendingString: [@" " stringByAppendingString: user.nomVille]], @"adresse2", @"", @"adresse3", nil];
        
        entree = [[NSArray alloc] initWithObjects:cell1, nil];
        [cell1 release];
        
    }
    else {
        NSDictionary *cell1 = [[NSDictionary alloc] initWithObjectsAndKeys: user.appartement, @"adresse1", [user.numRue stringByAppendingString: [@", " stringByAppendingString: user.nomRue]], @"adresse2", [user.numCodePostal stringByAppendingString: [@" " stringByAppendingString: user.nomVille]], @"adresse3", nil];
        
        entree = [[NSArray alloc] initWithObjects:cell1, nil];
        [cell1 release];
    }
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [entree count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MesAdressesCell";
    MesAdressesCell *cell = (MesAdressesCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *xib = [[NSBundle mainBundle] loadNibNamed:@"MesAdressesCell" owner:self options:nil];
        
        for (id oneObject in xib) {
            if ([oneObject isKindOfClass:[MesAdressesCell class]]) {
                cell = (MesAdressesCell *) oneObject;
            }
        }
    }
    
    // Configure the cell...
    
    NSDictionary *current = [entree objectAtIndex:indexPath.row];
    
    cell.adresse1User.text = [current objectForKey:@"adresse1"];
    cell.adresse2User.text = [current objectForKey:@"adresse2"];
    cell.adresse3User.text = [current objectForKey:@"adresse3"];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
