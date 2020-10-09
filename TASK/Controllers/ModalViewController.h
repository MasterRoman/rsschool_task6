//
//  UIColor+UIColor_RSSchool.m
//  TASK
//
//  Created by Admin on 29.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModalViewController : UIViewController

@property (strong, nonatomic) PHAsset *asset;

- (instancetype)initWithAsset:(PHAsset *)asset;

@end

NS_ASSUME_NONNULL_END
