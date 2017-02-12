//
//  ViewController.m
//  Bessel-curve
//
//  Created by 曾昭林 on 2017/2/12.
//  Copyright © 2017年 曾昭林. All rights reserved.
//

#import "ViewController.h"

#import "BesselView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    BesselView *besselView = [[BesselView alloc]init];
    besselView.frame = CGRectMake(0, 30, self.view.bounds.size.width,  self.view.bounds.size.width);
    besselView.backgroundColor = [UIColor whiteColor];
    besselView.color = [UIColor blueColor];
    besselView.linewidth = 1;
    besselView.aillLine = [NSMutableArray arrayWithCapacity:50];
    [self.view addSubview:besselView];
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
