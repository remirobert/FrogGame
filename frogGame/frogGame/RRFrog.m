//
//  RRFrog.m
//  frogGame
//
//  Created by remi on 24/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRFrog.h"

@implementation RRFrog

- (void) initCollisionBox {
    _collisionBox = [[SKSpriteNode alloc] initWithColor:[SKColor redColor]
                                                   size:CGSizeMake(_node.size.width / 2 - 20,
                                                                   _node.size.height / 2)];
    _collisionBox.zPosition = 0;
}

- (void) updatePositionCollisionMask {
    _collisionBox.position = CGPointMake(_node.position.x + 10, _node.position.y + _collisionBox.size.height / 2);
}

- (void) initNode {
    _node = [[SKSpriteNode alloc]
             initWithTexture:[SKTexture
                              textureWithImage:[UIImage imageNamed:@"frog"]]];

    _node.size = CGSizeMake(_node.size.width / 5 + 10,
                            _node.size.height / 5 + 10);
    _node.zPosition = 100;
    _node.name = @"frog";
}

- (instancetype) init {
    self = [super init];
    if (self != nil) {
        [self initNode];
        [self initCollisionBox];
    }
    return (self);
}

@end
