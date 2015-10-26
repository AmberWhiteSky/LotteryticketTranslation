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



- (void)awakeFromNib {
    
    
    self.centerView.userInteractionEnabled =YES;
    //加载大图片
    UIImage  *bigimage =[UIImage  imageNamed:@"LuckyAstrology"];
    
    
    //判断屏幕尺寸
    
    //屏幕伸缩尺寸
//    [UIScreen  mainScreen].scale
    
    
    //从大图片中裁剪对应星座的图片
    CGFloat smallW=bigimage.size.width/12*[UIScreen  mainScreen].scale;
    
    CGFloat smallH =bigimage.size.height*[UIScreen  mainScreen].scale;;
    
    
    
    //添加十二个按钮
    for(int  index =0;index<12;index++){
        UIButton  *btn =[UIButton  buttonWithType:UIButtonTypeCustom];
//        btn.backgroundColor =[UIColor  colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0  blue:arc4random_uniform(255)/255.0  alpha:1.0];
        
//        btn.backgroundColor =[UIColor  redColor];
        
        CGRect  smallrect =CGRectMake(index*smallW, 0, smallW, smallH);
        CGImageRef  smallImage =CGImageCreateWithImageInRect(bigimage.CGImage, smallrect);
        [btn setImage:[UIImage  imageWithCGImage:smallImage] forState:UIControlStateNormal];
        
        
        
        [btn setBackgroundImage: [UIImage  imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        btn.bounds =CGRectMake(0, 0, 68, 143);
        //设置锚点和位置
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position =CGPointMake(self.centerView.frame.size.width*0.5, self.centerView.frame.size.height*0.5);
        
        //设置旋转角度 就（绕着锚点旋转）
        CGFloat angle =(30*index)/180.0*M_PI;
        btn.transform =CGAffineTransformMakeRotation(angle);
        
        //监听按钮点击
        [btn addTarget:self action:@selector(bthClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.centerView   addSubview:btn];


    }
}

-(void)bthClick :(UIButton *)  btn {
    btn.selected=YES;
}
//- (instancetype)initWithCoder:(NSCoder *)coder{
//    self = [super initWithCoder:coder];
//    if (self) {
//        //添加十二个按钮
//        for(int  index =0;index<12;index++){
//            UIButton  *btn =[UIButton  buttonWithType:UIButtonTypeCustom];
//            btn.backgroundColor =[UIColor  redColor];
//            [btn setBackgroundImage: [UIImage  imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
////            btn.frame =
//            [self.centerView   addSubview:btn];
//        }
//        
//    }
//    return self;
//}



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
