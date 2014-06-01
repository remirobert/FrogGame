//
//  RRMyScene+Cloud.m
//  frogGame
//
//  Created by remi on 25/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRMyScene+Cloud.h"
#import "RRCloud.h"
#import "RRTimerStrat.h"

@implementation RRMyScene (Cloud)

- (void) newCloud:(NSMutableArray *)clouds {
    RRCloud *newCloud = [[RRCloud alloc] init];
    
    [clouds addObject:newCloud];
    [self addChild:newCloud.cloud];
    [self addChild:newCloud.rain];
}

- (void) removeNodeCloud:(NSMutableArray *)clouds {
    for (RRCloud *currentCloud in clouds) {
        if (currentCloud.cloud.position.x -
            currentCloud.cloud.frame.size.width / 2 >=
            [UIScreen mainScreen].bounds.size.height) {
            [currentCloud.cloud removeFromParent];
            [currentCloud.rain removeFromParent];
            [clouds removeObject:currentCloud];
            return ;
        }
    }
}

- (void) moveCloud {
    [self enumerateChildNodesWithName:@"cloud" usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x + 1.0, node.position.y);
    }];
    
    [self enumerateChildNodesWithName:@"rain" usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x + 1.0, node.position.y);
    }];
}

- (void) addCloud:(NSTimeInterval)currentTime
   withListClouds:(NSMutableArray *)clouds {
    
    static NSTimeInterval timePop = 0;

    [self moveCloud];
    [self removeNodeCloud:clouds];
    if (currentTime >= timePop) {
        [self newCloud:clouds];
        timePop = currentTime + [RRTimerStrat getTimerPopCloud];
    }
}

- (void) dropWaterDrop:(NSTimeInterval)currentTime :(NSMutableArray *)clouds {
    for (RRCloud *currentCloud in clouds) {
        [currentCloud launchWaterDrop:currentTime
                      withParentScene:self];
    }
}

@end
