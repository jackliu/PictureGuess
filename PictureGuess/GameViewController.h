//
//  GameViewController.h
//  PictureGuess
//
//  Created by ZhangYazhao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GameViewS.h"
#import "GameToDelegateProtocol.h"

@interface GameViewController : UIViewController <Game2MainProtocal>

@property (nonatomic, retain) GameViewS* flowerView;
@property (nonatomic, retain) GameViewS* flagView;
@property (nonatomic, retain) GameViewS* fruitView;
@property (nonatomic, retain) GameViewS* starView;
@property (nonatomic, retain) id <GameToDelegateProtocol> delegate;


@property (nonatomic, retain) UIView* mainSelectView;
@property (nonatomic, retain) UIButton* flowerButton;
@property (nonatomic, retain) UIButton* starButton;
@property (nonatomic, retain) UIButton* flagButton;
@property (nonatomic, retain) UIButton* fruitButton;
@property (nonatomic, retain) UIButton* OKButton;
@property (nonatomic, retain) UIButton* backButton;


-(void) makeFlowerView;
-(void) makeFlagView;
-(void) makeFruitView;
-(void) makeStarView;
-(void) makeMainSelectView;

-(void)flowerPress:(id)sender;
-(void)flagPress:(id)sender;
-(void)fruitPress:(id)sender;
-(void)starPress:(id)sender;
-(void)OKPress:(id)sender;
-(void)backPress:(id)sender;
-(void)Cancel:(id)sender;


@end


