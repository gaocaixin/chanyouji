//
//  MainTabBarController.m
//  YouQuLai
//
//  Created by gaocaixin on 15/4/13.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "MainTabBarController.h"
#import "DestinationVC.h"
#import "PersonVC.h"
#import "SearchVC.h"
#import "SpecialTopicVC.h"
#import "MainNavigationC.h"
#import "MainTabBar.h"
#import "TravelNotesVC.h"


@interface MainTabBarController () <MainTabBarDelegate>

@property (nonatomic ,strong) MainTabBar *mainTabBar;


@end

@implementation MainTabBarController

- (MainTabBar *)mainTabBar
{
    if (_mainTabBar == nil) {
        _mainTabBar = [[MainTabBar alloc] init];
        _mainTabBar.frame = self.tabBar.bounds;
        _mainTabBar.delegate = self;
        [self.tabBar addSubview:_mainTabBar];
        
    }
    return _mainTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createVC];
    
}


- (void)createVC
{
    TravelNotesVC *frist = [[TravelNotesVC alloc]init];
    [self addVC:frist title:@"游记" image:@"" selImage:@""];
    
    SpecialTopicVC *second = [[SpecialTopicVC alloc] init];
    [self addVC:second title:@"专题" image:@"" selImage:@""];
    
    DestinationVC *third = [[DestinationVC alloc] init];
    [self addVC:third title:@"目的地" image:@"" selImage:@""];
    
    SearchVC *fourth = [[SearchVC alloc] init];
    [self addVC:fourth title:@"搜索" image:@"" selImage:@""];
    
    PersonVC *fifth = [[PersonVC alloc] init];
    [self addVC:fifth title:@"个人" image:@"" selImage:@""];
    
}

- (void)addVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selImage:(NSString *)selImage
{

    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selImage];
    
    MainNavigationC *mnc = [[MainNavigationC alloc] initWithRootViewController:vc];
    [self addChildViewController:mnc];
    
    [self.mainTabBar addMainTabBarItem:vc.tabBarItem];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            child.alpha = 0;
        }
    }
}

#pragma mark - maintabbar代理
- (void)tabBarItemButtenClicked:(NSInteger)index
{
    self.selectedIndex = index;
}


@end
