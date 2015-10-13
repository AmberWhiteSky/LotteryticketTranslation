//
//  WheelView.m
//  LotteryticketTranslation(彩票转盘)
//
//  Created by AmberWhiteSky on 15/10/13.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "WheelView.h"

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
@end
