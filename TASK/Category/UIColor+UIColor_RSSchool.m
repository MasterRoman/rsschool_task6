//
//  UIColor+UIColor_RSSchool.m
//  TASK
//
//  Created by Admin on 29.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import "UIColor+UIColor_RSSchool.h"

@implementation UIColor (UIColor_RSSchool)

+ (UIColor *)colorWithHexString:(NSString *)hexString{
    NSString *colorStr = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    CGFloat alpha,green,red,blue;
    switch ([colorStr length]) {
        case 3:
            alpha = 1.0f;
            red = [self colorComponentFrom:colorStr start:0 length:1];
            green = [self colorComponentFrom:colorStr start:1 length:1];
            blue = [self colorComponentFrom:colorStr start:2 length:1];
            break;
            
            
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorStr start: 0 length: 1];
            red   = [self colorComponentFrom: colorStr start: 1 length: 1];
            green = [self colorComponentFrom: colorStr start: 2 length: 1];
            blue  = [self colorComponentFrom: colorStr start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorStr start: 0 length: 2];
            green = [self colorComponentFrom: colorStr start: 2 length: 2];
            blue  = [self colorComponentFrom: colorStr start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorStr start: 0 length: 2];
            red   = [self colorComponentFrom: colorStr start: 2 length: 2];
            green = [self colorComponentFrom: colorStr start: 4 length: 2];
            blue  = [self colorComponentFrom: colorStr start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    
   return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
    
}

+(UIColor *)rsschoolBlackColor {
    return [UIColor colorWithHexString:@"#101010"];
}

+(UIColor *)rsschoolWhiteColor {
    return [UIColor colorWithHexString:@"#FFFFFF"];
}

+(UIColor *)rsschoolRedColor {
    return [UIColor colorWithHexString:@"#EE686A"];
}

+(UIColor *)rsschoolBlueColor {
    return [UIColor colorWithHexString:@"#29C2D1"];
}

+(UIColor *)rsschoolGreenColor {
    return [UIColor colorWithHexString:@"#34C1A1"];
}

+(UIColor *)rsschoolYellowColor {
    return [UIColor colorWithHexString:@"#F9CC78"];
}

+(UIColor *)rsschoolGrayColor{
    return [UIColor colorWithHexString:@"#707070"];
}

+(UIColor *)rsschoolYellowHighlightedColor{
    return [UIColor colorWithHexString:@"#FDF4E3"];
}


@end
