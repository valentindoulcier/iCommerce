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
@property (retain, nonatomic) IBOutlet UILabel *nameUser;

@end
