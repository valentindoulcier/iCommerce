//
//  Article.h
//  XmlParse
//
//  Created by Adrien BATAILLE on 02/02/13.
//  Copyright (c) 2013 Adrien BATAILLE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (strong, nonatomic)NSString *refArticle;
@property (strong, nonatomic)NSString *nomArticle;
@property (strong, nonatomic)NSString *description;
@property (strong, nonatomic)NSString *prixHT;
@property (strong, nonatomic)NSString *tauxTVA;
@property (strong, nonatomic)NSString *image;

@end
