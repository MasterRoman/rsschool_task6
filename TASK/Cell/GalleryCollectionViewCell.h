//
//  GalleryCollectionViewCell.h
//  TASK
//
//  Created by Admin on 05.08.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface GalleryCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *previewImageView;
@property (assign, nonatomic) PHImageRequestID imageRequestID;
@property (copy, nonatomic) NSString *representedAssetIdentifier;

@end

NS_ASSUME_NONNULL_END
