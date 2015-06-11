/*!
 * OSKHelpers.m
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 5/9/15
 */

#import "OSKHelpers.h"

void OSKPrintError(NSError *error) {
    OSKPrintErrorMessage(error, @"");
}
void OSKPrintErrorMessage(NSError *error, NSString *fmt, ...) {
    if (!error) {
        return;
    }
    
    NSMutableString *final = [@"[**ERROR**] - " mutableCopy];
    if (fmt.length > 0) {
        va_list args;
        va_start(args, fmt);
        [final appendString:[[NSString alloc] initWithFormat:fmt arguments:args]];
        [final appendString:@" - "];
    }

    [final appendString:[error description]];

    NSLog(@"%@",[final copy]);
}
