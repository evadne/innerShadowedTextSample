//
//  ISTSLabel.h
//  innerShadowedTextSample
//
//  Created by Evadne Wu on 3/15/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ISTSLabel : UILabel

@property (nonatomic, readwrite, assign) CGSize textInnerShadowSize;
@property (nonatomic, readwrite, assign) CGFloat textInnerShadowSpread;
@property (nonatomic, readwrite, retain) UIColor *textInnerShadowColor;

@end
