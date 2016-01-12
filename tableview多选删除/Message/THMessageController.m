//
//  THMessageController.m
//  teacherApp
//
//  Created by I Smile going on 15/12/1.
//  Copyright © 2015年 dong. All rights reserved.
//

#import "THMessageController.h"
#import "THMessageCell.h"
#import "THMessageCellModel.h"
#import "UIColor+Extension.h"
#import "UIView+XL.h"
#define PATHNAME [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"Message.plist"]


@interface THMessageController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation THMessageController
{
    UIBarButtonItem *editBtn;
    NSMutableArray *listArrayM;
    NSMutableArray *deleArrayM;
    NSMutableArray *cellArrayM;
    UITableView *myTableView;
    BOOL isSelectLeftItem;
    UIBarButtonItem *chooseBtn;
    UIView *bottomView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    self.title = @"消息";
    myTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    [myTableView registerNib:[UINib nibWithNibName:@"THMessageCell" bundle:nil] forCellReuseIdentifier:@"messagecell"];
    myTableView.tableFooterView = [[UIView alloc]init];
    editBtn = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(clickEdit)];
    self.navigationItem.rightBarButtonItem = editBtn;
    chooseBtn = [[UIBarButtonItem alloc]initWithTitle:@"全选" style:UIBarButtonItemStylePlain target:self action:@selector(chooseAllMessage)];
    [chooseBtn setTintColor:[UIColor whiteColor]];
    
    [self getModel];
    [self creatBottomView];
}
- (void)getModel{
    listArrayM = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        THMessageCellModel *messageModel = [[THMessageCellModel alloc]init];
        messageModel.messagedesc = [NSString stringWithFormat:@"%dMessageCellMessageCellMessageCellMessageCellMessageCell",i];
        messageModel.stringtime = @"12/25 15:25";
        messageModel.username = @"用户:苹果";
        messageModel.messageid = i+2000;
        [listArrayM addObject:messageModel];
    }
    cellArrayM = [NSMutableArray array];
}
- (void)creatBottomView{
    bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, KHEIGHT, KWIDTH, 64)];
    bottomView.backgroundColor = [UIColor colorWithWhite:0.951 alpha:1.000];
    CGFloat btnW = (KWIDTH - 4*KMARGIN)/3;
    UIButton *delectBtn = [[UIButton alloc]initWithFrame:CGRectMake(KWIDTH/2 -btnW - KMARGIN, 15, btnW, 34)];
    UIButton *haveReadBtn = [[UIButton alloc]initWithFrame:CGRectMake(KMARGIN+KWIDTH/2, 15, btnW, 34)];
    [delectBtn setTitle:@"删除" forState:UIControlStateNormal];
    [haveReadBtn setTitle:@"标记为已读" forState:UIControlStateNormal];
    [delectBtn setBackgroundColor:[UIColor redColor]];
    [haveReadBtn setBackgroundColor:[UIColor orangeColor]];
    [delectBtn.titleLabel setFont:FONT(15)];
    [haveReadBtn.titleLabel setFont:FONT(15)];
    delectBtn.layer.cornerRadius = 15;
    haveReadBtn.layer.cornerRadius = 15;
    [bottomView addSubview:delectBtn];
    [bottomView addSubview:haveReadBtn];
    [delectBtn addTarget:self action:@selector(clickDelect) forControlEvents:UIControlEventTouchUpInside];
    [haveReadBtn addTarget:self action:@selector(clickHaveRead) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomView];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return listArrayM.count;
}
#pragma mark cellForRowAtIndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    THMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messagecell"];
    THMessageCellModel *model = listArrayM[indexPath.row];
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:PATHNAME];
    if ([array containsObject:[NSString stringWithFormat:@"%zd",model.messageid]]) {
        cell.messageLabel.textColor = [UIColor colorWithHexString:@"cdcdcd"];
    }
    cell.messageLabel.text = model.messagedesc;
    cell.timeLabel.text = model.stringtime;
    cell.usernameLabel.text = model.username;
    cell.selectBtn.selected = model.editCellSelect;
    cell.tag = indexPath.row;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkCell:)];
    [cell addGestureRecognizer:tapGesture];
    [cellArrayM addObject:cell];
    return cell;
}
#pragma mark heightForRowAtIndexPath
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [THMessageCell returnCellHeightWithModel:listArrayM[indexPath.row]];
}
#pragma mark commitEditingStyle
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [listArrayM removeObjectAtIndex:indexPath.row];
    [myTableView reloadData];
}
#pragma mark 点击编辑
- (void)clickEdit{
    [myTableView setEditing:!myTableView.editing animated:YES];
    if (myTableView.editing) {
        [editBtn setTitle:@"取消"];
        self.title = @"编辑消息";
        self.navigationItem.leftBarButtonItem = chooseBtn;
        [UIView animateWithDuration:0.25 animations:^{
            bottomView.y = KHEIGHT - 64;
        }];
    } else {
        [editBtn setTitle:@"编辑"];
        self.title = @"消息中心";
        isSelectLeftItem = NO;
        [UIView animateWithDuration:0.25 animations:^{
            bottomView.y = KHEIGHT;
        }];
        self.navigationItem.leftBarButtonItem = nil;
        for (THMessageCell *cell in cellArrayM) {
            for (UITapGestureRecognizer *tapGesture in cell.gestureRecognizers) {
                [cell removeGestureRecognizer:tapGesture];
            }
        }
        for (THMessageCellModel *model in listArrayM) {
            model.editCellSelect = NO;
            [myTableView reloadData];
        }
    }
}
//单选
- (void)checkCell:(UITapGestureRecognizer *)tapGesture {
    THMessageCell *cell = (THMessageCell *)tapGesture.view;
    THMessageCellModel *model = listArrayM[cell.tag];
    if (!myTableView.editing) {
        NSLog(@"此处应该跳转消息详情");
        NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:PATHNAME];
        if (!array.count) {
            array = [NSMutableArray array];
        }
        if (![array containsObject:[NSString stringWithFormat:@"%zd",model.messageid]]) {
            [array addObject:[NSString stringWithFormat:@"%zd",model.messageid]];
            [array writeToFile:PATHNAME atomically:YES];
            [myTableView reloadData];
        }
        
    }else{
        model.editCellSelect = !model.editCellSelect;
        [myTableView reloadData];
        
    }
    
}
//全选
- (void)chooseAllMessage{
    isSelectLeftItem = !isSelectLeftItem;
    for (THMessageCellModel *model in listArrayM) {
        model.editCellSelect = isSelectLeftItem;
        [myTableView reloadData];
    }
}
- (void)clickDelect{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"您确定删除么" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        for (THMessageCellModel *model in [listArrayM copy]) {
            if (model.editCellSelect) {
                [listArrayM removeObject:model];
            };
            [myTableView reloadData];
        }
        [self clickEdit];
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertVC animated:YES completion:nil];
}
- (void)clickHaveRead{
    for (THMessageCellModel *model in [listArrayM copy]) {
        NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:PATHNAME];
        if (!array.count) {
            array = [NSMutableArray array];
        }
        if (model.editCellSelect) {
            if (![array containsObject:[NSString stringWithFormat:@"%zd",model.messageid]]) {
                [array addObject:[NSString stringWithFormat:@"%zd",model.messageid]];
                [array writeToFile:PATHNAME atomically:YES];
            }
        };
        [myTableView reloadData];
    }
    [self clickEdit];
}

#pragma mark titleForDeleteConfirmationButtonForRowAtIndexPath
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (myTableView.editing) {
        return UITableViewCellEditingStyleNone;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

@end

