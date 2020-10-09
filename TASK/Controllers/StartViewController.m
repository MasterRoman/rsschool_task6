//
//  StartViewController.m
//  TASK
//
//  Created by Admin on 29.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import "StartViewController.h"
#import "UIColor+UIColor_RSSchool.h"
#import "FigureView.h"
#import "RootTabBarViewController.h"
#import <Photos/Photos.h>

@interface StartViewController ()
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet FigureView *circleView;
@property (strong, nonatomic) IBOutlet FigureView *rectangleView;
@property (strong, nonatomic) IBOutlet FigureView *triangleView;


@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startButton.backgroundColor = [UIColor rsschoolYellowColor];
    self.startButton.layer.cornerRadius = 10.0;
    
    
   
}

- (void)viewDidAppear:(BOOL)animated{
        [self.circleView animate];
        [self.rectangleView animate];
        [self.triangleView animate];
}


- (IBAction)buttonDidTapped:(UIButton *)sender {

     RootTabBarViewController *rootVC = [RootTabBarViewController new];

    [self.navigationController pushViewController:rootVC animated:YES];


 
}
            


@end
