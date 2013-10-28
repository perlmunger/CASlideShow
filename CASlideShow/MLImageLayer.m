//
//  MLImageLayer.m
//  CASlideShow
//
//  Created by Matt Long on 3/14/13.
//  Copyright (c) 2013 Matt Long. All rights reserved.
//

#import "MLImageLayer.h"

@implementation MLImageLayer

- (id)initWithLayer:(id)layer	{	return self = [super initWithLayer:layer] ?

	 [layer isKindOfClass:MLImageLayer.class] ? [self setCounter:[(MLImageLayer*)layer counter]] : nil,
																			 self : nil;
}
+ (BOOL)needsDisplayForKey:(NSString*)key {

	return [key isEqualToString:@"counter"] ?: [super needsDisplayForKey:key];
}
- (void)drawInContext:(CGContextRef)ctx		{ NSString *ctr = [NSString stringWithFormat:@"Counter is: %d", _counter]; DLog(@"%@",ctr);

    UIGraphicsPushContext(ctx); CGRect rect;

		[[UIImage imageWithCGImage:self.image] drawInRect:rect = CGRectInset(self.bounds, 100, 100)]; rect = CGRectOffset(rect, 30, 30);
		[[NSAttributedString.alloc initWithString:ctr
																	 attributes:@{NSForegroundColorAttributeName:UIColor.redColor,
																								NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter" size:48]}]
																  drawAtPoint:rect.origin];
		UIGraphicsPopContext();
}

@end
