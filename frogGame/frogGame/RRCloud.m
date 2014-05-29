//
//  RRCloud.m
//  frogGame
//
//  Created by remi on 25/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRCloud.h"

@interface RRCloud ()
@property (nonatomic, assign) CGFloat timerPopDrop;
@property (nonatomic, assign) CGFloat timerPoisonDrop;
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
    }
    return (self);
}

- (SKSpriteNode *) createBlueWaterDrop {
    SKSpriteNode *drop = [[SKSpriteNode alloc] initWithImageNamed:@"blue_water_drop"];
    
    drop.position = CGPointMake((rand() % (int)_cloud.size.width) +
                                (_cloud.position.x - _cloud.size.width / 2),
                                [UIScreen mainScreen].bounds.size.width);
    drop.size = CGSizeMake(drop.size.width / 2, drop.size.height / 2);
    drop.zPosition = 101;
    drop.name = @"waterdrop";
    return (drop);
}

- (SKSpriteNode *) createRedWaterDrop {
    SKSpriteNode *drop = [[SKSpriteNode alloc] initWithImageNamed:@"red_water_drop"];
    
    drop.position = CGPointMake((rand() % (int)_cloud.size.width) +
                                (_cloud.position.x - _cloud.size.width / 2),
                                [UIScreen mainScreen].bounds.size.width);
    drop.size = CGSizeMake(drop.size.width / 2, drop.size.height / 2);
    drop.zPosition = 101;
    drop.name = @"reddrop";
    return (drop);
}

- (void) launchWaterDrop:(NSTimeInterval)currentTime
         withParentScene:(SKScene *)parentScene {
    
    if (_timerPopDrop == 0.0 || _timerPoisonDrop == 0.0) {
        _timerPopDrop = (2.0 + (float) (rand()) / ((float)(RAND_MAX / (3.0 - 2.0)))) + currentTime;
        _timerPoisonDrop = (2.5 + (float) (rand()) / ((float)(RAND_MAX / (3.5 - 2.5)))) + currentTime;
    }
    
    if (currentTime >= _timerPopDrop) {
        SKSpriteNode *drop = [self createBlueWaterDrop];
        
        [parentScene addChild:drop];
        [drop runAction:[SKAction moveToY:0
                                 duration:(1.5 + (float) (rand()) / ((float)(RAND_MAX / (2.25 - 1.5))))]
             completion:^{
            [drop removeFromParent];
        }];
        _timerPopDrop = (2.0 + (float) (rand()) / ((float)(RAND_MAX / (3.0 - 2.0)))) + currentTime;
    }
    
    if (currentTime >= _timerPoisonDrop) {
        SKSpriteNode *drop = [self createRedWaterDrop];
        
        [parentScene addChild:drop];
        [drop runAction:[SKAction moveToY:0
                                 duration:(1.0 + (float) (rand()) / ((float)(RAND_MAX / (2.75 - 1.0))))]
             completion:^{
                 [drop removeFromParent];
             }];
        _timerPoisonDrop = (2.5 + (float) (rand()) / ((float)(RAND_MAX / (3.5 - 2.5)))) + currentTime;
    }
}

@end
