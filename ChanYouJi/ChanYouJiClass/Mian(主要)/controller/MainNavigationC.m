//
//  MainNavigationC.m
//  YouQuLai
//
//  Created by gaocaixin on 15/4/13.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "MainNavigationC.h"

@interface MainNavigationC ()

@end

@implementation MainNavigationC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationBar.backgroundColor = [UIColor blueColor];
    
//    [self.navigationBar setBackgroundImage:[[UIImage imageNamed:@""] stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16], NSForegroundColorAttributeName:[UIColor whiteColor]};
}

@end
