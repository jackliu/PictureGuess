//
//  GameViewController.m
//  PictureGuess
//
//  Created by ZhangYazhao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"

@implementation GameViewController

@synthesize flowerView;
@synthesize flagView;
@synthesize fruitView;
@synthesize starView;

@synthesize delegate;

@synthesize mainSelectView;
@synthesize flagButton;
@synthesize flowerButton;
@synthesize fruitButton;
@synthesize starButton;
@synthesize OKButton;
@synthesize backButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self makeFlowerView];
        [self makeMainSelectView];
        [self makeFlagView];
        [self makeFruitView];
        [self makeStarView];
        self.view = mainSelectView;
    }
    return self;
}

#pragma mark - 代理类 Game2MainProtocal.h 中的方法
-(void)BackToGameSelect
{
    self.view = mainSelectView;
}

-(void)BackToGameSelectChange:(NSString *)string
{
    self.view = mainSelectView;
    self.OKButton.enabled = YES;
    if ([string isEqual:@"Flower"]) {
        flowerButton.enabled = NO;
    } else {
        if ([string isEqual:@"Flag"]) {
            flagButton.enabled = NO;
        } else {
            if ([string isEqual:@"Fruit"]) {
                fruitButton.enabled = NO;
            } else {
                starButton.enabled = NO;
            }
        }
    }
}

-(void)makeMainSelectView
{
    mainSelectView = [[UIView alloc]init];
    
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 768, 1004)];
    imageView.image = [UIImage imageNamed:@"MainSelectView.png"];
    [mainSelectView addSubview:imageView];
    
    UIImageView* titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 60, 768, 100)];
    titleImage.image = [UIImage imageNamed:@"TitleLabel.png"];
    titleImage.backgroundColor = [UIColor clearColor];
    [mainSelectView addSubview:titleImage];
    [titleImage release];
    
    
    
    flowerButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 250, 368, 100)];
//    flowerButton.backgroundColor = [UIColor blueColor];
//    
//    [mainSelectView addSubview:flowerButton];
//    [flowerButton addTarget:self action:@selector(flowerPress:) forControlEvents:UIControlEventTouchUpInside];
//    [flowerButton release];
    
    [flowerButton setBackgroundImage:[UIImage imageNamed:@"FlowerButton.png"] forState:UIControlStateNormal];
    flowerButton.backgroundColor = [UIColor clearColor];
    [flowerButton addTarget:self action:@selector(flowerPress:) forControlEvents:UIControlEventTouchUpInside];
    [mainSelectView addSubview:flowerButton];
    [flowerButton release];
    
    flagButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 400, 368, 100)];
    [flagButton setBackgroundImage:[UIImage imageNamed:@"FlagButton.png"] forState:UIControlStateNormal];
    flagButton.backgroundColor = [UIColor clearColor];
    [flagButton addTarget:self action:@selector(flagPress:) forControlEvents:UIControlEventTouchUpInside];
    [mainSelectView addSubview:flagButton];
    [flagButton release];
    
    fruitButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 550, 368, 100)];
    [fruitButton setBackgroundImage:[UIImage imageNamed:@"FruitButton.png"] forState:UIControlStateNormal];
    fruitButton.backgroundColor = [UIColor clearColor];
    [fruitButton addTarget:self action:@selector(fruitPress:) forControlEvents:UIControlEventTouchUpInside];
    [mainSelectView addSubview:fruitButton];
    [fruitButton release];
    
    starButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 700, 368, 100)];
    [starButton setBackgroundImage:[UIImage imageNamed:@"StarButton.png"] forState:UIControlStateNormal];
    starButton.backgroundColor = [UIColor clearColor];
    [starButton addTarget:self action:@selector(starPress:) forControlEvents:UIControlEventTouchUpInside];
    [mainSelectView addSubview:starButton];
    [starButton release];
    
    OKButton = [[UIButton alloc]initWithFrame:CGRectMake(568, 850, 150, 150)];
    [OKButton setBackgroundImage:[UIImage imageNamed:@"OKButton.png"] forState:UIControlStateNormal];
    [OKButton addTarget:self action:@selector(OKPress:) forControlEvents:UIControlEventTouchUpInside];
    OKButton.backgroundColor = [UIColor clearColor];
    
    OKButton.enabled = NO;
    
    [mainSelectView addSubview:OKButton];
    [OKButton release];
    
    backButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 850, 150, 150)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"BackButton.png"] forState:UIControlStateNormal];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(backPress:) forControlEvents:UIControlEventTouchUpInside];
    [mainSelectView addSubview:backButton];
    [backButton release];
    
}


