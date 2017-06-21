//
//  STRAutoScrollLabel.h
//  CalfProject
//
//  Created by xingZai on 2017/6/21.
//  Copyright © 2017年 xingZai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,DirtionType){
 
    DirtionTypeLeft, //left
    DirtionTypeRight //right
    
};

@interface STRAutoScrollLabel : UIScrollView

//set Text
@property (nonatomic, copy) NSString *text;
// label and label gap
@property (nonatomic, assign) NSInteger labelBetweenGap;
//deafult 2 秒
@property (nonatomic, assign) NSInteger pauseTime;
//deafult DirtionTypeLeft
@property (nonatomic, assign) DirtionType dirtionType;
//set speed ,default 30
@property (nonatomic, assign) NSInteger speed;
//set Color
@property (nonatomic, strong) UIColor  *textColor;

- (void)rejustlabels;
@end
