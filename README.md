# LisztPickerView
###写的很随,扩展性一般,但一般的选择够用了!主要针对ToolBar来进行封装
<img src="https://github.com/LisztGitHub/LisztPickerView/blob/master/Liszt.gif" />
# 
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
    @property (strong, nonatomic) UIPickerView *picker;
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
     *  @param frame   PickerView加上工具栏的frame 自定义时候这里的高度是所有主视图的高度(主视图=PickerView.height+CustomView.height)
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

###Example1
    LisztPickerViewAction *action1 = [[LisztPickerViewAction alloc]init];
    action1.title = @"按钮1";
    action1.highlightColor = [UIColor redColor];
    action1.edgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    action1.font = [UIFont systemFontOfSize:15.f];
    action1.titleColor = [UIColor colorWithRed:0/255.0 green:153/255.0 blue:227/255.0 alpha:1];
    action1.horizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    LisztPickerViewAction *action2 = [[LisztPickerViewAction alloc]init];
    action2.title = @"按钮2";
    action2.font = [UIFont systemFontOfSize:15.f];
    action2.highlightColor = [UIColor redColor];
    action2.titleColor = [UIColor colorWithRed:0/255.0 green:153/255.0 blue:227/255.0 alpha:1];
    action2.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    action2.horizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    LisztPickerView *pickerView = [[LisztPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300) actions:@[action1,action2] toolBarHeight:50];
    pickerView.picker.dataSource = self;
    pickerView.picker.delegate = self;
    [pickerView show];
###Example2
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    line.image = [UIImage imageNamed:@"test.png"];
    
    LisztPickerView *pickerView = [[LisztPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 268 + 100) customToolBarView:line];
    pickerView.picker.dataSource = self;
    pickerView.picker.delegate = self;
    [pickerView setLisztPickerViewToolDidSelectBlock:^(NSInteger index) {
        
    }];
    [pickerView show];
