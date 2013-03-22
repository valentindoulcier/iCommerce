//
//  DetailViewController.h
//  iCommerce
//
//  Created by Adrien BATAILLE on 16/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"

@interface DetailViewController : UIViewController

@property (nonatomic, retain) Article *detailArticle;

@property (retain, nonatomic) IBOutlet UILabel *nom;
@property (retain, nonatomic) IBOutlet UILabel *marque;
@property (retain, nonatomic) IBOutlet UILabel *prix;
@property (retain, nonatomic) IBOutlet UIImageView *image;
@property (retain, nonatomic) IBOutlet UITextView *description;

@end
