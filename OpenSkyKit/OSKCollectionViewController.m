/*!
 * OSKCollectionViewController.m
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 6/28/15
 */

#import "OSKCollectionViewController.h"
#import "OSKCollectionViewCell.h"

@interface OSKCollectionViewController ()

@end

@implementation OSKCollectionViewController

- (UICollectionViewLayout *)newCollectionViewLayout {
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    return flow;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewLayout *layout = [self newCollectionViewLayout];
        NSAssert(layout, @"newCollectionViewLayout Must not return nil");
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;

        [collectionView registerClass:[OSKCollectionViewCell class] forCellWithReuseIdentifier:kOSKCollectionViewCellIdentifier];

        _collectionView = collectionView;
        [self.view addSubview:collectionView];

        [self addConstraintsForCollectionView:collectionView];
        [self finalizeCollectionViewSetup:collectionView];
    }
    return _collectionView;
}

- (void)finalizeCollectionViewSetup:(UICollectionView *)collectionView {

}

- (void)addConstraintsForCollectionView:(UICollectionView *)collectionView {
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
}

// MARK: - Collection View
- (NSInteger)numberOfSectionsInCollectionView:(nonnull UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}
- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    OSKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kOSKCollectionViewCellIdentifier forIndexPath:indexPath];

    return cell;
}

@end
