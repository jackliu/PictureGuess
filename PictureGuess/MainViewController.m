//
//  MainViewController.m
//  PictureGuess
//
//  Created by ZhangYazhao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize delegate;

@synthesize startButton;
@synthesize rankingButton;
@synthesize authorButton;
@synthesize helpButton;
@synthesize rankingCtr = _rankingCtr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self makeFace];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)makeFace
{
    NSLog(@"%s %s",__func__,__FILE__);
    UIImageView* backIamge = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainBackIamge.png"]];
    [self.view addSubview:backIamge];
    
    
    
    UIImageView* titleIamge = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, 768, 150)];
    titleIamge.image = [UIImage imageNamed:@"mainTitleImage.png"];
    [self.view addSubview:titleIamge];
    
    
    
    startButton = [[UIButton alloc]initWithFrame:CGRectMake(284, 300, 200, 75)];
    [startButton setBackgroundImage:[UIImage imageNamed:@"mainStartImage.png"] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(StartPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
    rankingButton = [[UIButton alloc]initWithFrame:CGRectMake(284, 475, 200, 75)];
    [rankingButton setBackgroundImage:[UIImage imageNamed:@"mainRankingImage.png"] forState:UIControlStateNormal];
    [rankingButton addTarget:self action:@selector(RankingPressed:) forControlEvents:UIControlEventTouchUpInside];
    rankingButton.enabled = NO;
    [self.view addSubview:rankingButton];
    
    authorButton = [[UIButton alloc]initWithFrame:CGRectMake(284, 650, 200, 75)];
    [authorButton setBackgroundImage:[UIImage imageNamed:@"mainAuthorImage.png"] forState:UIControlStateNormal];
    [authorButton addTarget:self action:@selector(AuthorPressed:) forControlEvents:UIControlEventTouchUpInside];
    authorButton.enabled = NO;
    [self.view addSubview:authorButton];
    
    helpButton = [[UIButton alloc]initWithFrame:CGRectMake(284, 825, 200, 75)];
    [helpButton setBackgroundImage:[UIImage imageNamed:@"mainHelpImage.png"] forState:UIControlStateNormal];
    [helpButton addTarget:self action:@selector(HelpPressed:) forControlEvents:UIControlEventTouchUpInside];
    helpButton.enabled = NO;
    [self.view addSubview:helpButton];
    
}

#pragma mark - button pressed method

-(void)StartPressed:(id)sender
{
    [self.delegate startMethod:nil];
}

-(void)RankingPressed:(id)sender
{
    self.rankingCtr = [[RankingViewController alloc]init];
    [self.view addSubview:self.rankingCtr.view];
    NSLog(@"End...");
}

-(void)AuthorPressed:(id)sender
{
    
}

-(void)HelpPressed:(id)sender
{
    
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

@end
