//
//  ViewController.m
//  LisztPickerViewExample
//
//  Created by Liszt on 16/11/16.
//  Copyright © 2016年 https://github.com/LisztGitHub. All rights reserved.
//

#import "ViewController.h"
#import "LisztPickerView.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - <UIPickerViewDataSource,UIPickerViewDelegate>
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 5;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor = [UIColor lightGrayColor];
        }
    }
    
    UILabel *genderLabel = [UILabel new];
    genderLabel.textAlignment = NSTextAlignmentCenter;
    genderLabel.font = [UIFont systemFontOfSize:15.f];
    genderLabel.text = @"2080年";
    return genderLabel;
}

- (IBAction)buttonAction:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
        {
            [self show1];
        }
            break;
        case 1:
        {
            [self show2];
        }
            break;
        case 3:
        {
//            [self show3];
            [self showCustom];
        }
            break;
        default:
            break;
    }
}

/** 普通PickerView*/
- (void)show1{
    LisztPickerViewAction *action1 = [[LisztPickerViewAction alloc]init];
    action1.title = @"按钮1";
    action1.highlightColor = [UIColor redColor];
    action1.edgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    action1.font = [UIFont systemFontOfSize:15.f];
    action1.titleColor = [UIColor colorWithRed:0/255.0 green:153/255.0 blue:227/255.0 alpha:1];
    action1.horizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    LisztPickerViewAction *action = [[LisztPickerViewAction alloc]init];
    action.title = @"按钮";
    action.font = [UIFont systemFontOfSize:15.f];
    action.titleColor = [UIColor redColor];
    
    LisztPickerViewAction *action2 = [[LisztPickerViewAction alloc]init];
    action2.title = @"按钮2";
    action2.font = [UIFont systemFontOfSize:15.f];
    action2.highlightColor = [UIColor redColor];
    action2.titleColor = [UIColor colorWithRed:0/255.0 green:153/255.0 blue:227/255.0 alpha:1];
    action2.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    action2.horizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    LisztPickerView *pickerView = [[LisztPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300) actions:@[action1,action2] toolBarHeight:50];
    pickerView.pickerView.dataSource = self;
    pickerView.pickerView.delegate = self;
    [pickerView show];
}
/** 多个PickerView*/
- (void)show2{
    LisztPickerViewAction *action1 = [[LisztPickerViewAction alloc]init];
    action1.title = @"按钮1";
    action1.highlightColor = [UIColor redColor];
    action1.edgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    action1.font = [UIFont systemFontOfSize:15.f];
    action1.titleColor = [UIColor colorWithRed:0/255.0 green:153/255.0 blue:227/255.0 alpha:1];
    action1.horizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    LisztPickerViewAction *action = [[LisztPickerViewAction alloc]init];
    action.title = @"按钮";
    action.font = [UIFont systemFontOfSize:15.f];
    action.titleColor = [UIColor darkGrayColor];
    action.highlightColor = [UIColor redColor];
    
    LisztPickerViewAction *action2 = [[LisztPickerViewAction alloc]init];
    action2.title = @"按钮2";
    action2.font = [UIFont systemFontOfSize:15.f];
    action2.highlightColor = [UIColor redColor];
    action2.titleColor = [UIColor colorWithRed:0/255.0 green:153/255.0 blue:227/255.0 alpha:1];
    action2.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    action2.horizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    LisztPickerView *pickerView = [[LisztPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300) actions:@[action1,action,action,action,action,action2] toolBarHeight:50];
    pickerView.pickerView.dataSource = self;
    pickerView.pickerView.delegate = self;
    [pickerView show];
}
/** 自定义按钮*/
- (void)showCustom{
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    line.image = [UIImage imageNamed:@"test.png"];
    
    LisztPickerView *pickerView = [[LisztPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 268 + 100) customToolBarView:line];
    pickerView.pickerView.dataSource = self;
    pickerView.pickerView.delegate = self;
    [pickerView setLisztPickerViewToolDidSelectBlock:^(NSInteger index) {
        
    }];
    [pickerView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
