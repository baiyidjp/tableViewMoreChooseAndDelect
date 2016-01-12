//
//  THMessageCellModel.h
//  teacherApp
//
//  Created by I Smile going on 15/12/1.
//  Copyright © 2015年 dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THMessageCellModel : NSObject

@property(nonatomic,copy)NSString *messagedesc;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,assign) BOOL editCellSelect;
@property(nonatomic,assign)NSInteger messageid;//消息id
@property(nonatomic,assign)NSInteger messagenid;//消息对应的内容id
@property(nonatomic,assign)NSInteger notreadnum;
@property(nonatomic,assign)NSInteger messagetype;
@property(nonatomic,assign)long long createtime;
@property(nonatomic,copy)NSString *stringtime;
@end
