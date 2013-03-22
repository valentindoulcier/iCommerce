//
//  ListeArticlesViewController.h
//  iCommerce
//
//  Created by Valentin DOULCIER on 22/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListeArticlesViewController : UITableViewController

@property (retain, nonatomic) IBOutlet UITableView *ArticleTableView;
@property (retain, nonatomic) NSString *categories;

@end
