//
//  RRMyScene+Control.m
//  frogGame
//
//  Created by remi on 24/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRMyScene+Control.h"
#import "RRMyScene.h"
#import "RRGameData.h"

@interface RRMyScene ()
@end

@implementation RRMyScene (Control)

- (void) updatePositionFrog {
    if ([RRGameData DefaultData].isOver == YES) {
        NSLog(@"over = YES");
        return ;
    }
    
    if (self.motionManager == nil) {
        self.motionManager = [[CMMotionManager alloc] init];
        [self.motionManager startAccelerometerUpdates];
    }
    
    if (self.frog.node.position.x -
        (self.motionManager.accelerometerData.acceleration.y * 7) + 10 >=
        [UIScreen mainScreen].bounds.size.height ||
        self.frog.node.position.x -
        (self.motionManager.accelerometerData.acceleration.y * 7) < 0)
        return ;
    self.frog.node.position = CGPointMake(self.frog.node.position.x -
                                          (self.motionManager.accelerometerData.acceleration.y * 15),
                                          self.frog.node.position.y);
    
    [self.frog updatePositionCollisionMask];
}

@end
