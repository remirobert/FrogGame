//
//  RRFrog.h
//  frogGame
//
//  Created by remi on 24/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface RRFrog : NSObject

@property (nonatomic, strong) SKSpriteNode *node;
@property (nonatomic, strong) SKSpriteNode *collisionBox;

- (instancetype) init;
- (void) updatePositionCollisionMask;

@end
