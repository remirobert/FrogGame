//
//  RRCloud.h
//  frogGame
//
//  Created by remi on 25/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

#define NUMBER_CLOUDS       9

@interface RRCloud : NSObject

@property (nonatomic, strong) SKSpriteNode *cloud;
@property (nonatomic, strong) SKEmitterNode *rain;

- (void) launchWaterDrop:(NSTimeInterval)currentTime
         withParentScene:(SKScene *)parentScene;

@end
