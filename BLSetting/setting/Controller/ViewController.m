//
//  ViewController.m
//  BLSetting
//
//  Created by 蔡瑶 on 16/4/28.
//  Copyright © 2016年 bailun91. All rights reserved.
//

#import "ViewController.h"
#import "BLConstFile.h"
#import "BLSettingItemModel.h"
#import "BLSettingCell.h"
#import "BLSettingSectionModel.h"
#import "textViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)NSMutableArray * dataSource;

@end

@implementation ViewController
-(NSMutableArray *)dataSource
{
    if (_dataSource == nil)
    {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupSections];
    
}


- (void)setupSections
{
    
    //************************************section1
    BLSettingItemModel *item1 = [[BLSettingItemModel alloc]init];
    item1.funcName = @"我的任务1";
    item1.executeCode = ^{
        NSLog(@"我的任务1");
    };
    item1.imgName = @"user_set_icon_message@2x.png";
    item1.detailText = @"做任务赢大奖";
    item1.accessoryType = BLAccessoryTypeDisclosureIndicator;

    BLSettingItemModel *item2 = [[BLSettingItemModel alloc]init];
    item2.funcName = @"我的任务2";
    item2.imgName = @"user_set_icon_mall@2x.png";
    item2.accessoryType = BLAccessoryTypeDisclosureIndicator;
    
    BLSettingItemModel *item3 = [[BLSettingItemModel alloc]init];
    item3.funcName = @"我的任务3";
    item3.imgName = @"user_set_icon_wallet@2x.png";
    item3.accessoryType = BLAccessoryTypeDisclosureIndicator;
    
    BLSettingItemModel *item4 = [[BLSettingItemModel alloc]init];
    item4.funcName = @"我的任务4";
    item4.imgName = @"user_set_icon_offline@2x.png";
    item4.accessoryType = BLAccessoryTypeDisclosureIndicator;
    item4.jumpClass = [textViewController class];
    
    
    BLSettingItemModel *item5 = [[BLSettingItemModel alloc]init];
    item5.funcName = @"充值中心";
    item5.imgName = @"user_set_icon_promo@2x.png";
    item5.executeCode = ^{
        NSLog(@"充值中心");
    };
    item5.accessoryType = BLAccessoryTypeDisclosureIndicator;
    
    BLSettingItemModel *item6 = [[BLSettingItemModel alloc]init];
    item6.funcName = @"设置";
    item6.imgName = @"user_set_icon_game@2x.png";
    item6.executeCode = ^{
        
    };
    item6.accessoryType = BLAccessoryTypeDisclosureIndicator;
    
    BLSettingItemModel *item7 = [[BLSettingItemModel alloc]init];
    item7.funcName = @"接受通知";
    item7.imgName = @"user_set_icon_mail@2x.png";
    item7.switchValueChanged = ^(BOOL isOn)
    {
        NSLog(@"推送提醒开关状态===%@",isOn?@"open":@"close");
    };

    item7.accessoryType = BLAccessoryTypeSwitch;
    
    
    BLSettingSectionModel * section1 = [[BLSettingSectionModel alloc]init];
    section1.sectionHeaderHeight = 10;
    section1.itemArray = @[item1,item2];
    
    BLSettingSectionModel * section2 = [[BLSettingSectionModel alloc]init];
    section2.sectionHeaderHeight = 10;
    section2.itemArray = @[item3,item4];
    
    BLSettingSectionModel * section3 = [[BLSettingSectionModel alloc]init];
    section3.sectionHeaderHeight = 20;
    section3.itemArray = @[item5,item6,item7];
    
    NSArray * arr = @[section1,section2,section3];
    
    [self.dataSource addObjectsFromArray:arr];
    [self.tableView reloadData];
}


#pragma  mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BLSettingSectionModel * sectionModel = self.dataSource[section];
    return sectionModel.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BLSettingCell *cell = [BLSettingCell cellWithTableView:tableView];
   BLSettingSectionModel * sectionModel = self.dataSource[indexPath.section];
   cell.model = sectionModel.itemArray[indexPath.row];
    
    return cell;
}


#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    BLSettingSectionModel *sectionModel = self.dataSource[section];
    return sectionModel.sectionHeaderHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BLSettingSectionModel * sectionModel = self.dataSource[indexPath.section];
    BLSettingItemModel *itemModel  = sectionModel.itemArray[indexPath.row];
    
    if (itemModel.executeCode) {
        itemModel.executeCode();
        
    }else{

        UIViewController *vc = [[itemModel.jumpClass alloc] init];
        
        NSLog(@"%@",[itemModel.jumpClass class]);
        vc.title = itemModel.funcName;
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }

}

////uitableview处理section的不悬浮，禁止section停留的方法，主要是这段代码
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    BLSettingSectionModel *sectionModel = [self.dataSource firstObject];
//    CGFloat sectionHeaderHeight = sectionModel.sectionHeaderHeight;
//    
//    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}
@end

