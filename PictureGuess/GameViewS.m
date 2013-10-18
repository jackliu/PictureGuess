//
//  GameViewS.m
//  PictureGuess
//
//  Created by ZhangYazhao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameViewS.h"

@implementation GameViewS

@synthesize delegate;
@synthesize score;
@synthesize string;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization codes
        score = 0;
    }
    return self;
}

-(void)makeLabel:(NSArray *)labelArray forString:(NSString*)_string
{
    for (int i = 0; i < 10; i ++ ) {
        
        float x = 235 + (80+68+35)*(i%2);
        float y = 354+(60+10)*(i%5);
        CGRect labelRect = CGRectMake(x, y, 120, 65);
        label[i] = [[MyLabel alloc]initWithFrame:labelRect];
        label[i].userInteractionEnabled = YES;
        label[i].image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[labelArray objectAtIndex:i]]];
        label[i].backgroundColor = [UIColor clearColor];
        NSLog(@"%i  ,   %i",i,label[i].userInteractionEnabled);
        [self addSubview:label[i]];
        
        
        
    }
    
    //self.string = [[NSString alloc]initWithFormat:_string];
    self.string = _string;
    
    backButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 890, 100, 60)];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(Back:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage: [UIImage imageNamed:@"BackButton.png"] forState:UIControlStateNormal];
    [self addSubview:backButton];
    [backButton release];
        
    submitButton = [[UIButton alloc]initWithFrame:CGRectMake(618, 890, 100, 60)];
    [submitButton setBackgroundImage: [UIImage imageNamed:@"OKButton.png"] forState:UIControlStateNormal];
    submitButton.backgroundColor = [UIColor clearColor];
    [submitButton addTarget:self action:@selector(OK:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:submitButton];
    [submitButton release];
}

-(void)makeImage:(NSArray *)imageArray
{
    for (int i = 0; i < 10 ; i ++) {
        float x ;
        float y ;
        if( i < 4)
        {
            x = 75;
            y = 254 + (90 + 60) * i;
        }
        else
        {
            if (i < 6) {
                x = 334;
                
                y = 254 + (450) * (i%4);
            }
            else
            {
                x = 593;
                y = y = 254 + (90 + 60) * (i-6);
            }
        }
        CGRect imageRect = CGRectMake(x, y, 100, 90);
        imageView [i] = [[UIImageView alloc]initWithFrame:imageRect];
        imageView[i].image = [imageArray objectAtIndex: i];
        [self addSubview:imageView[i]];
        
    }
}

-(void)CheckGoal
{
    //check goal
    for (int i = 0; i<10; i++) {
        
        CGRect rect = imageView[i].frame;
        CGPoint point = label[i].center;
        if (point.x>rect.origin.x&&point.x<rect.origin.x+rect.size.width&&point.y>rect.origin.y&&point.y<rect.origin.y+rect.size.height) {
            score += 10;
        }
    }
    
    
}

-(void)Back:(id)sender
{
    //back
    [self.delegate BackToGameSelect];
}

-(void)OK:(id)sender{
    [self CheckGoal];
    [self.delegate BackToGameSelectChange:string];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
