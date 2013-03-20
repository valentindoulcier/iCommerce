//
//  AuthentificationViewController.h
//  iCommerce
//
//  Created by Valentin DOULCIER on 16/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthentificationViewController : UIViewController
- (IBAction)authentification:(id)sender;

@property (retain, nonatomic) IBOutlet UITextField *login;
@property (retain, nonatomic) IBOutlet UITextField *passwd;

@end
