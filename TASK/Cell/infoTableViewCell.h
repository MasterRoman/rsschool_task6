//
//  infoTableViewCell.h
//  TASK
//
//  Created by Admin on 02.08.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photos/Photos.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, InfoTableViewCellStyle) {
    InfoTableViewCellStyleAudio,
    InfoTableViewCellStyleVideo,
    InfoTableViewCellStylePhoto,
    InfoTableViewCellStyleOther
};

@interface infoTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *discriptionLabel;
@property (assign, nonatomic) PHImageRequestID imageRequestID;
@property (assign, nonatomic) PHContentEditingInputRequestID contentRequestID;
@property (copy, nonatomic) NSString *representedAssetIdentifier;


+ (NSString*)reuseId;

- (void)setCellStyle:(InfoTableViewCellStyle)style;
- (void)setFileName:(NSString*)name;
- (void)setImageLabel:(UIImage*)image;
- (void)setDescriptionText:(NSString*)text;

@end

NS_ASSUME_NONNULL_END
