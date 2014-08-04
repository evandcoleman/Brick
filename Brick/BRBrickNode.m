//
//  BRBrickNode.m
//  Brick
//
//  Created by Evan Coleman on 8/2/14.
//  Copyright (c) 2014 Evan Coleman. All rights reserved.
//

#import "BRBrickNode.h"

@implementation BRBrickNode

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 40, 16)];
        self.path = path.CGPath;
        
        self.fillColor = [UIColor redColor];
        self.lineWidth = 0.0;
        
        self.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:self.path];
        self.physicsBody.affectedByGravity = NO;
    }
    return self;
}

@end
