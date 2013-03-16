//
//  EspacePersoViewController.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 16/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "EspacePersoViewController.h"
#import "EspacePersoCell.h"

@interface EspacePersoViewController ()

@end

@implementation EspacePersoViewController

@synthesize entree;

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
    
    NSDictionary *cell1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"toto", @"label", nil];
    NSDictionary *cell2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"tata", @"label", nil];
    NSDictionary *cell3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TOTO", @"label", nil];
    NSDictionary *cell4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TOTO", @"label", nil];
    NSDictionary *cell5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TOTO", @"label", nil];
    NSDictionary *cell6 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TOTO", @"label", nil];
    NSDictionary *cell7 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TOTO", @"label", nil];
    
    entree = [[NSArray alloc] initWithObjects:cell1, cell2, cell3, cell4, cell5, cell6, cell7, nil];
    
    [cell1 release];
    [cell2 release];
    [cell3 release];
    [cell4 release];
    [cell5 release];
    [cell6 release];
    [cell7 release];
    

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

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

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
    static NSString *CellIdentifier = @"EspacePersoCell";
    EspacePersoCell *cell = (EspacePersoCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
    if (cell == nil) {
        NSArray *xib = [[NSBundle mainBundle] loadNibNamed:@"EspacePersoCell" owner:self options:nil];
        
        for (id oneObject in xib) {
            if ([oneObject isKindOfClass:[EspacePersoCell class]]) {
                cell = (EspacePersoCell *) oneObject;
            }
        }
    }
    
    // Configure the cell...
    
    NSDictionary *current = [entree objectAtIndex:indexPath.row];
    
    cell.label.text = [current objectForKey:@"label"];
    cell.image.image = [UIImage imageNamed:@"bateau"];

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
