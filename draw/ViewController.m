//
//  ViewController.m
//  draw
//
//  Created by miss on 16/2/3.
//  Copyright © 2016年 qiwo. All rights reserved.
//

#import "ViewController.h"
#import "RestView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RestView *vc = [[[NSBundle mainBundle]loadNibNamed:@"RestView" owner:nil options:nil]lastObject];
    
    vc.frame = self.view.bounds;
    [vc setFinishBlock:^{
        NSLog(@"休息时间完成");
    } interruptBlock:^{
        NSLog(@"中断休息");
    }];
    [self.view addSubview:vc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
