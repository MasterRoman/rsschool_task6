//
//  GalleryViewController.h
//  TASK
//
//  Created by Admin on 31.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface GalleryViewController : UIViewController

@property(nonatomic, strong) PHFetchResult *assetsFetchResults;
@property(nonatomic, strong) PHCachingImageManager *imageManager;


@end

NS_ASSUME_NONNULL_END
