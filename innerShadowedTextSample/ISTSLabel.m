//
//  ISTSLabel.m
//  innerShadowedTextSample
//
//  Created by Evadne Wu on 3/15/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ISTSLabel.h"

@implementation ISTSLabel

@synthesize textInnerShadowSize, textInnerShadowSpread, textInnerShadowColor;

- (void) setTextInnerShadowSize:(CGSize)newTextInnerShadowSize {

	if (CGSizeEqualToSize(textInnerShadowSize, newTextInnerShadowSize))
		return;
	
	textInnerShadowSize = newTextInnerShadowSize;
	[self setNeedsDisplay];

}

- (void) setTextInnerShadowSpread:(CGFloat)newTextInnerShadowSpread {

	if (textInnerShadowSpread == newTextInnerShadowSpread)
		return;
	
	textInnerShadowSpread = newTextInnerShadowSpread;
	[self setNeedsDisplay];

}

- (void) setTextInnerShadowColor:(UIColor *)newTextInnerShadowColor {

	if (textInnerShadowColor == newTextInnerShadowColor)
		return;
	
	textInnerShadowColor = newTextInnerShadowColor;
	[self setNeedsDisplay];

}

- (void) drawRect:(CGRect)rect {

	if (!self.textInnerShadowColor) {
		[super drawRect:rect];
		return;
	}

	UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.window.screen.scale);
	CGContextRef textContext = UIGraphicsGetCurrentContext();
	CGContextConcatCTM(textContext, (CGAffineTransform){ 1, 0, 0, -1, 0, CGRectGetHeight(rect) });
	[super drawTextInRect:rect];
  CGImageRef textImage = UIGraphicsGetImageFromCurrentImageContext().CGImage;	//	With alpha channel
	UIGraphicsEndImageContext();
	
	UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.window.screen.scale);
	CGContextRef invertedTextContext = UIGraphicsGetCurrentContext();
	CGContextConcatCTM(invertedTextContext, (CGAffineTransform){ 1, 0, 0, -1, 0, CGRectGetHeight(rect) });
	CGContextSetFillColorWithColor(invertedTextContext, [UIColor blackColor].CGColor);
	CGContextFillRect(invertedTextContext, rect);
	CGContextSetBlendMode(invertedTextContext, kCGBlendModeSourceOut);	//	R = S*(1 - Da)
	[super drawTextInRect:rect];
  CGImageRef invertedTextMask = UIGraphicsGetImageFromCurrentImageContext().CGImage;
	UIGraphicsEndImageContext();
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextDrawImage(context, rect, textImage);
	
	CGContextSaveGState(context);
	CGContextClipToMask(context, rect, textImage);
	CGContextSetShadowWithColor(context, self.textInnerShadowSize, self.textInnerShadowSpread, self.textInnerShadowColor.CGColor);
	CGContextDrawImage(context, rect, invertedTextMask);
	CGContextRestoreGState(context);
	
}

@end
