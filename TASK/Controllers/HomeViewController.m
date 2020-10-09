//
//  HomeViewController.m
//  TASK
//
//  Created by Admin on 31.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+UIColor_RSSchool.h"
#import "FigureView.h"

@interface HomeViewController ()

@property (strong, nonatomic) IBOutlet UILabel *phoneName;
@property (strong, nonatomic) IBOutlet UILabel *phoneModel;
@property (strong, nonatomic) IBOutlet UILabel *phoneSystem;
@property (strong, nonatomic) IBOutlet UIButton *openGit;
@property (strong, nonatomic) IBOutlet UIButton *start;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *startHight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *openGitHight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *openGitTop;
@property (strong, nonatomic) IBOutlet FigureView *circuleView;
@property (strong, nonatomic) IBOutlet FigureView *rectangleView;
@property (strong, nonatomic) IBOutlet FigureView *triangleView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"RSSchool 6 task";
    
    self.openGit.layer.cornerRadius = 20.0;
    self.openGit.backgroundColor = [UIColor rsschoolYellowColor];
    
    self.start.layer.cornerRadius = 20.0;
    self.start.backgroundColor = [UIColor rsschoolRedColor];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
     if (screenSize.height < screenSize.width) {
           self.startHight.constant = 25.0;
           self.openGitHight.constant = 25.0;
           self.openGitTop.constant = 3.0;
         } else if (screenSize.height >= screenSize.width) {
             self.openGitTop.constant = 25;
             self.startHight.constant = 50.0;
             self.openGitHight.constant = 50.0;
             
         }
    UIDevice *device = [UIDevice new];
    
    self.phoneName.text = device.name;
    
    self.phoneModel.text = device.model;
    
    self.phoneSystem.text = [NSString stringWithFormat:@"%@ %@",device.systemName ,device.systemVersion ];

    [self.circuleView animate];
    [self.rectangleView animate];
    [self.triangleView animate];
}

- (IBAction)gitButtonDidTapped:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://masterroman.github.io/rsschool-cv/cv"] options:@{} completionHandler:nil];
}

- (IBAction)goToStartDidTapped:(UIButton *)sender {
    [self.navigationController.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    if (size.height < size.width) {
        self.startHight.constant = 25.0;
        self.openGitHight.constant = 25.0;
        self.openGitTop.constant = 3.0;
      } else if (size.height >= size.width) {
          self.openGitTop.constant = 25;
          self.startHight.constant = 50.0;
          self.openGitHight.constant = 50.0;
          
      }
}

@end
