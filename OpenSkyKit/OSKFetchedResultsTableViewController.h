/*!
 * OSKFetchedResultsTableViewController.h
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 5/5/15
 */

#ifndef OpenSkyKit_OSKFetchedResultsTableViewController_h
#define OpenSkyKit_OSKFetchedResultsTableViewController_h

@import Foundation;
@import UIKit;
@import CoreData;

#import "OSKTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSKFetchedResultsTableViewController : OSKTableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong, null_resettable) NSFetchedResultsController *fetchController;

@end

@interface OSKFetchedResultsTableViewController (SubclassHooks)

- (NSFetchRequest *)createFetchRequest;

- (void)configureTableViewCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath;

- (NSManagedObjectContext *)fetchedResultsManagedObjectContext;
- (nullable NSString *)fetchedResultsSectionNameKeyPath;
- (nullable NSString *)fetchedResultsCacheName;

- (void)fetchedResultsController:(NSFetchedResultsController *)controller failedToPerformFetch:(nullable NSError *)error;

@end

NS_ASSUME_NONNULL_END

#endif
