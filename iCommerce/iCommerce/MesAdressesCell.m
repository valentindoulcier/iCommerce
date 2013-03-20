//
//  MesAdressesCell.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 20/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "MesAdressesCell.h"

@implementation MesAdressesCell
@synthesize adresse1User, adresse2User, adresse3User;

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
    [adresse1User release];
    [adresse2User release];
    [adresse3User release];
    [super dealloc];
}
@end
