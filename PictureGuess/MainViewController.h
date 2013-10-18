//
//  MainViewController.h
//  PictureGuess
//
//  Created by ZhangYazhao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTodelegateProtocal.h"
#import "RankingViewController.h"

@interface MainViewController : UIViewController

@property (nonatomic, retain) UIButton* startButton;  //开始按钮
@property (nonatomic, retain) UIButton* rankingButton;  //排行榜按钮
@property (nonatomic, retain) UIButton* authorButton;  //作者信息按钮
@property (nonatomic, retain) UIButton* helpButton;  //帮助信息按钮
@property (nonatomic, retain) id <MainTodelegateProtocal> delegate;
@property (nonatomic, strong) RankingViewController* rankingCtr;

-(void) StartPressed:(id)sender;  //开始按钮方法
-(void) RankingPressed:(id)sender;  //排行榜按钮方法
-(void) AuthorPressed:(id)sender;  //作者信息按钮方法
-(void) HelpPressed:(id)sender;  //帮助信息按钮方法

-(void) makeFace;  //创建界面方法

@end













