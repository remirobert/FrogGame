//
//  RRMyScene+Cloud.h
//  frogGame
//
//  Created by remi on 25/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRMyScene.h"

@interface RRMyScene (Cloud)

- (void) addCloud:(NSTimeInterval)currentTime withListClouds:(NSMutableArray *)clouds;
- (void) dropWaterDrop:(NSTimeInterval)currentTime :(NSMutableArray *)clouds;

@end
