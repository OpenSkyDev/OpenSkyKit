/*!
 * OSKTableViewSwitchCell.m
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 7/3/15
 */

#import "OSKTableViewSwitchCell.h"

@interface OSKTableViewSwitchCell ()

@property (nonatomic, weak) UISwitch *cellSwitch;

@end

@implementation OSKTableViewSwitchCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setOn:YES animated:NO];
    }
    return self;
}

// MARK: - Lazy Loader
- (UISwitch *)cellSwitch {
    if (!_cellSwitch) {
        UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectZero];

        [sw addTarget:self action:@selector(osk_switchValueChanged:) forControlEvents:UIControlEventTouchUpInside];

        self.accessoryView = sw;
        _cellSwitch = sw;
    }
    return _cellSwitch;
}

// MARK: - On
- (void)setOn:(BOOL)on {
    [self setOn:on animated:YES];
}
- (void)setOn:(BOOL)on animated:(BOOL)flag {
    self.cellSwitch.on = on;
}
- (BOOL)isOn {
    return [self.cellSwitch isOn];
}

// MARK: - Setup
- (void)osk_switchValueChanged:(id)sender {
    if (self.handler) {
        self.handler(self, [self isOn]);
    }
}

- (void)configureSwitch:(OSKTableViewSwitchConfigure)config {
    config(self.cellSwitch);
}

@end

NSString *const OSKTableViewSwitchCellIdentifier = @"OSKTableViewSwitchCellIdentifier";
