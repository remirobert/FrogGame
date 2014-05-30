//
//  RRGameData.m
//  frogGame
//
//  Created by remi on 30/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRGameData.h"

@implementation RRGameData

+ (RRGameData *) DefaultData {
    static RRGameData *gameData;
    
    if (gameData == nil) {
        gameData = [[RRGameData alloc] init];
        gameData.score = 0;
    }
    return (gameData);
}

@end
