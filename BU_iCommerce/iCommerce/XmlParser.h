//
//  XmlParser.h
//  XmlParse
//
//  Created by Adrien BATAILLE on 02/02/13.
//  Copyright (c) 2013 Adrien BATAILLE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Article.h"

@interface XmlParser : NSObject <NSXMLParserDelegate>

@property (strong, readonly) NSMutableArray *articles;

-(id) loadXMLByURL:(NSString *)urlString;

@end
