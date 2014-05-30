//
//  RRCloud.m
//  frogGame
//
//  Created by remi on 25/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRCloud.h"
#import "RRDrop.h"

@interface RRCloud ()
@property (nonatomic, assign) CGFloat timerPopDrop;
@property (nonatomic, assign) CGFloat timerPoisonDrop;
@property (nonatomic, assign) CGFloat timerMiddleDrop;
@property (nonatomic, assign) CGFloat timerBigDrop;
@end

@implementation RRCloud

- (void) initCloud {
    NSInteger randCloud = (rand() % (NUMBER_CLOUDS)) + 1;
    
    [NSString stringWithFormat:@"cloud%d", randCloud];
    
    _cloud = [[SKSpriteNode alloc]
                           initWithTexture
                           :[SKTexture textureWithImage
                             :[UIImage imageNamed
                               :[NSString stringWithFormat:@"cloud%d", randCloud]]]];
    
    _cloud.size = CGSizeMake(_cloud.size.width / 2, _cloud.size.height / 2);
    
    _cloud.position = CGPointMake(-(_cloud.size.width),
                                  [UIScreen mainScreen].bounds.size.width - _cloud.size.height / 2 + 10);
    _cloud.zPosition = 150;
    _cloud.name = @"cloud";
    
    NSString *myParticlePath = [[NSBundle mainBundle] pathForResource:@"MyParticle"
                                                               ofType:@"sks"];
    
    _rain = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    
    _rain.particlePosition = _cloud.position;
    _rain.zPosition = 60;
    _rain.name = @"rain";
}

- (instancetype) init {
    self = [super init];
    
    if (self != nil) {
        [self initCloud];
        _timerPopDrop = 0.0;
        _timerPoisonDrop = 0.0;
        _timerMiddleDrop = 0.0;
        _timerBigDrop = 0.0;
    }
    return (self);
}

- (void) launchWaterDrop:(NSTimeInterval)currentTime
         withParentScene:(SKScene *)parentScene {
    
    if (_timerPopDrop == 0.0 || _timerPoisonDrop == 0.0) {
        _timerPopDrop = (2.0 + (float) (rand()) / ((float)(RAND_MAX / (3.0 - 2.0)))) + currentTime;
        _timerPoisonDrop = (2.5 + (float) (rand()) / ((float)(RAND_MAX / (3.5 - 2.5)))) + currentTime;
        _timerMiddleDrop = (4 + (float) (rand()) / ((float)(RAND_MAX / (6.5 - 4)))) + currentTime;
        _timerBigDrop = (6 + (float) (rand()) / ((float)(RAND_MAX / (9 - 6)))) + currentTime;
    }
    
    if (currentTime >= _timerPopDrop) {
        SKSpriteNode *drop = [RRDrop createBlueWaterDrop:_cloud];
        
        [parentScene addChild:drop];
        [drop runAction:[SKAction moveToY:0
                                 duration:(1.5 + (float) (rand()) / ((float)(RAND_MAX / (2.25 - 1.5))))]
             completion:^{
            [drop removeFromParent];
        }];
        _timerPopDrop = (2.0 + (float) (rand()) / ((float)(RAND_MAX / (3.0 - 2.0)))) + currentTime;
    }
    
    if (currentTime >= _timerPoisonDrop) {
        SKSpriteNode *drop = [RRDrop createRedWaterDrop:_cloud];
        
        [parentScene addChild:drop];
        [drop runAction:[SKAction moveToY:0
                                 duration:(1.0 + (float) (rand()) / ((float)(RAND_MAX / (2.75 - 1.0))))]
             completion:^{
                 [drop removeFromParent];
             }];
        _timerPoisonDrop = (2.5 + (float) (rand()) / ((float)(RAND_MAX / (3.5 - 2.5)))) + currentTime;
    }
    
    if (currentTime >= _timerBigDrop) {
        if (rand() % 3 == 2) {
            SKSpriteNode *drop = [RRDrop createBigDropWater:_cloud];
        
            [parentScene addChild:drop];
            [drop runAction:[SKAction moveToY:0
                                     duration:(1 + (float) (rand()) / ((float)(RAND_MAX / (1.0 - 1))))]
                 completion:^{
                     [drop removeFromParent];
                 }];
        }
         _timerBigDrop = (6 + (float) (rand()) / ((float)(RAND_MAX / (9 - 6)))) + currentTime;
    }
    
    if (currentTime >= _timerMiddleDrop) {
        SKSpriteNode *drop = [RRDrop createMiddleDropWater:_cloud];
        
        [parentScene addChild:drop];
        [drop runAction:[SKAction moveToY:0
                                 duration:(1 + (float) (rand()) / ((float)(RAND_MAX / (2 - 1))))]
             completion:^{
                 [drop removeFromParent];
             }];
        _timerMiddleDrop = (4 + (float) (rand()) / ((float)(RAND_MAX / (6.5 - 4)))) + currentTime;
    }
}

@end
