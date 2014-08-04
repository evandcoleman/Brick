//
//  BRPaddleNode.m
//  Brick
//
//  Created by Evan Coleman on 8/2/14.
//  Copyright (c) 2014 Evan Coleman. All rights reserved.
//

#import "BRPaddleNode.h"

@implementation BRPaddleNode

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 20)];
        self.path = path.CGPath;
        
        self.fillColor = [UIColor greenColor];
        self.lineWidth = 0.0;
        
        self.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:self.path];
        self.physicsBody.dynamic = NO;
        self.physicsBody.friction = 0.4;
        self.physicsBody.restitution = 0.1;
    }
    return self;
}

@end
