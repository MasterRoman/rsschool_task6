//
//  FigureView.h
//  TASK
//
//  Created by Admin on 29.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,FigureType)
{
    FigureTypeCircle = 0,
    FigureTypeRectangle = 1,
    FigureTypeTriangle = 2
    
};

@interface FigureView : UIButton
@property (nonatomic) IBInspectable NSInteger type;


- (void)animate;


@end

NS_ASSUME_NONNULL_END
