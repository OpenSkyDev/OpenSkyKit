/*!
 * OSKTableViewSwitchCell.h
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 7/3/15
 */

#ifndef OpenSkyKit_OSKTableViewSwitchCell_h
#define OpenSkyKit_OSKTableViewSwitchCell_h

#import <OpenSkyKit/OSKTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^OSKTableViewSwitchCellChangeChandler)(OSKTableViewCell *, BOOL);
typedef void (^OSKTableViewSwitchConfigure)(UISwitch *);

@interface OSKTableViewSwitchCell : OSKTableViewCell

@property (nonatomic, copy, nullable) OSKTableViewSwitchCellChangeChandler handler;

@property (nonatomic, assign, getter=isOn) BOOL on;
- (void)setOn:(BOOL)on animated:(BOOL)flag;

- (void)configureSwitch:(OSKTableViewSwitchConfigure)config;

@end

FOUNDATION_EXTERN NSString *const OSKTableViewSwitchCellIdentifier;

NS_ASSUME_NONNULL_END

#endif
