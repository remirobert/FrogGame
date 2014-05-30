//
//  RRDrop.m
//  frogGame
//
//  Created by remi on 30/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRDrop.h"

@implementation RRDrop

+ (SKSpriteNode *) createBlueWaterDrop:(SKSpriteNode *)cloud {
    SKSpriteNode *drop = [[SKSpriteNode alloc] initWithImageNamed:@"blue_water_drop"];
    
    drop.position = CGPointMake((rand() % (int)cloud.size.width) +
                                (cloud.position.x - cloud.size.width / 2),
                                [UIScreen mainScreen].bounds.size.width);
    drop.size = CGSizeMake(drop.size.width / 2, drop.size.height / 2);
    drop.zPosition = 101;
    drop.name = @"waterdrop";
    return (drop);
}

+ (SKSpriteNode *) createRedWaterDrop:(SKSpriteNode *)cloud {
    SKSpriteNode *drop = [[SKSpriteNode alloc] initWithImageNamed:@"red_water_drop"];
    
    drop.position = CGPointMake((rand() % (int)cloud.size.width) +
                                (cloud.position.x - cloud.size.width / 2),
                                [UIScreen mainScreen].bounds.size.width);
    drop.size = CGSizeMake(drop.size.width / 2, drop.size.height / 2);
    drop.zPosition = 101;
    drop.name = @"reddrop";
    return (drop);
}

+ (SKSpriteNode *) createMiddleDropWater:(SKSpriteNode *)cloud {
    SKSpriteNode *drop = [[SKSpriteNode alloc] initWithImageNamed:@"blue_water_drop"];
    
    drop.position = CGPointMake((rand() % (int)cloud.size.width) +
                                (cloud.position.x - cloud.size.width / 2),
                                [UIScreen mainScreen].bounds.size.width);
    drop.size = CGSizeMake(drop.size.width - 10, drop.size.height - 10);
    drop.zPosition = 101;
    drop.name = @"waterdrop";
    return (drop);
}

+ (SKSpriteNode *) createBigDropWater:(SKSpriteNode *)cloud {
    SKSpriteNode *drop = [[SKSpriteNode alloc] initWithImageNamed:@"blue_water_drop"];
    
    drop.position = CGPointMake((rand() % (int)cloud.size.width) +
                                (cloud.position.x - cloud.size.width / 2),
                                [UIScreen mainScreen].bounds.size.width);
    drop.size = CGSizeMake(drop.size.width, drop.size.height);
    drop.zPosition = 101;
    drop.name = @"waterdrop";
    return (drop);
}

@end
