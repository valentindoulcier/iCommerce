//
//  Article.h
//  iCommerce
//
//  Created by Adrien BATAILLE on 16/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (strong, nonatomic) NSString *refArticle;
@property (strong, nonatomic) NSString *nomArticle;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *prixHT;
@property (strong, nonatomic) NSString *tauxTVA;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *nomCategorie;
@property (strong, nonatomic) NSString *nomSousCategorie;
@property (strong, nonatomic) NSString *nomMarque;

@end
