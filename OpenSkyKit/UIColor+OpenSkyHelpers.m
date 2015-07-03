/*!
 * UIColor+OpenSkyHelpers.m
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 7/2/15
 */

#import "UIColor+OpenSkyHelpers.h"

@implementation UIColor (OpenSkyHelpers)

- (UIColor *)contrastColor {
    CGFloat r, g, b;
    if (![self getRed:&r green:&g blue:&b alpha:NULL]) {
        return [UIColor blackColor];
    }

    r = r * 255.0;
    g = g * 255.0;
    b = b * 255.0;

    // The human eye prefers green then red then blue.
    CGFloat offset = 1.0 - (((0.299 * r) + (0.587 * g) + (0.114 * b)) / 255.0);

    if (offset < 0.5) {
        return [UIColor blackColor];
    }
    return [UIColor whiteColor];
}

- (UIColor *)lighterColor {
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
        return [UIColor colorWithHue:h saturation:s brightness:MIN(b * 1.3, 1.0) alpha:a];
    }
    return [self copy];
}

- (UIColor *)darkerColor {
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
        return [UIColor colorWithHue:h saturation:s brightness:b * 0.75 alpha:a];
    }
    return [self copy];
}

+ (UIColor *)hex:(NSInteger)hex {
    return [self hex:hex alpha:1.0];
}

+ (UIColor *)hex:(NSInteger)hex alpha:(CGFloat)alpha {
    return [[self alloc] initWithRed:(((hex >> 16) & 0xFF) / 255.0) green:(((hex >> 8) & 0xFF) / 255.0) blue:((hex & 0xFF) / 255.0) alpha:alpha];
}

@end
