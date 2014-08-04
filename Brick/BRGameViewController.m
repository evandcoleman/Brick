//
//  BRGameViewController.m
//  Brick
//
//  Created by Evan Coleman on 8/2/14.
//  Copyright (c) 2014 Evan Coleman. All rights reserved.
//

#import "BRGameViewController.h"

#import "BRGameScene.h"

@interface BRGameViewController ()

@end

@implementation BRGameViewController

- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self != nil) {
        
    }
    return self;
}

- (void)loadView {
    self.view = [[SKView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    BRGameScene *scene = [BRGameScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
}

@end
