//
//  MLViewController.m
//  CASlideShow
//
//  Created by Matt Long on 3/14/13.
//  Copyright (c) 2013 Matt Long. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController () {	CAKeyframeAnimation *slideShowAnimation, *counterAnimation;	CAAnimationGroup *group;}
@end

@implementation MLViewController

- (void)viewDidLoad	{	[super viewDidLoad];

	self.view.layer.sublayers						= @[_animationLayer = MLImageLayer.new];
	_animationLayer.frame								= self.view.bounds;

	group																= CAAnimationGroup.animation;
	group.animations = @[
		slideShowAnimation								= [CAKeyframeAnimation animationWithKeyPath:@"image"],
		counterAnimation									= [CAKeyframeAnimation animationWithKeyPath:@"counter"]
	];
	slideShowAnimation.duration					= counterAnimation.duration					= group.duration		= 10.0;
	slideShowAnimation.repeatCount			= counterAnimation.repeatCount			= group.repeatCount = HUGE_VALF;

	_animationLayer.image  = [UIImage imageNamed:@"Countryside.jpg"  ].CGImage;

  counterAnimation.values							= @[@0, @1, @2, @3, @4, @5];
	slideShowAnimation.values						= @[

		(id)[UIImage imageNamed:@"Countryside.jpg"  ].CGImage,
		(id)[UIImage imageNamed:@"Countryside-1.jpg"].CGImage,
		(id)[UIImage imageNamed:@"Countryside-2.jpg"].CGImage,
		(id)[UIImage imageNamed:@"Countryside-3.jpg"].CGImage,
		(id)[UIImage imageNamed:@"Countryside-4.jpg"].CGImage,
		(id)[UIImage imageNamed:@"Countryside-5.jpg"].CGImage ];

  [_animationLayer addAnimation:group forKey:nil];
}

@end
