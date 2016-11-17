//
//  LisztPickerView.h
//  LisztPickerViewExample
//
//  Created by Liszt on 16/11/16.
//  Copyright © 2016年 https://github.com/LisztGitHub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LisztPickerViewAction : NSObject
/** 标题*/
@property (copy, nonatomic) NSString *title;
/** 字体颜色*/
@property (strong, nonatomic) UIColor *titleColor;
/** 背景颜色*/
@property (strong, nonatomic) UIColor *highlightColor;
/** 字体*/
@property (strong, nonatomic) UIFont *font;
/** 设置偏移量*/
@property (assign, nonatomic) UIEdgeInsets edgeInsets;
/** 设置显示模式*/
@property (assign, nonatomic) UIControlContentHorizontalAlignment horizontalAlignment;
@end

@interface LisztPickerView : UIView
/** pickerView*/
@property (strong, nonatomic) UIPickerView *pickerView;
/** 选择的下标*/
@property (copy, nonatomic) void(^LisztPickerViewToolDidSelectBlock)(NSInteger selectIndex);

/**
 *  初始化方法
 *  @param frame   PickerView加上工具栏的frame
 *  @param actions 多少个动作响应
 *  @param toolBarHeight 工具栏高度
 */
- (instancetype)initWithFrame:(CGRect)frame actions:(NSArray <LisztPickerViewAction *>*)actions toolBarHeight:(CGFloat)toolBarHeight;

/**
 *  初始化方法 自定义工具栏
 *  @param frame   PickerView加上工具栏的frame
 *  @param customToolBarView 自定义视图
 */
- (instancetype)initWithFrame:(CGRect)frame customToolBarView:(UIView *)customToolBarView;
/**
 *  显示PickerView
 */
- (void)show;
/**
 *  退出PickerView
 */
- (void)dismiss;
@end
