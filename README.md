
STRAutoScrollLabel *autoLabel = [[STRAutoScrollLabel alloc] initWithFrame:CGRectMake(10, 30, 200, 40)];
//设置文字
autoLabel.text = @"跑马灯效果！哈哈哈哈哈哈，实现了，看看效果好不好";
//设置颜色
autoLabel.textColor = [UIColor redColor];
//根据实际情况，设置速度及之间间距
//    autoLabel.speed = 70;
//    autoLabel.labelBetweenGap = 10;

[self.view addSubview:autoLabel];