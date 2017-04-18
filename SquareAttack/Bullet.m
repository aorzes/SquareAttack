//
//  Bullet.m
//  SquareAttack
//
//  Created by Anton Orzes on 16/04/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "Bullet.h"

@interface Bullet()
{
    CGPoint startPosition;
    CGPoint d; //promjena po x,y
    float maxDistance;
    NSTimer *t;
    UIView *mainView;
}
@end
@implementation Bullet

- (id)initWithPosition:(CGPoint)position angle:(float)angle {
    self = [super init];
    const float velocity = 7.0;
    maxDistance = 450;
    startPosition = position;
    angle -= M_PI/2;
    if (self) {
        d.x = cos(angle) * velocity;
        d.y = sin(angle) * velocity;
        self.frame = CGRectMake(position.x, position.y, 5, 5);
        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        t = [NSTimer scheduledTimerWithTimeInterval:0.05
                                             target:self
                                           selector:@selector(moveBullet)
                                           userInfo:nil
                                            repeats:YES];
    }
    return self;
}

- (void)moveBullet {
    CGPoint position = self.center;
    position.x += d.x;
    position.y += d.y;
    self.center = position;
    float distance = hypotf(position.x-startPosition.x,position.y-startPosition.y);
    if(distance>maxDistance) {
        [t invalidate];
        t = nil;
        [self removeFromSuperview];
    }
    
}

@end