-(void)makeFlowerView
{
    flowerView = [[GameViewS alloc]init];
    flowerView.delegate = self;
    
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 768, 1004)];
    imageView.image = [UIImage imageNamed:@"MainSelectView.png"];
    [flowerView addSubview:imageView];
    
    UIImageView* titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 54, 768, 150)];
    titleImage.image = [UIImage imageNamed:@"FlowerTitle.png"];
    titleImage.backgroundColor = [UIColor clearColor];
    [flowerView addSubview:titleImage];
    [titleImage release];
    
    
    flowerView.backgroundColor = [UIColor clearColor];
    NSMutableArray* imageArray = [[NSMutableArray alloc]initWithCapacity:10];
    NSMutableArray* labelArray = [[NSMutableArray alloc]initWithCapacity:10];
    NSString* stringPath = [NSString stringWithFormat:@"/Users/liu/Desktop/PictureGuess/PictureGuess/LabelName.plist"];
    NSDictionary* Dict = [NSDictionary dictionaryWithContentsOfFile:stringPath];
    NSDictionary* flowerDict = [NSDictionary dictionaryWithDictionary:[Dict objectForKey:@"FlowerLabel"]];
    NSLog(@"%@",flowerDict);
    for (int i = 0; i < 10; i ++) {
        
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat: @"flower%i.png",i]];
        [imageArray addObject:image];
        [labelArray addObject:[flowerDict objectForKey:[NSString stringWithFormat:@"%i",i]]];
    }
    [flowerView makeImage:imageArray];
    [flowerView makeLabel:labelArray forString:@"Flower"];
    
    
    
}

-(void)makeFlagView
{
    flagView = [[GameViewS alloc]init];
    flagView.delegate = self;
    
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 768, 1004)];
    imageView.image = [UIImage imageNamed:@"MainSelectView.png"];
    [flagView addSubview:imageView];
    
    UIImageView* titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 54, 768, 150)];
    titleImage.image = [UIImage imageNamed:@"FlagTitle.png"];
    titleImage.backgroundColor = [UIColor clearColor];
    [flagView addSubview:titleImage];
    [titleImage release];
    
    
    flagView.backgroundColor = [UIColor clearColor];
    NSMutableArray* imageArray = [[NSMutableArray alloc]initWithCapacity:10];
    NSMutableArray* labelArray = [[NSMutableArray alloc]initWithCapacity:10];
    NSString* stringPath = [NSString stringWithFormat:@"/Users/liu/Desktop/PictureGuess/PictureGuess/LabelName.plist"];
    NSDictionary* Dict = [NSDictionary dictionaryWithContentsOfFile:stringPath];
    NSDictionary* flagDict = [NSDictionary dictionaryWithDictionary:[Dict objectForKey:@"FlagLabel"]];
    NSLog(@"%@",flagDict);
    for (int i = 0; i < 10; i ++) {
        
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat: @"flag%i.png",i]];
        [imageArray addObject:image];
        [labelArray addObject:[flagDict objectForKey:[NSString stringWithFormat:@"%i",i]]];
    }
    [flagView makeImage:imageArray];
    [flagView makeLabel:labelArray forString:@"Flag"];
    
    
    
}

