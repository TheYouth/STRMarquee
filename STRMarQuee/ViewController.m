//
//  ViewController.m
//  STRMarQuee
//
//  Created by xingZai on 2017/6/21.
//  Copyright © 2017年 xingZai. All rights reserved.
//

#import "ViewController.h"
#import "STRAutoScrollLabel.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    STRAutoScrollLabel *autoLabel = [[STRAutoScrollLabel alloc] initWithFrame:CGRectMake(10, 30, 200, 40)];
    autoLabel.text = @"跑马灯效果！哈哈哈哈哈哈，实现了，看看效果好不好";
    //color
    autoLabel.textColor = [UIColor redColor];
    //根据实际情况，添加速度及之间间距
//    autoLabel.speed = 70;
//    autoLabel.labelBetweenGap = 10;
    
    [self.view addSubview:autoLabel];
    
    
}

@end
