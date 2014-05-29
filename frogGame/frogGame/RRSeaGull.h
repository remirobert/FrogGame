//
//  RRSeaGull.h
//  frogGame
//
//  Created by remi on 26/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface RRSeaGull : NSObject

@property (nonatomic, strong) SKSpriteNode *node;

- (instancetype) init;
- (void) moveSeaGull;

@end
