/*!
 * OSKViewController.m
 * OpenSkyKit
 *
 * Copyright (c) 2015 OpenSky, LLC
 *
 * Created by Skylar Schipper on 5/5/15
 */

#import "OSKViewController.h"

@interface OSKViewController ()

@end

@implementation OSKViewController

- (void)loadView {
    UIView *view = [[[self.class viewClass] alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.view = view;
}

// MARK: - Subclass
+ (Class)viewClass {
    return [UIView class];
}

@end
