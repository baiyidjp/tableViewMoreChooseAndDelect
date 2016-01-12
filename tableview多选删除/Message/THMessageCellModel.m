//
//  THMessageCellModel.m
//  teacherApp
//
//  Created by I Smile going on 15/12/1.
//  Copyright © 2015年 dong. All rights reserved.
//

#import "THMessageCellModel.h"

@implementation THMessageCellModel

- (void)setCreatetime:(long long)createtime{
    _createtime = createtime;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MM-dd HH:mm";
    NSDate *creatDate = [NSDate dateWithTimeIntervalSince1970:createtime/1000];
    self.stringtime = [formatter stringFromDate:creatDate];
}
@end
