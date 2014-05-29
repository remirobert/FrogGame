//
//  RRMyScene+Collision.m
//  frogGame
//
//  Created by remi on 29/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRMyScene+Collision.h"
#import "RRMainMenu.h"

@implementation RRMyScene (Collision)

- (void) collisionWaterDrop {
    [self enumerateChildNodesWithName:@"waterdrop" usingBlock:^(SKNode *node, BOOL *stop) {
        
        if ([node intersectsNode:self.frog.collisionBox] == YES) {
            [node removeFromParent];
            
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
            
            RRMainMenu *menu = [[RRMainMenu alloc] initWithSize:self.size];
            [self.view presentScene:menu transition:[SKTransition fadeWithDuration:1.0]];
        }
        
    }];
}

@end
