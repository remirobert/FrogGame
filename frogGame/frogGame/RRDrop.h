//
//  RRDrop.h
//  frogGame
//
//  Created by remi on 30/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface RRDrop : NSObject

+ (SKSpriteNode *) createBlueWaterDrop:(SKSpriteNode *)cloud;
+ (SKSpriteNode *) createRedWaterDrop:(SKSpriteNode *)cloud;
+ (SKSpriteNode *) createMiddleDropWater:(SKSpriteNode *)cloud;
+ (SKSpriteNode *) createBigDropWater:(SKSpriteNode *)cloud;

@end
