//
//  RRTimerStrat.m
//  frogGame
//
//  Created by remi on 30/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRTimerStrat.h"
#import "RRGameData.h"

@implementation RRTimerStrat

+ (CGFloat) getTimerPopSeagull {
    CGFloat min = 0;
    CGFloat max = 0;
    
    if ([RRGameData DefaultData].score >= 400 &&
             [RRGameData DefaultData].score < 600) {
        min = 8.0;
        max = 6.0;
    }
    else if ([RRGameData DefaultData].score >= 600 &&
             [RRGameData DefaultData].score < 800) {
        min = 7.0;
        max = 6.5;
    }
    else if ([RRGameData DefaultData].score >= 800 &&
             [RRGameData DefaultData].score < 1000){
        min = 6.0;
        max = 5.5;
    }
    else {
        min = 5.0;
        max = 4.0;
    }
    return ((min + (float) (rand()) / ((float)(RAND_MAX / (max - min)))));
}

+ (CGFloat) getTimerPopCloud {
    CGFloat min = 0;
    CGFloat max = 0;

    if ([RRGameData DefaultData].score >= 0 &&
        [RRGameData DefaultData].score < 200) {
        min = 4.0;
        max = 5.0;
    }
    else if ([RRGameData DefaultData].score >= 200 &&
             [RRGameData DefaultData].score < 400) {
        min = 3.5;
        max = 4.5;
    }
    else if ([RRGameData DefaultData].score >= 400 &&
             [RRGameData DefaultData].score < 600) {
        min = 3.0;
        max = 4.0;
    }
    else if ([RRGameData DefaultData].score >= 600 &&
             [RRGameData DefaultData].score < 800) {
        min = 2.0;
        max = 3.0;
    }
    else if ([RRGameData DefaultData].score >= 800 &&
             [RRGameData DefaultData].score < 1000){
        min = 1.5;
        max = 2.5;
    }
    else {
        min = 1.0;
        max = 1.5;
    }
    return ((min + (float) (rand()) / ((float)(RAND_MAX / (max - min)))));
}

@end
