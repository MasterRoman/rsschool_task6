//
//  infoTableViewCell.m
//  TASK
//
//  Created by Admin on 02.08.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import "infoTableViewCell.h"
#import "UIColor+UIColor_RSSchool.h"

@interface infoTableViewCell ()




@end

@implementation infoTableViewCell

@synthesize imageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    UIView *backgroundView = [UIView new];
    [backgroundView setBackgroundColor:[UIColor rsschoolYellowHighlightedColor]];
    
    [self setSelectedBackgroundView:backgroundView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setCellStyle:(InfoTableViewCellStyle)style{
    switch (style) {
         case InfoTableViewCellStyleAudio:
               [self.iconView setImage:[UIImage imageNamed:@"audio"]];
               break;
         case InfoTableViewCellStyleVideo:
               [self.iconView setImage:[UIImage imageNamed:@"video"]];
               break;
        case InfoTableViewCellStylePhoto:
               [self.iconView setImage:[UIImage imageNamed:@"image"]];
               break;
        case InfoTableViewCellStyleOther:
               [self.iconView setImage:[UIImage imageNamed:@"other"]];
               break;
           }
}

+ (NSString *)reuseId{
    return @"infoTableViewCell";
}

- (void)setDescriptionText:(NSString *)text{
    [self.discriptionLabel setText:text];
}

- (void)setImageLabel:(UIImage *)image{
    [self.imageView setImage:image];
}

- (void)setFileName:(NSString *)name{
    [self.titleLabel setText:name];
}

@end
