//
//  FigureView.m
//  TASK
//
//  Created by Admin on 29.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import "FigureView.h"
#import "UIColor+UIColor_RSSchool.h"

IB_DESIGNABLE
@implementation FigureView

- (void)drawRect:(CGRect)rect{
    switch (self.type) {
        case FigureTypeCircle:
            [self drawCircle:rect];
            break;
            
        case FigureTypeRectangle:
            [self drawRectangle:rect];
            break;
        case FigureTypeTriangle:
            [self drawTriangle:rect];
            break;
    }
}

- (void)drawCircle:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor rsschoolRedColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(0, 0, rect.size.width,rect.size.height));
    
}

- (void)drawRectangle:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor rsschoolBlueColor].CGColor);
    CGContextFillRect(context, rect);
    
}


- (void)drawTriangle:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor rsschoolGreenColor].CGColor);
    
    CGContextMoveToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width / 2, 0);
    CGContextAddLineToPoint(context, 0, rect.size.height);
    CGContextFillPath(context);
}



- (void)animate{
    if (self.type == FigureTypeCircle){
        [UIView animateWithDuration:1.0 delay:0 options:(UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat) animations:^{
            [self setTransform: CGAffineTransformMakeScale(1.2,1.2)];
            
        }completion:^(BOOL finished){
            if (finished){
                [self setTransform: CGAffineTransformMakeScale(1, 1)];
                [self animate];
            }
            
        }];
         
    } else if (self.type == FigureTypeRectangle) {
            [UIView animateWithDuration:1.0 delay:0 options:(UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat) animations:^{
                [self setTransform:CGAffineTransformMakeTranslation(0, 10)];
                
            }completion:^(BOOL finished){
                if (finished){
                    [self setTransform: CGAffineTransformMakeTranslation(0, 0)];
                    [self animate];
                }
                
            }];
        }else
             if (self.type == FigureTypeTriangle){
                [UIView animateWithDuration:1.0 delay:0 options:(UIViewAnimationOptionCurveLinear) animations:^{
                    [self setTransform:CGAffineTransformRotate(self.transform, M_PI_2)];
                    
                }completion:^(BOOL finished){
                    if (finished){
                        [self animate];
                    }
                    
                }];
                
            
        }
    
}

@end
