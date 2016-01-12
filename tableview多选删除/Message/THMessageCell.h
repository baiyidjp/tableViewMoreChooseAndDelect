//
//  THMessageCell.h
//  teacherApp
//
//  Created by I Smile going on 15/12/1.
//  Copyright © 2015年 dong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class THMessageCellModel;
@interface THMessageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
+ (CGFloat)returnCellHeightWithModel:(THMessageCellModel *)model;
@end
