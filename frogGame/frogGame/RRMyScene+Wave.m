//
//  RRMyScene+Wave.m
//  frogGame
//
//  Created by remi on 24/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRMyScene+Wave.h"

@implementation RRMyScene (Wave)

- (void) initBackgroundwave {
    self.waveBackground = [[SKSpriteNode alloc]
                           initWithTexture:[SKTexture
                                            textureWithImage:[UIImage imageNamed:@"waveBackground"]]];
    self.waveBackground.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2,
                                               self.wave.size.height / 4);
    self.waveBackground.zPosition = 20;
    self.waveBackground.name = @"wave_background";
}

- (void) initWave {
    self.wave = [[SKSpriteNode alloc]
                 initWithTexture:[SKTexture textureWithImage:[UIImage imageNamed:@"wave"]]];
    self.wave.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2,
                                     self.wave.size.height / 4);
    self.frog.node.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2 + 10,
                                self.wave.size.height - 5);
    
    self.wave.zPosition = 150;
    self.wave.name = @"wave";
    
    [self initBackgroundwave];
    [self actionWaveShip];
    [self addChild:self.wave];
    [self addChild:self.waveBackground];
}

- (void) actionWaveShip {
    SKAction *moveLeft = [SKAction rotateToAngle:0.1 duration:1];
    SKAction *moveRigth = [SKAction rotateToAngle:-0.1 duration:1];
    SKAction *repeatMove = [SKAction
                            repeatActionForever:[SKAction
                                                 sequence:@[moveLeft, moveRigth]]];
    
    [self.frog.node runAction:repeatMove];
}

- (void) updatePositionWave {
    if (self.wave.position.x - (self.wave.size.width / 2) + 45 >= 0) {
        self.wave.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2,
                                         self.wave.size.height / 4);
    }
    if (self.waveBackground.position.x - (self.waveBackground.size.width / 2) + 45 >= 0) {
        self.waveBackground.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2,
                                                   self.wave.size.height / 4);
    }
    
    [self enumerateChildNodesWithName:@"wave" usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x + 0.25, node.position.y);
    }];
    
    [self enumerateChildNodesWithName:@"wave_background" usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x + 0.1, node.position.y);
    }];
}

@end
