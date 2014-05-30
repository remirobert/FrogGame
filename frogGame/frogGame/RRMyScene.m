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
#import "RRGameData.h"

@interface RRMyScene ()
@property (nonatomic, strong) NSMutableArray *clouds;
@property (nonatomic, strong) SKLabelNode *score;
@end

@implementation RRMyScene

- (void) initFrog {
    _frog = [[RRFrog alloc] init];
    
    [self addChild:_frog.node];
    [self addChild:_frog.collisionBox];
}

- (void) initGameData {
    [[RRGameData DefaultData] setScore:0];
    [[RRGameData DefaultData] setIsOver:NO];
}

- (void) displayScore {
    if (_score == nil) {
        _score = [[SKLabelNode alloc] init];
        _score.zPosition = 300;
        _score.position = CGPointMake([UIScreen mainScreen].bounds.size.height,
                                      [UIScreen mainScreen].bounds.size.width - 25);

        [_score setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeRight];
        [self addChild:_score];
    }
    _score.text = [NSString stringWithFormat:@"%d", [RRGameData DefaultData].score];
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
        
        [self initGameData];
        [self initFrog];
        [self initWave];
                
        _clouds = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    [self displayScore];
    [self updatePositionFrog];
    [self updatePositionWave];
    [self addCloud:currentTime withListClouds:_clouds];
    [self dropWaterDrop:currentTime :_clouds];
    [self collisionWaterDrop];
}

@end
