//
//  BesselView.h
//  Bessel-curve
//
//  Created by 曾昭林 on 2017/2/12.
//  Copyright © 2017年 曾昭林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BesselView : UIView

@property(nonatomic,strong)UIColor *color;//用来设置线条的颜色

@property(nonatomic,assign)CGFloat linewidth;//用来设置线条的宽度

@property(nonatomic,strong)NSMutableArray *aillLine;//用来记录已有的线条


-(void)initBesselView;//初始化相关参数

-(void)backImage;//unDo操作

-(void)forwardImage;//reDo操作



@end
