//
//  RankingViewController.m
//  PictureGuess
//
//  Created by ZhangYazhao on 12-9-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RankingViewController.h"

//排名
@implementation RankingViewController


@synthesize data;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSString* path = [NSString stringWithFormat:@"/Users/liu/Desktop/PictureGuess/PictureGuess/Ranking.plist"];
    
    NSDictionary* rankingDict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSMutableArray* array = [[NSMutableArray alloc]initWithCapacity:10]; 
    NSDictionary* dict = [rankingDict objectForKey:@"RankingTable"];
    for(id key in dict)
    {
        [array addObject:[dict objectForKey:key]];
    }
    
    self.data = array;
    [array release];
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* string = @"Ranking Table";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string ]autorelease];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.data objectAtIndex:[indexPath row]]];
    
    return cell;
    
}

@end
