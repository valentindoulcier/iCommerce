//
//  MonCompteViewController.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 16/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "MonCompteViewController.h"

@interface MonCompteViewController ()

@end

@implementation MonCompteViewController

@synthesize user, nameUser;

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
    // Do any additional setup after loading the view from its nib.
    
    nameUser.text = user.nom;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [nameUser release];
    [super dealloc];
}
@end
