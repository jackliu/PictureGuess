//
//  Star2StarAppDelegate.h
//  PictureGuess
//
//  Created by ZhangYazhao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"
#import "MainViewController.h"

@interface Star2StarAppDelegate : UIResponder <UIApplicationDelegate,MainTodelegateProtocal,GameToDelegateProtocol>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GameViewController* gameviewCtr;
@property (strong, nonatomic) MainViewController* mainviewCtr;

@end


























