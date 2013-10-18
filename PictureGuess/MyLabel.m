//
//  MyLabel.m
//  PictureGuess
//
//  Created by ZhangYazhao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //允许用户相互作用 
        self.userInteractionEnabled = YES;
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Begin...");
    self.alpha = 0.5;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Moved...");
    if ([touches count]==1) {
        UITouch* touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.superview];
        self.center = point;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"End...");
    self.alpha = 1.0;
}

@end
