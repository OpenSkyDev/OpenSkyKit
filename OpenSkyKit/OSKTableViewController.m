/*!
 * OSKTableViewController.m
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 5/5/15
 */

#import "OSKTableViewController.h"
#import "OSKTableViewCell.h"

@interface OSKTableViewController ()

@property (nonatomic, assign) UITableViewStyle tableViewStyle;

@end

@implementation OSKTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.tableViewStyle = UITableViewStylePlain;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

// MARK: - Lazy Loaders
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        tableView.translatesAutoresizingMaskIntoConstraints = NO;
        tableView.dataSource = self;
        tableView.delegate = self;

        _tableView = tableView;
        [self.view addSubview:tableView];

        [self installTableViewConstraints:tableView];
        [self configureTableView:tableView];
    }
    return _tableView;
}
- (void)installTableViewConstraints:(UITableView *)tableView {
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
}
- (void)configureTableView:(UITableView *)tableView {
    [tableView registerClass:[OSKTableViewCell class] forCellReuseIdentifier:OSKTableViewCellIdentifier];
}

// MARK: - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [OSKTableViewCell heightForCellAtIndexPath:indexPath];
}

@end
