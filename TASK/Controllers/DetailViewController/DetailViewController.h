//
//  UIColor+UIColor_RSSchool.m
//  TASK
//
//  Created by Admin on 29.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@class CustomButton;

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *creationDateTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *modificationDateTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *creationDateValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *modificationDateValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UIButton *shareButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;

@property (strong, nonatomic) PHAsset *asset;
@property (nonatomic, strong) PHCachingImageManager *imageManager;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil asset:(PHAsset *)asset;

@end

NS_ASSUME_NONNULL_END
