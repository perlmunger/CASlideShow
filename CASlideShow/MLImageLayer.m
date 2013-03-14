//
//  MLImageLayer.m
//  CASlideShow
//
//  Created by Matt Long on 3/14/13.
//  Copyright (c) 2013 Matt Long. All rights reserved.
//

#import "MLImageLayer.h"

@implementation MLImageLayer

- (id)initWithLayer:(id)layer
{
	if(self = [super initWithLayer:layer]) {
		if([layer isKindOfClass:[MLImageLayer class]]) {
			MLImageLayer *other = (MLImageLayer*)layer;
      [self setCounter:[other counter]];
		}
	}
	return self;
}

+ (BOOL)needsDisplayForKey:(NSString*)key
{
  if ([key isEqualToString:@"counter"]) {
    return YES;
  } else {
    return [super needsDisplayForKey:key];
  }
}

- (void)drawInContext:(CGContextRef)ctx
{
  DLog(@"Counter is: %d", _counter);
}

@end
