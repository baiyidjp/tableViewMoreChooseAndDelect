//
//  THMessageCellModel.h
//  teacherApp
//
//  Created by I Smile going on 15/12/1.
//  Copyright © 2015年 dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#define KSHOWNUM 10
#define KMARGIN 10
#define FONT(x)  [UIFont systemFontOfSize:x]
#define KWIDTH  [UIScreen mainScreen].bounds.size.width
#define KHEIGHT [UIScreen mainScreen].bounds.size.height
#define PATHNAME [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"Message.plist"]

#define COLOR1 [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0]
#define COLOR2 [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0]

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
