//
//  GameViewS.h
//  PictureGuess
//
//  Created by ZhangYazhao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyLabel.h"
#import "Game2MainProtocal.h"


@interface GameViewS : UIView

{
    MyLabel* label[10];
    UIImageView* imageView[10];
    UIButton* backButton;
    UIButton* submitButton;
    int score;
}

@property (nonatomic,retain) id <Game2MainProtocal> delegate;
@property int score;
@property (nonatomic, retain) NSString* string;


-(void) makeLabel : (NSArray*) labelArray forString:(NSString*) _string;//设置label组
-(void) makeImage : (NSArray*) imageArray ;//设置image组

-(void) CheckGoal;
-(void) Back:(id)sender;

-(void)OK:(id)sender; 
@end
