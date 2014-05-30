//
//  RRMyScene+Collision.m
//  frogGame
//
//  Created by remi on 29/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRMyScene+Collision.h"
#import "RRMainMenu.h"
#import "RRGameData.h"

@implementation RRMyScene (Collision)

- (void) addPoint:(NSInteger)score {
    SKLabelNode *labelPoint = [[SKLabelNode alloc] init];
    
    [[RRGameData DefaultData] setScore:[RRGameData DefaultData].score + score];
    
    labelPoint.text = [NSString stringWithFormat:@"+%d", score];
    labelPoint.position = CGPointMake(self.frog.collisionBox.position.x,
                                      self.frog.collisionBox.position.y +
                                      self.frog.collisionBox.size.height / 2);
    
    labelPoint.fontSize = 20.0;
    labelPoint.zPosition = 80;
    [self addChild:labelPoint];
    
    SKAction *sequenceAction = [SKAction sequence:@[[SKAction moveToY:labelPoint.position.y + 30 duration:0.75]]];
    
    [labelPoint runAction:sequenceAction completion:^{
        [labelPoint removeFromParent];
    }];
}

- (void) testCollision:(NSInteger)score :(SKNode *)node {
    if ([node intersectsNode:self.frog.collisionBox] == YES) {
        [node removeFromParent];
        
        if ([self.frog.node actionForKey:@"drinkwater"] == nil)
            [self.frog.node runAction:[SKAction
                                       animateWithTextures:@[[SKTexture
                                                              textureWithImage:[UIImage
                                                                                imageNamed:@"drinking_water"]]] timePerFrame:0.1 resize:NO restore:YES] withKey:@"drinkwater"];
        [self addPoint:score];
    }
}

- (void) collisionWaterDrop {
    [self enumerateChildNodesWithName:@"waterdrop" usingBlock:^(SKNode *node, BOOL *stop) {
        [self testCollision:10 :node];
    }];
    
    [self enumerateChildNodesWithName:@"waterdropmiddle" usingBlock:^(SKNode *node, BOOL *stop) {
        [self testCollision:20 :node];
    }];
    
    [self enumerateChildNodesWithName:@"waterdropbig" usingBlock:^(SKNode *node, BOOL *stop) {
        [self testCollision:30 :node];
    }];

    [self enumerateChildNodesWithName:@"reddrop" usingBlock:^(SKNode *node, BOOL *stop) {
        
        if ([node intersectsNode:self.frog.collisionBox] == YES) {
            [node removeFromParent];
            self.speed = 0.0;
            
            [[RRGameData DefaultData] setIsOver:YES];
            
            RRMainMenu *menu = [[RRMainMenu alloc] initWithSize:self.size];
            [self.view presentScene:menu transition:[SKTransition fadeWithDuration:1.0]];
        }
    }];
}

@end
