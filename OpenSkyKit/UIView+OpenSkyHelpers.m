/*!
 * UIView+OpenSkyHelpers.m
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 5/9/15
 */

#import "UIView+OpenSkyHelpers.h"

@implementation UIView (OpenSkyHelpers)

+ (instancetype)createAutoLayoutView {
    UIView *view = [[self alloc] initWithFrame:CGRectZero];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

@end
