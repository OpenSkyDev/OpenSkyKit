/*!
 * OSKTableViewCell.h
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 5/6/15
 */

#ifndef OpenSkyKit_OSKTableViewCell_h
#define OpenSkyKit_OSKTableViewCell_h

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface OSKTableViewCell : UITableViewCell

- (void)configureCell NS_REQUIRES_SUPER;

+ (CGFloat)heightForCellAtIndexPath:(NSIndexPath *)indexPath;

@end

UIKIT_EXTERN NSString *const OSKTableViewCellIdentifier;

NS_ASSUME_NONNULL_END

#endif
