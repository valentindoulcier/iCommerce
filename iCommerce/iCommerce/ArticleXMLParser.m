//
//  ArticleXMLParser.m
//  iCommerce
//
//  Created by Adrien BATAILLE on 16/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "ArticleXMLParser.h"

@implementation ArticleXMLParser

@synthesize articles;

NSMutableString	*currentNodeContent;
NSXMLParser		*parser;
Article			*currentArticle;

-(id) loadXMLByURL:(NSString *)urlString
{
	articles		= [[NSMutableArray alloc] init];
	NSURL *url		= [NSURL URLWithString:urlString];
	NSData	*data   = [[NSData alloc] initWithContentsOfURL:url];
	parser			= [[NSXMLParser alloc] initWithData:data];
	parser.delegate = self;
	[parser parse];
	return self;
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if ([elementname isEqualToString:@"article"])
	{
		currentArticle = [Article alloc];
	}
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"refArticle"])
    {
        currentArticle.refArticle = currentNodeContent;
    }
    if ([elementname isEqualToString:@"nomArticle"])
    {
        currentArticle.nomArticle = currentNodeContent;
    }
    if ([elementname isEqualToString:@"description"])
    {
        currentArticle.description = currentNodeContent;
    }
    if ([elementname isEqualToString:@"prixHT"])
    {
        currentArticle.prixHT = currentNodeContent;
    }
    if ([elementname isEqualToString:@"tauxTVA"])
    {
        currentArticle.tauxTVA = currentNodeContent;
    }
    if ([elementname isEqualToString:@"photo"])
    {
        currentArticle.image = currentNodeContent;
    }
    if ([elementname isEqualToString:@"nomCategorie"])
    {
        currentArticle.nomCategorie = currentNodeContent;
    }
    if ([elementname isEqualToString:@"nomSousCategorie"])
    {
        currentArticle.nomSousCategorie = currentNodeContent;
    }
    if ([elementname isEqualToString:@"nomMarque"])
    {
        currentArticle.nomMarque = currentNodeContent;
    }
    
	if ([elementname isEqualToString:@"article"])
	{
		[self.articles addObject:currentArticle];
		currentArticle = nil;
		currentNodeContent = nil;
	}
}


@end
