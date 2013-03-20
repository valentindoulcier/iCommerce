//
//  UserXMLParser.h
//  iCommerce
//
//  Created by Adrien BATAILLE on 20/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserXMLParser : NSObject <NSXMLParserDelegate>

@property (strong, readonly) NSMutableArray *user;

-(id) loadXMLByURL:(NSString *)urlString;

@end
