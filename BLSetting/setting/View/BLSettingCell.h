//
//  BLSettingCell.h
//  BLSetting
//
//  Created by 蔡瑶 on 16/4/27.
//  Copyright © 2016年 bailun91. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BLSettingItemModel;
@interface BLSettingCell : UITableViewCell
@property (strong,nonatomic) BLSettingItemModel * model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
