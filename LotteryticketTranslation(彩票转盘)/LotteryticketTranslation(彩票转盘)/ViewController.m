//
//  ViewController.m
//  LotteryticketTranslation(彩票转盘)
//
//  Created by AmberWhiteSky on 15/10/13.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"
#import "WheelView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //加载自定义的xib的view
    WheelView  *wheelView =[WheelView  wheel];
    wheelView.center = CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height*0.5);
    [wheelView   startRotating];
    [self.view  addSubview:wheelView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
