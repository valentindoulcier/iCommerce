//
//  MonCompteViewController.h
//  iCommerce
//
//  Created by Valentin DOULCIER on 16/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface MonCompteViewController : UIViewController

@property (nonatomic, retain) User *user;

@property (retain, nonatomic) IBOutlet UIImageView *imageUser;
@property (retain, nonatomic) IBOutlet UILabel *nomUser;
@property (retain, nonatomic) IBOutlet UILabel *portableUser;
@property (retain, nonatomic) IBOutlet UILabel *domicileUser;
@property (retain, nonatomic) IBOutlet UILabel *emailUser;
@property (retain, nonatomic) IBOutlet UILabel *adresse1User;
@property (retain, nonatomic) IBOutlet UILabel *adresse2User;
@property (retain, nonatomic) IBOutlet UILabel *adresse3User;

@end
