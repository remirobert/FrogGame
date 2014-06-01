//
//  RRMyScene+Enemies.m
//  frogGame
//
//  Created by remi on 30/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRMyScene+Enemies.h"
#import "RRSeaGull.h"
#import "RRTimerStrat.h"
#import "RRGameData.h"

@implementation RRMyScene (Enemies)

- (void) releaseEnemie:(NSTimeInterval) currentTime {
    static CGFloat timerseaGull = 0;
    
    if ([RRGameData DefaultData].score < 400)
        return ;
    
    if (timerseaGull == 0) {
        timerseaGull = [RRTimerStrat getTimerPopSeagull];
        return ;
    }
    if (currentTime >= timerseaGull) {
        RRSeaGull *seaGull = [[RRSeaGull alloc] init];
        
        [self addChild:seaGull.node];
        [self.enemies addObject:seaGull];
        timerseaGull = [RRTimerStrat getTimerPopSeagull] + currentTime;
    }
}

- (void) deleteEnemies {
    for (id currentEnemy in self.enemies) {
        if ([currentEnemy isKindOfClass:[RRSeaGull class]]) {
            if (((RRSeaGull *)currentEnemy).node.position.x >=
                [UIScreen mainScreen].bounds.size.height) {
                [((RRSeaGull *)currentEnemy).node removeFromParent];
                [self.enemies removeObject:currentEnemy];
                return ;
            }
        }
    }
}

- (void) mapEnemies {
    for (id currentEnemy in self.enemies) {
        if ([currentEnemy isKindOfClass:[RRSeaGull class]]) {
            [((RRSeaGull *)currentEnemy) moveSeaGull];
        }
    }
    [self deleteEnemies];
}

@end
