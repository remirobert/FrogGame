//
//  RRSeaGull.m
//  frogGame
//
//  Created by remi on 26/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRSeaGull.h"

@implementation RRSeaGull

- (void) actionFlySeaGull {
    SKAction *animate = [SKAction animateWithTextures:@[[SKTexture textureWithImage:[UIImage imageNamed:@"seagull1"]],
                                                        [SKTexture textureWithImage:[UIImage imageNamed:@"seagull2"]],
                                                        [SKTexture textureWithImage:[UIImage imageNamed:@"seagull3"]]]
                                         timePerFrame:0.2];

    
    SKAction *moveUp = [SKAction moveToY:_node.position.y + 40 duration:1];
    SKAction *moveDown = [SKAction moveToY:_node.position.y - 40 duration:1];
    
    SKAction *repeatMove = [SKAction
                            repeatActionForever:[SKAction
                                                 sequence:@[moveUp, moveDown]]];
    
    [_node runAction:repeatMove];
    
    
    SKAction *repeatFly = [SKAction
                            repeatActionForever:[SKAction
                                                 sequence:@[animate]]];
    [_node runAction:repeatFly];
}

- (void) initSeaGull {
    _node = [[SKSpriteNode alloc] initWithTexture:[SKTexture textureWithImage:[UIImage imageNamed:@"seagull1"]]];
    
    _node.size = CGSizeMake(_node.size.width / 5, _node.size.height / 5);
    _node.position = CGPointMake(-_node.size.width,
                                 [UIScreen mainScreen].bounds.size.width / 2 - 20);
    _node.zPosition = 100.0;
    _node.name = @"seagull";
    
    [self actionFlySeaGull];
}

- (instancetype) init {
    self = [super init];
    
    if (self != nil) {
        [self initSeaGull];
    }
    return (self);
}

- (void) moveSeaGull {
    _node.position = CGPointMake(_node.position.x + 4, _node.position.y);
}

@end
