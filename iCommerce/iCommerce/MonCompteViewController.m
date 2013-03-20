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

@synthesize user, imageUser, nomUser, portableUser, domicileUser, emailUser, adresse1User, adresse2User, adresse3User;

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
    
    imageUser.image = [UIImage imageNamed:@"anonymat"];
    nomUser.text = user.nom;
    portableUser.text = user.telephonePortable;
    domicileUser.text = user.telephoneDomicile;
    emailUser.text = user.email;
    if([user.appartement isEqualToString: @""] || [user.appartement isEqualToString: nil]) {
        adresse1User.text = [user.numRue stringByAppendingString: [@", " stringByAppendingString: user.nomRue]];
        adresse2User.text = [user.numCodePostal stringByAppendingString: [@" " stringByAppendingString: user.nomVille]];
        adresse3User.text = @"";

    }
    else {
        adresse1User.text = user.appartement;
        adresse2User.text = [user.numRue stringByAppendingString: [@", " stringByAppendingString: user.nomRue]];
        adresse3User.text = [user.numCodePostal stringByAppendingString: [@" " stringByAppendingString: user.nomVille]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [imageUser release];
    [nomUser release];
    [portableUser release];
    [domicileUser release];
    [emailUser release];
    [adresse1User release];
    [adresse2User release];
    [adresse3User release];
    [super dealloc];
}
@end
