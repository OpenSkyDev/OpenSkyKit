/*!
 * OSKTableViewController.h
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 5/5/15
 */

#ifndef OpenSkyKit_OSKTableViewController_h
#define OpenSkyKit_OSKTableViewController_h

@import UIKit;

#import "OSKViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSKTableViewController : OSKViewController <UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithStyle:(UITableViewStyle)style;

@property (nonatomic, weak, null_resettable) UITableView *tableView;

@end

@interface OSKTableViewController (SubclassHooks)

- (void)installTableViewConstraints:(UITableView *)tableView;
- (void)configureTableView:(UITableView *)tableView NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END

#endif
