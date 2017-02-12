//
//  BesselView.m
//  Bessel-curve
//
//  Created by 曾昭林 on 2017/2/12.
//  Copyright © 2017年 曾昭林. All rights reserved.
//

#import "BesselView.h"

@interface BesselView()

@property(nonatomic,strong)UIBezierPath *bezier;//声明贝塞尔曲线

@property(nonatomic,strong)NSMutableArray *cancleArray;//储存Undo出来的线条

@end

@implementation BesselView

/**
 进行一些初始化工作
 */
-(void)initBesselView{

    self.color = [UIColor redColor];
    self.linewidth = 1;
    self.aillLine = [NSMutableArray arrayWithCapacity:50];
    self.cancleArray = [NSMutableArray arrayWithCapacity:50];

}

/**
 UnDo操作
 */
-(void)backImage{

    if (self.aillLine.count > 0) {
        
        int index = (int)self.aillLine.count - 1;
        
        [self.cancleArray addObject:self.aillLine[index]];
        
        [self.aillLine removeObjectAtIndex:index];
        
        [self setNeedsDisplay];
        
    }

}

/**
 ReDo操作
 */
-(void)forwardImage{

    if (self.cancleArray.count > 0) {
        
        int index = (int)self.cancleArray.count - 1;
        
        [self.aillLine addObject:self.cancleArray[index]];
        
        [self.cancleArray removeObjectAtIndex:index];
        
        [self setNeedsDisplay];
        
    }

}

//触摸开始
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"被我点击了");
    //新建贝塞尔曲线
    self.bezier = [UIBezierPath bezierPath];
    
    //获取触摸的点
    UITouch *myTouch = [touches anyObject];
    CGPoint point = [myTouch locationInView:self];
    
    //把刚触摸的点设置为bezier的起点
    [self.bezier moveToPoint:point];
    
    //把线条的颜色、宽度、每个像素点的坐标（就是贝塞尔曲线）存入字典中
    NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] initWithCapacity:3];
    [tempDic setObject:self.color forKey:@"color"];
    [tempDic setObject:[NSNumber numberWithFloat:self.linewidth] forKey:@"lineWidth"];
    [tempDic setObject:self.bezier forKey:@"line"];
    
    //把储存好的线条数据的字典添加到数组中
    [self.aillLine addObject:tempDic];
    
    
}

//手指在屏幕上移动的时候把像素点储存到BezierPath中
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITouch *myTouche = [touches anyObject];
    CGPoint point = [myTouche locationInView:self];
    
    [self.bezier addLineToPoint:point];
    
    [self setNeedsDisplay];//重绘页面

}

//画出线条
-(void)drawRect:(CGRect)rect{
   
    for (int i = 0; i < self.aillLine.count; i++) {
        
        NSDictionary *tempDic = self.aillLine[i];
        UIColor *color = tempDic[@"color"];
        CGFloat width = [tempDic[@"lineWidth"] floatValue];
        UIBezierPath *path = tempDic[@"line"];
        
        [color setStroke];
        [path setLineWidth:width];
        [path stroke];
        
    }
    
}

- (IBAction)sliderChange:(id)sender {
    
    
    
}










@end
