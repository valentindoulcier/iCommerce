//
//  RechercheViewController.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 02/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "RechercheViewController.h"
#import "ListArticle.h"

@interface RechercheViewController ()

@end

@implementation RechercheViewController

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

- (IBAction)GoListArticle:(id)sender
{
    ListArticle *listArticle = [[ListArticle alloc] initWithNibName:@"ListArticle" bundle:nil];
    
    [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{[self.view addSubview:listArticle.view];} completion:nil];
}

@end
