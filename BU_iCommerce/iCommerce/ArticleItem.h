//
//  ArticleItem.h
//  iCommerce
//
//  Created by Adrien BATAILLE on 16/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleItem : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *nomArticle;
@property (retain, nonatomic) IBOutlet UILabel *description;
@property (retain, nonatomic) IBOutlet UILabel *prix;
@property (retain, nonatomic) IBOutlet UIImageView *image;

@end
