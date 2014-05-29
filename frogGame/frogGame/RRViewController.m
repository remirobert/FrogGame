//
//  RRViewController.m
//  frogGame
//
//  Created by remi on 24/05/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "RRViewController.h"
#import "RRMyScene.h"
#import "RRMainMenu.h"

@implementation RRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    srand(time(NULL));
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    
    RRMainMenu *menu = [RRMainMenu sceneWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.height,
                                                            [UIScreen mainScreen].bounds.size.width)];
    menu.scaleMode = SKSceneScaleModeAspectFill;
    
    [skView presentScene:menu];
    
//    SKScene * scene = [RRMyScene sceneWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.height,
//                                                          [UIScreen mainScreen].bounds.size.width)];
//    
//    scene.scaleMode = SKSceneScaleModeAspectFill;
//    
//    // Present the scene.
//    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
