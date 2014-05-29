//
//  RRMyScene.h
//  frogGame
//

//  Copyright (c) 2014 remi. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>
#import "RRFrog.h"

@interface RRMyScene : SKScene

@property (nonatomic, strong) RRFrog *frog;
@property (nonatomic, strong) SKSpriteNode *wave;
@property (nonatomic, strong) SKSpriteNode *waveBackground;
@property (nonatomic, strong) CMMotionManager *motionManager;

@end
