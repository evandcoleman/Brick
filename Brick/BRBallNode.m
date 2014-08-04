//
//  BRBallNode.m
//  Brick
//
//  Created by Evan Coleman on 8/2/14.
//  Copyright (c) 2014 Evan Coleman. All rights reserved.
//

#import "BRBallNode.h"

@implementation BRBallNode

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 30, 30)];
        self.path = path.CGPath;
        
        self.fillColor = [UIColor blueColor];
        self.lineWidth = 0.0;
        
        self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:15];
        self.physicsBody.restitution = 1.0;
        self.physicsBody.friction = 0.0;
        self.physicsBody.linearDamping = 0.0;
        self.physicsBody.allowsRotation = NO;
    }
    return self;
}

@end
