//
//  MLImageLayer.h
//  CASlideShow
//
//  Created by Matt Long on 3/14/13.
//  Copyright (c) 2013 Matt Long. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class MLImageLayer;


@interface MLImageLayer : CALayer

@property (nonatomic, assign) NSInteger counter;
@property (nonatomic, assign) NSInteger previousCount;

@end
