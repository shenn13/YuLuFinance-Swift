//
//  UnderLineButtonView.m
//  LoginDemo
//
//  Created by Apple on 2017/8/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UnderLineButtonView.h"
#import "UIView+Extension.h"
//设置字体大小
#define font(a) [UIFont systemFontOfSize:a]
#define ViewController_BackGround [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1.0]
//屏幕尺寸
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface UnderLineButtonView ()
@property (nonatomic) NSArray *items;
@property (nonatomic) id target;
@property (nonatomic) SEL action;
@property (nonatomic, strong) UIImageView *line;
@end


@implementation UnderLineButtonView

- (instancetype)initWithItems:(NSArray *)items;
{
    self = [super init];
    if (self) {
        _items = items;
        [self setButtons];
        [self setInitialValue];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setButtonsFrames];
}

- (void)setButtons
{
    int i = 0;
    for (NSString *titleStr in _items) {
        
        UIButton *button = [[UIButton alloc] init];
        button.tag = 1000+i;
        [button setTitle:titleStr forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = font(18);
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        i++;
    }
    UIImageView *underLine = [[UIImageView alloc] init];
    underLine.image = [UIImage imageNamed:@"login_select"];
    underLine.tag = kLUHUnderLineButtonUnderLineTag;
    underLine.layer.cornerRadius = kLUHUnderLineButtonUnderLineHeight/2;
    [self addSubview:underLine];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 2)];
    line.backgroundColor = ViewController_BackGround;
    [self addSubview:line];
    self.line = line;
}

- (void)setInitialValue
{
    self.selectedIndex = 0;
    [self selectButtonWithIndex:0];
}

- (void)setButtonsFrames
{
    CGFloat width = CGRectGetWidth(self.frame)/_items.count;
    
    CGFloat height = CGRectGetHeight(self.frame);
    
    for (int i = 0; i < _items.count; i++) {
        
        UIButton *button = (UIButton *)[self viewWithTag:1000+i];
        if (button != nil)button.frame = CGRectMake(i*width, 0, width, height);
    }
    
    UIView *underLine = [self viewWithTag:kLUHUnderLineButtonUnderLineTag];
    
    CGFloat underLineW = width - 4*kLUHUnderLineButtonUnderLinePadding;
    if (underLine != nil) {
        underLine.frame = CGRectMake(self.selectedIndex * underLineW + kLUHUnderLineButtonUnderLinePadding *2, height-kLUHUnderLineButtonUnderLineHeight,
                                     underLineW, kLUHUnderLineButtonUnderLineHeight);
    }
    self.line.centerY = underLine.maxY;
}

- (void)addTarget:(id)target action:(SEL)action
{
    self.target = target;
    self.action = action;
}

- (void)buttonAction:(UIButton *)button
{
    NSInteger index = button.tag - 1000;
    
    if (index == self.selectedIndex) return;
    
    self.selectedIndex = index;
    
    if (self.action != nil) {
        
        [self.target performSelectorOnMainThread:self.action withObject:button waitUntilDone:NO];
    }
}

#pragma mark - private
- (void)selectButtonWithIndex:(NSInteger)index;
{
    CGFloat width = CGRectGetWidth(self.frame)/_items.count;
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat underLineW = width - 4*kLUHUnderLineButtonUnderLinePadding;
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        UIView *underLine = [weakself viewWithTag:kLUHUnderLineButtonUnderLineTag];
        if (underLine != nil) {
            
            underLine.frame = CGRectMake(index*width + kLUHUnderLineButtonUnderLinePadding *2, height-kLUHUnderLineButtonUnderLineHeight,
                                         underLineW, kLUHUnderLineButtonUnderLineHeight);
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (_selectedIndex == selectedIndex)
        return;
    
    _selectedIndex = selectedIndex;
    
    [self selectButtonWithIndex:selectedIndex];
}

@end
