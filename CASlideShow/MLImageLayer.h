//
//  MLImageLayer.h
//  CASlideShow
//
//  Created by Matt Long on 3/14/13.
//  Copyright (c) 2013 Matt Long. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface MLImageLayer : CALayer

@property NSInteger counter, previousCount;
@property CGImageRef image;
@end
