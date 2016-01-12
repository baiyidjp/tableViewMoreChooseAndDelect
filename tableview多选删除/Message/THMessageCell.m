//
//  THMessageCell.m
//  teacherApp
//
//  Created by I Smile going on 15/12/1.
//  Copyright © 2015年 dong. All rights reserved.
//

#import "THMessageCell.h"
#import "THMessageCellModel.h"
//#import "NSString+Extonsion.h"

@implementation THMessageCell

+ (CGFloat)returnCellHeightWithModel:(THMessageCellModel *)model{
    
    CGSize messageSize = [model.messagedesc sizeWithFont:FONT(15) constrainedToSize:CGSizeMake(KWIDTH-3*KMARGIN, 70)];
    CGSize nameSize = [model.stringtime sizeWithFont:FONT(13)];
    CGFloat cellH = KMARGIN + messageSize.height + KMARGIN + nameSize.height + KMARGIN;
    return cellH;
}

- (void)prepareForReuse{
    self.messageLabel.textColor = [UIColor blackColor];
}
@end
