//
//  MainTabBarButten.m
//  YouQuLai
//
//  Created by gaocaixin on 15/4/13.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "MainTabBarButten.h"
#import "BadgeButten.h"

// 判读是否是ios7
#define iOS7   ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
// 自定义log
#ifdef DEBUG
#define CXLog(...) NSLog(__VA_ARGS__)
#else
#define CXLog(...)
#endif
// 宽度
#define CGW(rect)               rect.size.width
#define CGH(rect)               rect.size.height
#define CGX(rect)               rect.origin.x
#define CGY(rect)               rect.origin.y

#define GXColor(a,b,c) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1]


@interface MainTabBarButten ()

@property (nonatomic ,weak) BadgeButten *badgeButten;

@end

@implementation MainTabBarButten

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self setTitleColor:[UIColor colorWithWhite:140/255.0 alpha:1] forState:UIControlStateNormal];
        [self setTitleColor:GXColor(240, 120, 90) forState:UIControlStateSelected];
        
        BadgeButten *badgeButten = [[BadgeButten alloc] init];
        self.badgeButten = badgeButten;
        [self addSubview:badgeButten];
    }
    return self;
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    
    self.badgeButten.badgeValue = self.item.badgeValue;
    
    CGRect rect = self.badgeButten.frame;
    
    CGFloat W = CGW(self.badgeButten.frame);
    rect.origin.x = CGW(self.bounds) - W - 2;
    rect.origin.y = 2;
    self.badgeButten.frame = rect;
}

- (void)setHighlighted:(BOOL)highlighted{}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat H = 10;
    return CGRectMake(0, CGH(self.bounds) - H - 5, CGW(self.bounds), H);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat W = 35;
    CGFloat H = 48/68.0*W;
    return CGRectMake((CGW(self.bounds)-W)/2, 5, W, H);
}


@end
