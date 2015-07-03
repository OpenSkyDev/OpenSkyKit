/*!
 * UIColor+OpenSkyHelpers.h
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 7/2/15
 */

#ifndef OpenSkyKit_UIColor_OpenSkyHelpers_h
#define OpenSkyKit_UIColor_OpenSkyHelpers_h

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (OpenSkyHelpers)

- (UIColor *)contrastColor;

- (UIColor *)lighterColor;

- (UIColor *)darkerColor;

+ (UIColor *)hex:(NSInteger)hex;

+ (UIColor *)hex:(NSInteger)hex alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END

#endif
