//
//  ArticleItemTableViewCell.m
//  iCommerce
//
//  Created by Adrien BATAILLE on 16/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "ArticleItemTableViewCell.h"

@implementation ArticleItemTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_nomArticle release];
    [_description release];
    [_prix release];
    [_image release];
    [super dealloc];
}
@end
