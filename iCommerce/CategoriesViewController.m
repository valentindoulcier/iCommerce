//
//  CategoriesViewController.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 16/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "CategoriesViewController.h"
#import "ListeArticlesViewController.h"

@interface CategoriesViewController ()

@end

@implementation CategoriesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 - (IBAction)technos:(id)sender
 {
     ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
 
     listeArticlesViewController.categories = @"1";
     listeArticlesViewController.title = @"Technologies";
 
     [self.navigationController pushViewController:listeArticlesViewController animated:YES];
     [listeArticlesViewController release];
 }
 
 - (IBAction)voitures:(id)sender
 {
     ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
 
     listeArticlesViewController.categories = @"2";
     listeArticlesViewController.title = @"Voitures";
 
     [self.navigationController pushViewController:listeArticlesViewController animated:YES];
     [listeArticlesViewController release];
 }
 - (IBAction)jets:(id)sender
 {
     ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
 
     listeArticlesViewController.categories = @"3";
     listeArticlesViewController.title = @"Jets Privés";
 
    [self.navigationController pushViewController:listeArticlesViewController animated:YES];
     [listeArticlesViewController release];
 }

- (IBAction)yatchs:(id)sender {
    ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
    
    listeArticlesViewController.categories = @"4";
    listeArticlesViewController.title = @"Yatchs";
    
    [self.navigationController pushViewController:listeArticlesViewController animated:YES];
    [listeArticlesViewController release];
}

- (IBAction)maisons:(id)sender {
    ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
    
    listeArticlesViewController.categories = @"5";
    listeArticlesViewController.title = @"Maisons";
    
    [self.navigationController pushViewController:listeArticlesViewController animated:YES];
    [listeArticlesViewController release];
}

- (IBAction)allCategories:(id)sender {
    ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
    
    listeArticlesViewController.categories = @"6";
    listeArticlesViewController.title = @"All Cats";
    
    [self.navigationController pushViewController:listeArticlesViewController animated:YES];
    [listeArticlesViewController release];
}
- (void)dealloc {
    [super dealloc];
}

@end
