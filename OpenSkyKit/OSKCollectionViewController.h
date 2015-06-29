/*!
 * OSKCollectionViewController.h
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 6/28/15
 */

#ifndef OpenSkyKit_OSKCollectionViewController_h
#define OpenSkyKit_OSKCollectionViewController_h

#import <OpenSkyKit/OSKViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSKCollectionViewController : OSKViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak, null_resettable) UICollectionView *collectionView;

@end

@interface OSKCollectionViewController (SubclassingHooks)

- (UICollectionViewLayout *)newCollectionViewLayout;

- (void)addConstraintsForCollectionView:(UICollectionView *)collectionView;
- (void)finalizeCollectionViewSetup:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END

#endif
