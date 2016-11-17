//
//  LisztPickerView.m
//  LisztPickerViewExample
//
//  Created by Liszt on 16/11/16.
//  Copyright © 2016年 https://github.com/LisztGitHub. All rights reserved.
//

#import "LisztPickerView.h"
#import "UIViewExt.h"
#define RGBA(_A,_B,_C,_ALPHA) [UIColor colorWithRed:_A/255.0 green:_B/255.0 blue:_C/255.0 alpha:_ALPHA]
#define ADAPTER_WIDTH SCREEN_WIDTH / 375

@interface LisztPickerView()
{
    /** 主视图Frame*/
    CGRect mainFrame;
    /** 工具栏高度*/
    CGFloat toolHeight;
    /** 活动响应项*/
    NSArray *pActions;
}
/** 主视图*/
@property (strong, nonatomic) UIView *mainView;
/** 工具栏*/
@property (strong, nonatomic) UIView *toolView;
@end
@implementation LisztPickerViewAction

@end

@implementation LisztPickerView
#pragma mark - Initializer
- (instancetype)initWithFrame:(CGRect)frame actions:(NSArray<LisztPickerViewAction *> *)actions toolBarHeight:(CGFloat)toolBarHeight{
    self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    if(self){
        self.backgroundColor = RGBA(0, 0, 0, 0.0f);
        pActions = actions;
        mainFrame = frame;
        toolHeight = toolBarHeight;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)]];
        [self initializerActionsUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame customToolBarView:(UIView *)customToolBarView{
    self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    if(self){
        self.backgroundColor = RGBA(0, 0, 0, 0.0f);
        mainFrame = frame;
        self.toolView = customToolBarView;
        toolHeight = CGRectGetHeight(customToolBarView.frame);
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)]];
        [self initializerCustomUI];
    }
    return self;
}
- (void)initializerActionsUI{
    [self addSubview:self.mainView];
    [self.mainView addSubview:self.toolView];
    [self.mainView addSubview:self.pickerView];
    
    [pActions enumerateObjectsUsingBlock:^(LisztPickerViewAction*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [itemButton setTitle:obj.title forState:UIControlStateNormal];
        itemButton.titleLabel.font = obj.font;
        itemButton.titleEdgeInsets = obj.edgeInsets;
        [itemButton setTitleColor:obj.highlightColor forState:UIControlStateHighlighted];
        [itemButton setTitleColor:obj.titleColor forState:UIControlStateNormal];
        itemButton.tag = idx;
        [itemButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [itemButton setContentHorizontalAlignment:obj.horizontalAlignment];
        itemButton.frame = CGRectMake(idx * (CGRectGetWidth(self.bounds) / pActions.count), 0, CGRectGetWidth(self.bounds) / pActions.count, toolHeight);
        [self.toolView addSubview:itemButton];
    }];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.toolView.height - 0.6, self.toolView.width, 0.6)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.toolView addSubview:line];
}
- (void)initializerCustomUI{
    [self addSubview:self.mainView];
    [self.mainView addSubview:self.toolView];
    [self.mainView addSubview:self.pickerView];
}

#pragma mark - Button Action
- (void)buttonAction:(UIButton *)button{
    [self dismiss];
    if(self.LisztPickerViewToolDidSelectBlock){
        self.LisztPickerViewToolDidSelectBlock(button.tag);
    }
}

#pragma mark - handle Action
- (void)handleTap{
    [self dismiss];
}

#pragma mark - public function
- (void)show{
    /** 1.设置默认*/
    mainFrame = CGRectMake(0, self.bounds.size.height + mainFrame.size.height, mainFrame.size.width, mainFrame.size.height);
    self.mainView.frame = mainFrame;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.2
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:2
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.backgroundColor = RGBA(0, 0, 0, 0.3);
                         self.mainView.top = self.bounds.size.height - mainFrame.size.height;
                     } completion:^(BOOL finished) {}];
}
- (void)dismiss{
    [self removeFromSuperview];
}

#pragma mark - 懒加载
- (UIView *)toolView{
    if(!_toolView){
        _toolView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), toolHeight)];
    }
    return _toolView;
}
- (UIPickerView *)pickerView{
    if(!_pickerView){
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, toolHeight, CGRectGetWidth(self.frame), CGRectGetHeight(self.mainView.frame) - toolHeight)];
    }
    return _pickerView;
}
- (UIView *)mainView{
    if(!_mainView){
        _mainView = [[UIView alloc]initWithFrame:mainFrame];
        _mainView.backgroundColor = [UIColor whiteColor];
    }
    return _mainView;
}
@end
