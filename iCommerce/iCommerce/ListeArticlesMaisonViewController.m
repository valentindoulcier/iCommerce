//
//  ListeArticlesViewController.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 16/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "ListeArticlesMaisonViewController.h"
#import "ArticleXMLParser.h"
#import "Article.h"
#import "ArticleItemTableViewCell.h"
#import "DetailViewController.h"

@interface ListeArticlesMaisonViewController ()

@end

@implementation ListeArticlesMaisonViewController

@synthesize ArticleTableView;

ArticleXMLParser *xmlParser;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //xmlParser = [[ArticleXMLParser alloc] loadXMLByURL:@"http://icommerce.no-ip.org/listArticle.php"];
    xmlParser = [[ArticleXMLParser alloc] loadXMLByURL:@"http://192.168.0.254:8090/listArticle.php?idCategorie=5"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[xmlParser articles] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ArticleItem";
	Article *currentArticle = [[xmlParser articles] objectAtIndex:indexPath.row];
    ArticleItemTableViewCell *cell = (ArticleItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *xib = [[NSBundle mainBundle] loadNibNamed:@"ArticleItemTableViewCell" owner:self options:nil];
        
        for (id oneObject in xib) {
            if ([oneObject isKindOfClass:[ArticleItemTableViewCell class]]) {
                cell = (ArticleItemTableViewCell *) oneObject;
            }
        }
    }
    
    // Configure the cell...
    
    cell.nomArticle.text = [currentArticle nomArticle];
    cell.description.text = [currentArticle description];
    cell.prix.text = [[currentArticle prixHT] stringByAppendingString:@" €"];
    cell.image.image = [UIImage imageNamed:[currentArticle image]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    Article *selectedArticle = [[xmlParser articles] objectAtIndex:indexPath.row];
    
    detailViewController.detailArticle = selectedArticle;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

- (void)dealloc {
    [ArticleTableView release];
    [xmlParser release];
    [super dealloc];
}
@end
