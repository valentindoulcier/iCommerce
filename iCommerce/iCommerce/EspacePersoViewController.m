//
//  EspacePersoViewController.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 16/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "EspacePersoViewController.h"
#import "EspacePersoCell.h"
#import "MonCompteViewController.h"
#import "MesCommandesViewController.h"
#import "MesAdressesViewController.h"
#import "MesRetoursSAVViewController.h"
#import "MesAvoirsViewController.h"
#import "MonPanierViewController.h"
#import "MesAlertesViewController.h"

@interface EspacePersoViewController ()

@end

@implementation EspacePersoViewController

@synthesize entree, user;

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
    
    NSDictionary *cell1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mon Compte Client", @"label", @"menu_1", @"image", nil];
    NSDictionary *cell2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mes Commandes", @"label", @"menu_2", @"image", nil];
    NSDictionary *cell3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mes Adresses", @"label", @"menu_3", @"image", nil];
    NSDictionary *cell4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mes Retours SAV", @"label", @"menu_4", @"image", nil];
    NSDictionary *cell5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mes Avoirs", @"label", @"menu_5", @"image", nil];
    NSDictionary *cell6 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mon Panier", @"label", @"menu_6", @"image", nil];
    NSDictionary *cell7 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mes Alertes", @"label", @"menu_7", @"image", nil];
    
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
    cell.image.image = [UIImage imageNamed:[current objectForKey:@"image"]];

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
    
    NSDictionary *current = [entree objectAtIndex:indexPath.row];
    
    if([[current objectForKey:@"label"] isEqualToString:@"Mon Compte Client"]) {        
        MonCompteViewController *monCompteViewController = [[MonCompteViewController alloc] initWithNibName:@"MonCompteViewController" bundle:nil];
        
        monCompteViewController.title = @"Mon Compte";
        monCompteViewController.user = user;
        
        [self.navigationController pushViewController:monCompteViewController animated:YES];
        [monCompteViewController release];
    }
    if([[current objectForKey:@"label"] isEqualToString:@"Mes Commandes"]) {
        MesCommandesViewController *mesCommandesViewController = [[MesCommandesViewController alloc] initWithNibName:@"MesCommandesViewController" bundle:nil];
        
        mesCommandesViewController.title = @"Mes Commandes";
        
        [self.navigationController pushViewController:mesCommandesViewController animated:YES];
        [mesCommandesViewController release];
    }
    if([[current objectForKey:@"label"] isEqualToString:@"Mes Adresses"]) {
        MesAdressesViewController *mesAdressesViewController = [[MesAdressesViewController alloc] initWithNibName:@"MesAdressesViewController" bundle:nil];
        
        mesAdressesViewController.title = @"Mes Adresses";
        mesAdressesViewController.user = user;
        
        [self.navigationController pushViewController:mesAdressesViewController animated:YES];
        [mesAdressesViewController release];
    }
    if([[current objectForKey:@"label"] isEqualToString:@"Mes Retours SAV"]) {
        MesRetoursSAVViewController *mesRetoursSAVViewController = [[MesRetoursSAVViewController alloc] initWithNibName:@"MesRetoursSAVViewController" bundle:nil];
        
        mesRetoursSAVViewController.title = @"Mes Retours SAV";
        
        [self.navigationController pushViewController:mesRetoursSAVViewController animated:YES];
        [mesRetoursSAVViewController release];
    }
    if([[current objectForKey:@"label"] isEqualToString:@"Mes Avoirs"]) {
        MesAvoirsViewController *mesAvoirsViewController = [[MesAvoirsViewController alloc] initWithNibName:@"MesAvoirsViewController" bundle:nil];
        
        mesAvoirsViewController.title = @"Mes Avoirs";
        
        [self.navigationController pushViewController:mesAvoirsViewController animated:YES];
        [mesAvoirsViewController release];
    }
    if([[current objectForKey:@"label"] isEqualToString:@"Mon Panier"]) {
        MonPanierViewController *monPanierViewController = [[MonPanierViewController alloc] initWithNibName:@"MonPanierViewController" bundle:nil];
        
        monPanierViewController.title = @"Mon Panier";
        
        [self.navigationController pushViewController:monPanierViewController animated:YES];
        [monPanierViewController release];
    }
    if([[current objectForKey:@"label"] isEqualToString:@"Mes Alertes"]) {
        MesAlertesViewController *mesAlertesViewController = [[MesAlertesViewController alloc] initWithNibName:@"MesAlertesViewController" bundle:nil];
        
        mesAlertesViewController.title = @"Mes Alertes";
        
        [self.navigationController pushViewController:mesAlertesViewController animated:YES];
        [mesAlertesViewController release];
    }
}

@end
