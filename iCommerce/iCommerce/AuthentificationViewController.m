//
//  AuthentificationViewController.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 16/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "AuthentificationViewController.h"
#import "EspacePersoViewController.h"

@interface AuthentificationViewController ()

@end

@implementation AuthentificationViewController

@synthesize navigationEspacePerso;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Authentification:(id)sender {
    
    EspacePersoViewController *espacePerso = [[EspacePersoViewController alloc] initWithNibName:@"EspacePersoViewController" bundle:nil];   
    
    navigationEspacePerso = [[UINavigationController alloc] initWithRootViewController:espacePerso];
    
    [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{[self.view addSubview:navigationEspacePerso.view];} completion:nil];
}
@end
