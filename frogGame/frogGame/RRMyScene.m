//
//  RRMyScene.m
//  frogGame
//
//  Created by remi on 24/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRMyScene.h"
#import "RRMyScene+Wave.h"
#import "RRMyScene+Control.h"
#import "RRMyScene+Cloud.h"
#import "RRMyScene+Collision.h"
#import "RRSeaGull.h"

@interface RRMyScene ()
@property (nonatomic, strong) NSMutableArray *clouds;
@end

@implementation RRMyScene

- (void) initFrog {
    _frog = [[RRFrog alloc] init];
    
    [self addChild:_frog.node];
    [self addChild:_frog.collisionBox];
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
        
        [self initFrog];
        [self initWave];
                
        _clouds = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    [self updatePositionFrog];
    [self updatePositionWave];
    [self addCloud:currentTime withListClouds:_clouds];
    [self dropWaterDrop:currentTime :_clouds];
    [self collisionWaterDrop];
}

@end
