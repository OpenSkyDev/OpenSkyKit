/*!
 * OSKTableViewCell.m
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 5/6/15
 */

#import "OSKTableViewCell.h"

@interface OSKTableViewCell ()

@end

@implementation OSKTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureCell];
    }
    return self;
}

- (void)configureCell {
    
}

+ (CGFloat)heightForCellAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

@end

NSString *const OSKTableViewCellIdentifier = @"OSKTableViewCellIdentifier";
