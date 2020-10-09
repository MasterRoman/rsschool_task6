//
//  RootTabBarViewController.m
//  TASK
//
//  Created by Admin on 31.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "InfoViewController.h"
#import "GalleryViewController.h"
#import "HomeViewController.h"
#import "UIColor+UIColor_RSSchool.h"

@interface RootTabBarViewController ()

@property (nonatomic,strong) InfoViewController* infoTab;
@property (nonatomic,strong) GalleryViewController* galleryTab;
@property (nonatomic,strong) HomeViewController* homeTab;

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTabs];
    

    
    
}

- (void)setTabs{
    
    [UINavigationBar.appearance setTitleTextAttributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:18.0f
                                                        weight:UIFontWeightSemibold],
                                                          NSForegroundColorAttributeName: [UIColor rsschoolBlackColor]}];
    UINavigationBar.appearance.barTintColor = [UIColor rsschoolYellowColor];
    
    
    
    self.infoTab = [InfoViewController new];
    UITabBarItem *infobBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"info_unselected"] selectedImage:[UIImage imageNamed:@"info_selected"]];
    self.infoTab.tabBarItem = infobBarItem;
    UINavigationController *infoNC = [[UINavigationController alloc] initWithRootViewController:self.infoTab];
    
    
   
    
    self.galleryTab = [GalleryViewController new];
    UITabBarItem *galleryBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"gallery_unselected"] selectedImage:[UIImage imageNamed:@"gallery_selected"]];
    self.galleryTab.tabBarItem = galleryBarItem;
    UINavigationController *galleryNC = [[UINavigationController alloc] initWithRootViewController:self.galleryTab];
    

    
  
    
    self.homeTab = [HomeViewController new];
    UITabBarItem *homeBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"home_unselected"] selectedImage:[UIImage imageNamed:@"home_selected"]];
    self.homeTab.tabBarItem = homeBarItem;
    UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:self.homeTab];
    
  
    
    
    self.viewControllers = @[infoNC,galleryNC,homeNC];

}



@end
