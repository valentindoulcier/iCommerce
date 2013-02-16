//
//  ArticleXMLParser.h
//  iCommerce
//
//  Created by Adrien BATAILLE on 16/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Article.h"

@interface ArticleXMLParser : NSObject <NSXMLParserDelegate>

@property (strong, readonly) NSMutableArray *articles;

-(id) loadXMLByURL:(NSString *)urlString;

@end
