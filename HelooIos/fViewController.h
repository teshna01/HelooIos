//
//  fViewController.h
//  HelooIos
//
//  Created by JF（朝阳区图书馆） on 14-9-17.
//  Copyright (c) 2014年 witmob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fViewController : UIViewController
//所有的变量在这里定义
@property(retain,nonatomic)UITextField *txt;
@property(retain,nonatomic)NSMutableString *mutstr,*mustr2,*mustr3;//创建一个可变字符床
@property(retain,nonatomic)UIButton *btn,*btn2,*btn3,*btn4,*point1,*btn5;
@property(assign,nonatomic)double num1,num2,num3;
@property(retain,nonatomic)NSString *fuhao;
@property(assign,nonatomic)int n;
@end
