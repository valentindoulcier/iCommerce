//
//  User.h
//  iCommerce
//
//  Created by Adrien BATAILLE on 20/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *idClient;
@property (strong, nonatomic) NSString *ref;
@property (strong, nonatomic) NSString *nom;
@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSString *passwd;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *telephonePortable;
@property (strong, nonatomic) NSString *telephoneDomicile;
@property (strong, nonatomic) NSString *idAdresse;
@property (strong, nonatomic) NSString *appartement;
@property (strong, nonatomic) NSString *numRue;
@property (strong, nonatomic) NSString *nomRue;
@property (strong, nonatomic) NSString *idVille;
@property (strong, nonatomic) NSString *nomVille;
@property (strong, nonatomic) NSString *idCodePostal;
@property (strong, nonatomic) NSString *numCodePostal;

@end
