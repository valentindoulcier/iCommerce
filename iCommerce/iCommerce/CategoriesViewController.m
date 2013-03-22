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
/*
- (IBAction)techno:(id)sender
{
    ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
    
    listeArticlesViewController.categorie = @"1";
    
    [self.navigationController pushViewController:listeArticlesViewController animated:YES];
    [listeArticlesViewController release];
}

- (IBAction)voiture:(id)sender
{
    ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
    
    listeArticlesViewController.categorie = @"2";
    
    [self.navigationController pushViewController:listeArticlesViewController animated:YES];
    [listeArticlesViewController release];
}
- (IBAction)jets:(id)sender
{
    ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];

    listeArticlesViewController.categorie = @"3";
    
    [self.navigationController pushViewController:listeArticlesViewController animated:YES];
    [listeArticlesViewController release];
}

- (IBAction)yatch:(id)sender
{
    ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
    
    listeArticlesViewController.categorie = @"4";
    
    [self.navigationController pushViewController:listeArticlesViewController animated:YES];
    [listeArticlesViewController release];
}
- (IBAction)maison:(id)sender
{
    ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
    
    listeArticlesViewController.categorie = @"5";
    
    [self.navigationController pushViewController:listeArticlesViewController animated:YES];
    [listeArticlesViewController release];
}

- (IBAction)all:(id)sender
{
    ListeArticlesViewController *listeArticlesViewController = [[ListeArticlesViewController alloc] initWithNibName:@"ListeArticlesViewController" bundle:nil];
    
    listeArticlesViewController.categorie = @"6";
    
    [self.navigationController pushViewController:listeArticlesViewController animated:YES];
    [listeArticlesViewController release];
}*/

- (void)dealloc {
    [super dealloc];
}
@end
