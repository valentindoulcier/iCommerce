//
//  UserXMLParser.m
//  iCommerce
//
//  Created by Adrien BATAILLE on 20/03/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "UserXMLParser.h"
#import "User.h"

@implementation UserXMLParser


@synthesize user;

NSMutableString	*currentNodeContent;
NSXMLParser		*parser;
User			*currentUser;
bool            isAdresses;
bool            isAdressesPrincipale;

-(id) loadXMLByURL:(NSString *)urlString
{
	user    		= [[NSMutableArray alloc] init];
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
	if ([elementname isEqualToString:@"client"])
	{
		currentUser = [User alloc];
	}
    if ([elementname isEqualToString:@"adresses"])
    {
        isAdresses = true;
    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"idClient"])
    {
        currentUser.idClient = currentNodeContent;
    }
    if ([elementname isEqualToString:@"refClient"])
    {
        currentUser.ref = currentNodeContent;
    }
    if ([elementname isEqualToString:@"nomClient"])
    {
        currentUser.nom = currentNodeContent;
    }
    if ([elementname isEqualToString:@"emailClient"])
    {
        currentUser.email = currentNodeContent;
    }
    if ([elementname isEqualToString:@"loginClient"])
    {
        currentUser.login = currentNodeContent;
    }
    if ([elementname isEqualToString:@"passwordClient"])
    {
        currentUser.passwd = currentNodeContent;
    }
    if ([elementname isEqualToString:@"telephonePortable"])
    {
        currentUser.telephonePortable = currentNodeContent;
    }
    if ([elementname isEqualToString:@"telephoneDomicile"])
    {
        currentUser.telephoneDomicile = currentNodeContent;
    }
    if ([elementname isEqualToString:@"idAdressePrincipale"])
    {
        currentUser.idAdresse = currentNodeContent;
    }
    
    if ([elementname isEqualToString:@"adresses"])
    {
        isAdresses = false;
    }
    
    
    if ([elementname isEqualToString:@"appartement"])
    {
        currentUser.appartement = currentNodeContent;
    }
    if ([elementname isEqualToString:@"numRue"])
    {
        currentUser.numRue = currentNodeContent;
    }
    if ([elementname isEqualToString:@"nomRue"])
    {
        currentUser.nomRue = currentNodeContent;
    }
    if ([elementname isEqualToString:@"idVille"])
    {
        currentUser.idVille = currentNodeContent;
    }
    if ([elementname isEqualToString:@"idCodePostal"])
    {
        currentUser.idCodePostal = currentNodeContent;
    }
    if ([elementname isEqualToString:@"numCodePostal"])
    {
        currentUser.numCodePostal = currentNodeContent;
    }
    if ([elementname isEqualToString:@"nomVille"])
    {
        currentUser.nomVille = currentNodeContent;
    }
    
    
	if ([elementname isEqualToString:@"client"])
	{
		[self.user addObject:currentUser];
		currentUser = nil;
		currentNodeContent = nil;
	}
}


@end
