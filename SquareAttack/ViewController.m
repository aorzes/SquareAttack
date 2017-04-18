//
//  ViewController.m
//  SquareAttack
//
//  Created by Anton Orzes on 16/04/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "ViewController.h"
#import "Gun.h"

@interface ViewController (){
Gun *gun;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    gun = [[Gun alloc]initWithPosition:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height-50, 5, 45)];
    [self.view addSubview:gun];
    UIView *pp = [[UIView alloc]initWithFrame:CGRectMake(gun.frame.origin.x, gun.frame.origin.y+gun.frame.size.height, 2, 2)];
    pp.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0 alpha:1.0];
    [self.view addSubview:pp];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [gun shoot];

}

@end
