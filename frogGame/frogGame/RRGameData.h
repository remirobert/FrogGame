//
//  RRGameData.h
//  frogGame
//
//  Created by remi on 30/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RRGameData : NSObject

@property (nonatomic, assign) NSInteger score;

+ (RRGameData *) DefaultData;

@end
