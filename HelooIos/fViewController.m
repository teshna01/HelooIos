//
//  fViewController.m
//  HelooIos
//
//  Created by JF（朝阳区图书馆） on 14-9-17.
//  Copyright (c) 2014年 witmob. All rights reserved.
//

#import "fViewController.h"
@interface fViewController ()

@end

@implementation fViewController
@synthesize txt,mutstr,mustr2,mustr3,num1,num2,num3,point1,btn5,n;
- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    mutstr=[[NSMutableString alloc]init];//给可变字符床开辟控件并赋值（可动态操作的字符串）
    //测试log
    NSLog(@"Hello, World!");
    self.n=0;//n的初始值
    //显示计算数据的文本框
    self.txt=[[UITextField alloc]initWithFrame:CGRectMake(20, 50, 230, 50)];
    self.txt.textColor = [UIColor blackColor];
    self.txt.contentVerticalAlignment=UIControlContentHorizontalAlignmentCenter;//垂直对齐
    self.txt.borderStyle=UITextBorderStyleRoundedRect;
    self.txt.placeholder=@"0";
    self.txt.enabled=NO;//不可编辑
    [self.view addSubview:self.txt];
    //三行四列数字按钮绘制
    for (int i=0; i<3; i++)
    {
        for (int j=0; j<4; j++)
        {
            if (j+i*4>9)
            {
                break;
            }
            
            self.btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            self.btn.frame=CGRectMake(20+60*j,120+60*i,50,50);//每个按钮宽高50
            self.btn.backgroundColor = [UIColor colorWithRed:150/255.0 green:200/255.0 blue:255/255.0 alpha:1];
            [self.view addSubview:self.btn];
            //打印出0-9的数字
            [self.btn setTitle:[NSString stringWithFormat:@"%d",j+i*4] forState:UIControlStateNormal];
            [self.btn addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
            
        }
    }
    
    //增加小数点按键
    self.point1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.point1.frame=CGRectMake(140,240,50,50);//位于第3行3列
    self.point1.backgroundColor = [UIColor colorWithRed:150/255.0 green:200/255.0 blue:255/255.0 alpha:1];
    [self.view addSubview:self.point1];
    [self.point1 setTitle:[NSString stringWithFormat:@"."] forState:UIControlStateNormal];
    [self.point1 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    //绘制四个运算按钮
    for (int i=0; i<4; i++)
    {
        self.btn2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.btn2.frame=CGRectMake(20+i*60, 300, 50, 50);
        self.btn2.backgroundColor = [UIColor colorWithRed:150/255.0 green:200/255.0 blue:255/255.0 alpha:1];
        if (i==0) {
            [self.btn2 setTitle:@"+" forState:UIControlStateNormal];
        }else if(i==1){
            [self.btn2 setTitle:@"-" forState:UIControlStateNormal];
        }else if(i==2){
            [self.btn2 setTitle:@"x" forState:UIControlStateNormal];
        }else if(i==3){
            [self.btn2 setTitle:@"÷" forState:UIControlStateNormal];
        }
        //设置按钮在正常情况下显示内容
        [self.view addSubview:self.btn2];
        [self.btn2 addTarget:self action:@selector(yusuan:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    //设置清除按键
    self.btn3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn3.frame=CGRectMake(200, 240, 50, 50);//位于第3行4列
    self.btn3.backgroundColor = [UIColor colorWithRed:150/255.0 green:200/255.0 blue:255/255.0 alpha:1];
    [self.btn3 setTitle:@"C" forState:UIControlStateNormal];
    [self.view addSubview:self.btn3];
    [self.btn3 addTarget:self action:@selector(clear:) forControlEvents:UIControlEventTouchUpInside];//
    //设置等于按键
    self.btn4=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn4.frame=CGRectMake(20, 360, 230, 50);
    self.btn4.backgroundColor = [UIColor colorWithRed:150/255.0 green:200/255.0 blue:255/255.0 alpha:1];
    [self.btn4 setTitle:@"=" forState:UIControlStateNormal];
    [self.view addSubview:self.btn4];
    [self.btn4 addTarget:self action:@selector(dengyu:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.mustr2=self.mutstr;
    self.btn5=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn5.frame=CGRectMake(260, 120, 50, 290);
    self.btn5.backgroundColor = [UIColor colorWithRed:150/255.0 green:200/255.0 blue:255/255.0 alpha:1];
    [self.btn5 setTitle:@"撤销" forState:UIControlStateNormal];
    [self.view addSubview:self.btn5];
    [self.btn5 addTarget:self action:@selector(houtui:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
//后退
-(void)houtui:sender{
    
    [self.mutstr deleteCharactersInRange:NSMakeRange(n-1,1)];
    self.txt.text=self.mutstr;
    n--;
}
//运算的实现
-(void)dengyu:sendet{
    self.num2=[self.mutstr doubleValue];
    
    if ([self.fuhao isEqualToString:@"+"]) {
        self.txt.text=[NSString stringWithFormat:@"%f",self.num1+self.num2];
    }else if([self.fuhao isEqualToString:@"-"]){
        self.txt.text=[NSString stringWithFormat:@"%f",self.num1-self.num2];
    }
    else if([self.fuhao isEqualToString:@"x"]){
        self.txt.text=[NSString stringWithFormat:@"%f",self.num1*self.num2];
    }else if([self.fuhao isEqualToString:@"÷"]){
        self.txt.text=[NSString stringWithFormat:@"%f",self.num1/self.num2];
    }
    
}
//清除的实现方法
-(void)clear:sender{
    
    [self.mutstr setString:@""];//将第二次取到的值清空
    self.txt.text=self.mutstr;//将第二次取到的值赋值给文本框
    NSLog(@"%@",self.mutstr);//输出第二次取到的值
    //[self.txt setText:self.mutstr];
}
//符号的实现
-(void)yusuan:(id)sender{
    self.num1=[self.mutstr doubleValue];//将第一次文本框的值转换成int型，并赋值给self.num1
    [self.mutstr setString:@""];//将第一次取到的值清空
    self.fuhao=[sender titleForState:UIControlStateNormal];//接受到符号
    self.txt.text=self.fuhao;//将符号赋值给文本框
    
};
-(void)shuzi:(id)sender{
//      mutstr=[sender titleForState:UIControlStateNormal];//将点击的button储存起来用NSString来接
//      [self.mutstr appendString:i];//将字符串加到可变字符床中
//     self.txt.text=self.mutstr;
    n++;
    NSLog(@"%d",n);
   [self.mutstr appendString:[sender currentTitle]];//将输入的数字赋值给mutstr
    
    NSLog(@"%d",n);
    self.txt.text=self.mutstr;//将字符串mutstr在文本框里显示
    NSLog(@"%@",self.mutstr);//输出第一次取到的值
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
