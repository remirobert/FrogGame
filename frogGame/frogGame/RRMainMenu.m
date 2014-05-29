//
//  RRMainMenu.m
//  frogGame
//
//  Created by remi on 29/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRMainMenu.h"
#import "RRMyScene.h"

@implementation RRMainMenu

- (void) initButton {
    SKLabelNode *playButton = [[SKLabelNode alloc] init];
    
    playButton.position = CGPointMake([UIScreen mainScreen].bounds.size.height / 2,
                                      [UIScreen mainScreen].bounds.size.width / 2);
    playButton.text = @"PLAY";
    playButton.name = @"playbutton";
    playButton.zPosition = 50;
    [self addChild:playButton];
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        SKSpriteNode *bg = [[SKSpriteNode alloc]
                            initWithTexture:[SKTexture
                                             textureWithImage:[UIImage
                                                               imageNamed:@"bg"]]];
        
        bg.size = CGSizeMake(bg.size.width / 2, bg.size.height / 2);
        
        bg.zPosition = 10;
        bg.position = CGPointMake([UIScreen mainScreen].bounds.size.height / 2,
                                  [UIScreen mainScreen].bounds.size.width / 2);
        [self addChild:bg];
        [self initButton];
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:positionInScene];
    
    if ([touchedNode.name isEqualToString:@"playbutton"]) {
        RRMyScene *scene = [[RRMyScene alloc] initWithSize:self.size];
        
        [self.view presentScene:scene transition:[SKTransition fadeWithDuration:1.0]];
    }
}

@end
