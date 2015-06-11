/*!
 * OSKFetchedResultsTableViewController.m
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 5/5/15
 */

#import "OSKFetchedResultsTableViewController.h"
#import "OSKHelpers.h"

static NSString *const kOSKFetchedResultsTableViewControllerCellIdenfifier = @"$_CellIdentifier";

@interface OSKFetchedResultsTableViewController ()

@end

@implementation OSKFetchedResultsTableViewController

// MARK: - Lazy Loaders
- (NSFetchedResultsController *)fetchController {
    if (!_fetchController) {
        NSFetchRequest *fetch = [self createFetchRequest];
        NSAssert(fetch, @"-[%@ createFetchRequest] must return a non-nil fetch request.",NSStringFromClass(self.class));

        NSManagedObjectContext *context = [self fetchedResultsManagedObjectContext];
        NSAssert(fetch, @"-[%@ fetchedResultsManagedObjectContext] must return a non-nil context.",NSStringFromClass(self.class));

        NSFetchedResultsController *controller = [[NSFetchedResultsController alloc] initWithFetchRequest:fetch managedObjectContext:context sectionNameKeyPath:[self fetchedResultsSectionNameKeyPath] cacheName:[self fetchedResultsCacheName]];
        controller.delegate = self;

        NSError *error = nil;
        if (![controller performFetch:&error]) {
            [self fetchedResultsController:controller failedToPerformFetch:error];
            return nil;
        }

        _fetchController = controller;
    }
    return _fetchController;
}

// MARK: - Overrides
- (NSManagedObjectContext *)fetchedResultsManagedObjectContext {
    return nil;
}
- (NSFetchRequest *)createFetchRequest {
    return nil;
}
- (nullable NSString *)fetchedResultsSectionNameKeyPath {
    return nil;
}
- (nullable NSString *)fetchedResultsCacheName {
    return nil;
}
- (void)fetchedResultsController:(NSFetchedResultsController *)controller failedToPerformFetch:(NSError *)error {
    OSKPrintErrorMessage(error, @"Fetch Controller (%@) failed to perform fetch",controller);
}
- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath {
    return kOSKFetchedResultsTableViewControllerCellIdenfifier;
}

// MARK: - Config
- (void)configureTableView:(UITableView * __nonnull)tableView {
    [super configureTableView:tableView];

    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kOSKFetchedResultsTableViewControllerCellIdenfifier];
}
- (void)configureTableViewCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {

}

// MARK: - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchController sections] count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> info = [[self.fetchController sections] objectAtIndex:section];
    return [info numberOfObjects];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifierForIndexPath:indexPath] forIndexPath:indexPath];
    [self configureTableViewCell:cell atIndexPath:indexPath];
    return cell;
}

// MARK: - Fetched Controller Delegaet
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    if (type == NSFetchedResultsChangeInsert) {
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    if (type == NSFetchedResultsChangeDelete) {
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    if (type == NSFetchedResultsChangeUpdate) {
        [self configureTableViewCell:[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
    }
    if (type == NSFetchedResultsChangeMove) {
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    if (type == NSFetchedResultsChangeInsert) {
        [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
    }
    if (type == NSFetchedResultsChangeDelete) {
        [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
    }
}
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
