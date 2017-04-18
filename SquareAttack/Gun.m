//
//  Gun.m
//  SquareAttack
//
//  Created by Anton Orzes on 16/04/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "Gun.h"
#import "Bullet.h"

@interface Gun()
{
    CGPoint startPosition;
    double angle; //
    double ad;
    NSTimer *t;

}
@end
@implementation Gun

- (id)initWithPosition:(CGRect)frame{
    self = [super init];
    if (self) {
        angle = 0;
        ad = 0.01;
        self.frame = frame;
        self.backgroundColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:1.0];
        self.layer.anchorPoint = CGPointMake(0.5, 1.0);
        t = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(moveGun)
                                           userInfo:nil
                                            repeats:YES];
    }
    return self;
}

- (void)moveGun {
    angle+=ad;
    self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, angle);
    if (angle>M_PI_2 || angle<-M_PI_2) {
        ad*=-1;
    }
}

- (void)shoot {
    UIView *mv = self.superview;
    double r = 40;
    double x = mv.frame.size.width/2 + cos(angle-M_PI_2)*r;
    double y = mv.frame.size.height-50 + sin(angle-M_PI_2)*r;
    Bullet *bullet = [[Bullet alloc]initWithPosition:CGPointMake(x, y) angle:angle];
    [mv addSubview:bullet];
}

@end
