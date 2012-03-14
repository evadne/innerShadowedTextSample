//
//  ISTSAppDelegate.m
//  innerShadowedTextSample
//
//  Created by Evadne Wu on 3/15/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "ISTSAppDelegate.h"
#import "ISTSLabel.h"

@implementation ISTSAppDelegate

@synthesize window = _window;

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	
	ISTSLabel *label = [[ISTSLabel alloc] initWithFrame:CGRectZero];
	label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin;
	
	label.text = @"Lorem";
	label.font = [UIFont boldSystemFontOfSize:48.0f];
	label.textInnerShadowSize = (CGSize){ 0, 2 };
	label.textInnerShadowSpread = 2;
	label.textInnerShadowColor = [UIColor blackColor];
	
	label.textColor = [[UIColor purpleColor] colorWithAlphaComponent:0.5];
	
	[label sizeToFit];
	[self.window addSubview:label];
	
	label.center = (CGPoint){
		CGRectGetMidX(self.window.bounds),
		CGRectGetMidY(self.window.bounds)
	};
	
	label.frame = CGRectIntegral(label.frame);
	
	return YES;
	
}

@end
