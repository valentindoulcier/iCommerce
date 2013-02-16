//
//  AppDelegate.m
//  iCommerce
//
//  Created by Valentin DOULCIER on 02/02/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "AppDelegate.h"
#import "AccueilViewController.h"
#import "RechercheViewController.h"
#import "ListeSouhaitsViewController.h"
#import "AuthentificationViewController.h"

@implementation AppDelegate

@synthesize window = _window, tabBar;

- (void)dealloc
{
    [_window release];
    [tabBar release];
    [super dealloc];

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    tabBar = [[UITabBarController alloc] init];
    
    AccueilViewController *accueil = [[AccueilViewController alloc] initWithNibName:@"AccueilViewController" bundle:nil];
    accueil.tabBarItem.image = [UIImage imageNamed:@"home.png"];
    accueil.tabBarItem.title = @"Accueil";
    
    RechercheViewController *recherche = [[RechercheViewController alloc] initWithNibName:@"RechercheViewController" bundle:nil];
    recherche.tabBarItem.image = [UIImage imageNamed:@"loupe.png"];
    recherche.tabBarItem.title = @"Recherche";

    ListeSouhaitsViewController *listeSouhaits = [[ListeSouhaitsViewController alloc] initWithNibName:@"ListeSouhaitsViewController" bundle:nil];
    listeSouhaits.tabBarItem.image = [UIImage imageNamed:@"home.png"];
    listeSouhaits.tabBarItem.title = @"Liste de souhaits";
    
    AuthentificationViewController *authentification = [[AuthentificationViewController alloc] initWithNibName:@"AuthentificationViewController" bundle:nil];
    authentification.tabBarItem.image = [UIImage imageNamed:@"loupe.png"];
    authentification.tabBarItem.title = @"Authentification";
    
    tabBar.viewControllers = [[NSArray alloc] initWithObjects:accueil, recherche, listeSouhaits, authentification, nil];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