-(void)makeFruitView
{
    fruitView = [[GameViewS alloc]init];
    fruitView.delegate = self;
    
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 768, 1004)];
    imageView.image = [UIImage imageNamed:@"MainSelectView.png"];
    [fruitView addSubview:imageView];
    
    UIImageView* titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 54, 768, 150)];
    titleImage.image = [UIImage imageNamed:@"FruitsTitle.png"];
    titleImage.backgroundColor = [UIColor clearColor];
    [fruitView addSubview:titleImage];
    [titleImage release];
    
    
    fruitView.backgroundColor = [UIColor clearColor];
    NSMutableArray* imageArray = [[NSMutableArray alloc]initWithCapacity:10];
    NSMutableArray* labelArray = [[NSMutableArray alloc]initWithCapacity:10];
    NSString* stringPath = [NSString stringWithFormat:@"/Users/liu/Desktop/PictureGuess/PictureGuess/LabelName.plist"];
    NSDictionary* Dict = [NSDictionary dictionaryWithContentsOfFile:stringPath];
    NSDictionary* fruitDict = [NSDictionary dictionaryWithDictionary:[Dict objectForKey:@"FruitLabel"]];
    NSLog(@"%@",fruitDict);
    for (int i = 0; i < 10; i ++) {
        
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat: @"fruit%i.png",i]];
        [imageArray addObject:image];
        [labelArray addObject:[fruitDict objectForKey:[NSString stringWithFormat:@"%i",i]]];
    }
    [fruitView makeImage:imageArray];
    [fruitView makeLabel:labelArray forString:@"Fruit"];
    
    
    
}

-(void)makeStarView
{
    starView = [[GameViewS alloc]init];
    starView.delegate = self;
    
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 768, 1004)];
    imageView.image = [UIImage imageNamed:@"MainSelectView.png"];
    [starView addSubview:imageView];
    
    UIImageView* titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 54, 768, 150)];
    titleImage.image = [UIImage imageNamed:@"Stars.png"];
    titleImage.backgroundColor = [UIColor clearColor];
    [starView addSubview:titleImage];
    [titleImage release];
    
    
    starView.backgroundColor = [UIColor clearColor];
    NSMutableArray* imageArray = [[NSMutableArray alloc]initWithCapacity:10];
    NSMutableArray* labelArray = [[NSMutableArray alloc]initWithCapacity:10];
    NSString* stringPath = [NSString stringWithFormat:@"/Users/liu/Desktop/PictureGuess/PictureGuess/LabelName.plist"];
    NSDictionary* Dict = [NSDictionary dictionaryWithContentsOfFile:stringPath];
    NSDictionary* starDict = [NSDictionary dictionaryWithDictionary:[Dict objectForKey:@"StarLabel"]];
    NSLog(@"%@",starDict);
    for (int i = 0; i < 10; i ++) {
        
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat: @"star%i.png",i]];
        [imageArray addObject:image];
        [labelArray addObject:[starDict objectForKey:[NSString stringWithFormat:@"%i",i]]];
    }
    [starView makeImage:imageArray];
    [starView makeLabel:labelArray forString:@"Star"];
    
    
    
}

-(void)flowerPress:(id)sender
{
    NSLog(@"flower");
    self.view = flowerView;
}
-(void)flagPress:(id)sender
{
    NSLog(@"flag");
    self.view = flagView;
}
-(void)fruitPress:(id)sender
{
    NSLog(@"fruit");
    self.view = fruitView;
}
-(void)starPress:(id)sender
{
    NSLog(@"star");
    self.view = starView;
}
-(void)OKPress:(id)sender//修改
{
    UIView* scoreView = [[UIView alloc]initWithFrame:CGRectMake(234, 400, 300, 300)];
    scoreView.backgroundColor = [UIColor yellowColor];
    scoreView.alpha = 0.8;
    
    UILabel* scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 100, 50)];
    scoreLabel.text = [NSString stringWithFormat:@"%i",self.flowerView.score+self.flagView.score+self.fruitView.score+self.starView.score];
    scoreLabel.backgroundColor = [UIColor purpleColor];
    scoreLabel.textColor = [UIColor redColor];
    scoreLabel.font = [UIFont fontWithName:@"Arial" size:30];
    scoreLabel.textAlignment = UITextAlignmentCenter;
    
    [scoreView addSubview:scoreLabel];
    
    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    button.backgroundColor = [UIColor clearColor];
    [button setBackgroundImage:[UIImage imageNamed:@"OKButton.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(Cancel:) forControlEvents:UIControlEventTouchUpInside];
    [scoreView addSubview:button];
    
    [self.view addSubview:scoreView];
    
}

-(void)Cancel:(id)sender
{
    UIView* temp = sender;
    [temp.superview removeFromSuperview];
}


-(void)backPress:(id)sender
{
    NSLog(@"%s  %s",__func__,__FILE__);
    [self.delegate backMethod:nil];
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
