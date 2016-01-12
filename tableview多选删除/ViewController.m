//
//  ViewController.m
//  tableview多选删除
//
//  Created by dongjiangpeng on 16/1/12.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "ViewController.h"
#import "THMessageController.h"
#define COLOR3 [UIColor colorWithRed:37/255.0 green:152/255.0 blue:249/255.0 alpha:1.0]
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    //设置导航栏的文字和背景颜色
    [self.navigationController.navigationBar setBarTintColor:COLOR3];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}
- (IBAction)clickMe:(UIButton *)sender {
    THMessageController *vc = [[THMessageController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
