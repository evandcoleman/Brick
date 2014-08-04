//
//  BRGameScene.m
//  Brick
//
//  Created by Evan Coleman on 8/2/14.
//  Copyright (c) 2014 Evan Coleman. All rights reserved.
//

#import "BRGameScene.h"

#import "BRPaddleNode.h"
#import "BRBallNode.h"
#import "BRBrickNode.h"

typedef NS_ENUM(NSUInteger, BRGameNodeType) {
    BRGameNodeTypePaddle,
    BRGameNodeTypeBall,
    BRGameNodeTypeBrick,
};

@interface BRGameScene () <SKPhysicsContactDelegate>

@property (nonatomic) BRPaddleNode *paddle;
@property (nonatomic) BRBallNode *ball;

@property (nonatomic) BOOL draggingPaddle;

@end

@implementation BRGameScene

- (instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self != nil) {
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        self.physicsBody.friction = 0.0;
        self.physicsWorld.contactDelegate = self;
        
        _paddle = [[BRPaddleNode alloc] init];
        _paddle.physicsBody.contactTestBitMask = BRGameNodeTypePaddle;
        _paddle.position = CGPointMake(CGRectGetMidX(self.frame) - (CGRectGetWidth(_paddle.frame) / 2), 60);
        [self addChild:_paddle];
        
        _ball = [[BRBallNode alloc] init];
        _ball.physicsBody.contactTestBitMask = BRGameNodeTypeBall;
        _ball.position = CGPointMake(CGRectGetWidth(self.frame) / 3, CGRectGetHeight(self.frame) / 3);
        [self addChild:_ball];
    }
    return self;
}

#pragma mark Touch Events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    SKPhysicsBody *body = [self.physicsWorld bodyAtPoint:touchLocation];
    if (body == self.paddle.physicsBody) {
        self.draggingPaddle = YES;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.draggingPaddle) {
        UITouch *touch = [touches anyObject];
        CGPoint touchLocation = [touch locationInNode:self];
        CGPoint previousLocation = [touch previousLocationInNode:self];
        int paddleX = self.paddle.position.x + (touchLocation.x - previousLocation.x);
        paddleX = MAX(paddleX, 0);
        paddleX = MIN(paddleX, CGRectGetWidth(self.frame) - CGRectGetWidth(self.paddle.frame));
        self.paddle.position = CGPointMake(paddleX, self.paddle.position.y);
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.draggingPaddle = NO;
}

#pragma mark - SKPhysicsContactDelegate

- (void)didBeginContact:(SKPhysicsContact *)contact {
    NSLog(@"Contact!");
}

@end
