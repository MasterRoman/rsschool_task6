//
//  UIColor+UIColor_RSSchool.h
//  TASK
//
//  Created by Admin on 29.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (UIColor_RSSchool)

+(UIColor *)rsschoolBlackColor;
+(UIColor *)rsschoolWhiteColor;
+(UIColor *)rsschoolRedColor;
+(UIColor *)rsschoolBlueColor;
+(UIColor *)rsschoolGreenColor;
+(UIColor *)rsschoolYellowColor;
+(UIColor *)rsschoolGrayColor;
+(UIColor *)rsschoolYellowHighlightedColor;

+ (UIColor *)colorWithHexString:(NSString *) hexString;

@end

NS_ASSUME_NONNULL_END
