//
//  DetailViewController.m
//  iCommerce
//
//  Created by Adrien BATAILLE on 16/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize detailArticle, nom, marque, prix, description, image;

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
    [nom setText:[detailArticle nomArticle]];
    [marque setText:[detailArticle nomMarque]];
    [prix setText:[detailArticle.prixHT stringByAppendingString:@" €"]];
    [description setText:[detailArticle description]];
    [image setImage:[UIImage imageNamed:[detailArticle image]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [nom release];
    [prix release];
    [description release];
    [image release];
    [marque release];;
    [super dealloc];
}
@end
