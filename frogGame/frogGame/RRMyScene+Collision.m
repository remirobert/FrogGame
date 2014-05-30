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

- (void) addPoint {
    SKLabelNode *labelPoint = [[SKLabelNode alloc] init];
    
    labelPoint.text = @"+10";
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

- (void) collisionWaterDrop {
    [self enumerateChildNodesWithName:@"waterdrop" usingBlock:^(SKNode *node, BOOL *stop) {
        
        if ([node intersectsNode:self.frog.collisionBox] == YES) {
            [node removeFromParent];
            
            [RRGameData DefaultData].score += 1;
            [self addPoint];
            
            if ([self.frog.node actionForKey:@"drinkwater"] == nil)
                [self.frog.node runAction:[SKAction
                                           animateWithTextures:@[[SKTexture
                                                                  textureWithImage:[UIImage
                                                                                    imageNamed:@"drinking_water"]]] timePerFrame:0.1 resize:NO restore:YES] withKey:@"drinkwater"];
        }
    }];
    
    [self enumerateChildNodesWithName:@"reddrop" usingBlock:^(SKNode *node, BOOL *stop) {
        
        if ([node intersectsNode:self.frog.collisionBox] == YES) {
            [node removeFromParent];
            self.speed = 0.0;
            
            NSLog(@"score = %ld", (long)[RRGameData DefaultData].score);
            [RRGameData DefaultData].isOver = YES;
            
            RRMainMenu *menu = [[RRMainMenu alloc] initWithSize:self.size];
            [self.view presentScene:menu transition:[SKTransition fadeWithDuration:1.0]];
        }
    }];
}

@end
