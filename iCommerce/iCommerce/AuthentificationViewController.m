//
//  AuthentificationViewController.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 16/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "AuthentificationViewController.h"
#import "User.h"
#import "UserXMLParser.h"
#import "EspacePersoViewController.h"

@interface AuthentificationViewController ()

@end

@implementation AuthentificationViewController

@synthesize login, passwd;

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

- (IBAction)authentification:(id)sender
{
    UserXMLParser *xmlParser = [[UserXMLParser alloc] loadXMLByURL:[@"http://icommerce.no-ip.org/listClient.php?login=" stringByAppendingString:login.text]];
    
    User *user = [[xmlParser user] objectAtIndex:0];
    
    if ([user.passwd isEqualToString:passwd.text])
    {
        EspacePersoViewController *espacePersoViewController = [[EspacePersoViewController alloc] initWithNibName:@"EspacePersoViewController" bundle:nil];
        
//        espacePersoViewController.user = user;
        
        [self.navigationController pushViewController:espacePersoViewController animated:YES];
        [espacePersoViewController release];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur authentification" message:@"Veuillez vérifier vos identifiants de connexion." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}
- (void)dealloc {
    [login release];
    [passwd release];
    [super dealloc];
}
@end
