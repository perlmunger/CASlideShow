//
//  MLViewController.m
//  CASlideShow
//
//  Created by Matt Long on 3/14/13.
//  Copyright (c) 2013 Matt Long. All rights reserved.
//

#import "MLViewController.h"
#import "MLImageLayer.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  _animationLayer = [MLImageLayer layer];
  [_animationLayer setBounds:CGRectMake(0.0f, 0.0f, 400.0f, 320.0f)];
  [_animationLayer setPosition:[[self view] center]];
  
  UIImage *image = [UIImage imageNamed:@"Countryside.jpg"];
  [_animationLayer setContents:(__bridge id)[image CGImage]];
  
  [[[self view] layer] addSublayer:_animationLayer];
  
  CAKeyframeAnimation *slideShowAnimation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
  [slideShowAnimation setValues:@[(id)[[UIImage imageNamed:@"Countryside.jpg"] CGImage],
   (id)[[UIImage imageNamed:@"Countryside-1.jpg"] CGImage],
   (id)[[UIImage imageNamed:@"Countryside-2.jpg"] CGImage],
   (id)[[UIImage imageNamed:@"Countryside-3.jpg"] CGImage],
   (id)[[UIImage imageNamed:@"Countryside-4.jpg"] CGImage],
   (id)[[UIImage imageNamed:@"Countryside-5.jpg"] CGImage]]];
  
  [slideShowAnimation setDuration:5.0];
  [slideShowAnimation setDelegate:self];
  [slideShowAnimation setRepeatCount:HUGE_VALF];
  [slideShowAnimation setCalculationMode:kCAAnimationDiscrete];
  
  CAKeyframeAnimation *counterAnimation = [CAKeyframeAnimation animationWithKeyPath:@"counter"];
  [counterAnimation setDelegate:self];
  [counterAnimation setValues:@[@(0), @(1), @(2), @(3), @(4), @(5)]];
  [counterAnimation setDuration:5.0];
  [counterAnimation setRepeatCount:HUGE_VALF];
  [counterAnimation setCalculationMode:kCAAnimationDiscrete];
  
  CAAnimationGroup *group = [CAAnimationGroup animation];
  [group setDuration:5.0];
  [group setRepeatCount:HUGE_VALF];
  [group setAnimations:@[slideShowAnimation, counterAnimation]];
  
  [_animationLayer addAnimation:group forKey:nil];
}

@end
