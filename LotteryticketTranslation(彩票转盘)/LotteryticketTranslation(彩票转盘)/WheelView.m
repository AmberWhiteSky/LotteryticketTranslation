//
//  WheelView.m
//  LotteryticketTranslation(彩票转盘)
//
//  Created by AmberWhiteSky on 15/10/13.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "WheelView.h"

@interface WheelView()

@property (weak, nonatomic) IBOutlet UIImageView *centerView;

@end


@implementation WheelView


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+(instancetype)  wheel {

     return  [[[NSBundle  mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil] lastObject];
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        //添加十二个按钮
        for(int  index =0;index<12;index++){
            UIButton  *btn =[UIButton  buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor =[UIColor  redColor];
            [btn setBackgroundImage: [UIImage  imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
//            btn.frame =
            [self.centerView   addSubview:btn];
        }
        
    }
    return self;
}



//旋转方法
-(void)  startRotating{
    
    CABasicAnimation  *anim =[CABasicAnimation  animation];
    
    
    anim.keyPath =@"transform.rotation";
    
    anim.toValue =@(2*M_PI);
    
    anim.duration =5;
    
    anim.repeatCount=MAXFLOAT;
    //中间的view 旋转
    [self.centerView.layer  addAnimation:anim forKey:nil];

}

@end
