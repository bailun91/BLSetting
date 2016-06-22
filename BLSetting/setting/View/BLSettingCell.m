//
//  BLSettingCell.m
//  BLSetting
//
//  Created by 蔡瑶 on 16/4/27.
//  Copyright © 2016年 bailun91. All rights reserved.
//

#import "BLSettingCell.h"
#import "BLConstFile.h"
#import "BLSettingItemModel.h"

@interface BLSettingCell()

@property (nonatomic,strong) UILabel *funcNameLabel;

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIImageView *indicator;

@property (nonatomic,strong) UISwitch *aswitch;

@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong) UIImageView *detailImageView;

@end

@implementation BLSettingCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"BLSettingCell";
    
    BLSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[BLSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


-(void)setModel:(BLSettingItemModel *)model
{
    _model = model;
//    NSLog(@"%@",MainScreenW);
    
    [self setupUI];
}

- (void)setupUI
{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //如果有图片
    if (self.model.imgName) {
        [self setupImgView];
    }
    //功能名称
    if (self.model.funcName) {
        [self setupFuncLabel];
    }
    
    //accessoryType
    if (self.model.accessoryType) {
        [self setupAccessoryType];
    }
    //detailView
    if (self.model.detailText) {
        [self setupDetailText];
    }
    
    if (self.model.detailImageName) {
        [self setupDetailImage];
    }
    if (self.model.jumpClass) {
        [self setupJumpClass];
    }
    
    //bottomLine
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - 1, MainScreenW, 1)];
    line.backgroundColor = BlColorRGBA(234, 234, 234, 1);
    [self.contentView addSubview:line];
    
}

-(void)setupDetailImage
{
    self.detailImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.model.detailImageName]];
    self.detailImageView.centerY = self.contentView.centerY;
    switch (self.model.accessoryType) {
            
        case BLAccessoryTypeNone:
            
            self.detailImageView.x = MainScreenW - self.detailImageView.width - DetailViewToIndicatorGap - 2;
            
            break;
        case BLAccessoryTypeDisclosureIndicator:
            self.detailImageView.x = self.indicator.x - self.detailImageView.width - DetailViewToIndicatorGap;
            break;
        case BLAccessoryTypeSwitch:
            self.detailImageView.x = self.aswitch.x - self.detailImageView.width;
            break;
        default:
            break;
    }
    [self.contentView addSubview:self.detailImageView];
}

- (void)setupDetailText
{
    self.detailLabel = [[UILabel alloc]init];
    self.detailLabel.text = self.model.detailText;
    self.detailLabel.textColor = BlColorRGBA(142, 142, 142, 1);
    self.detailLabel.font = [UIFont systemFontOfSize:DetailLabelFont];
    self.detailLabel.size = [self sizeForTitle:self.model.detailText withFont:self.detailLabel.font];
    self.detailLabel.centerY = self.contentView.centerY;
    
    switch (self.model.accessoryType) {
        case BLAccessoryTypeNone:
            self.detailLabel.x = MainScreenW - self.detailLabel.width - DetailViewToIndicatorGap - 2;
            break;
        case BLAccessoryTypeDisclosureIndicator:
            self.detailLabel.x = self.indicator.x - self.detailLabel.width - DetailViewToIndicatorGap;
            break;
        case BLAccessoryTypeSwitch:
            self.detailLabel.x = self.aswitch.x - self.detailLabel.width - DetailViewToIndicatorGap;
            break;
        default:
            break;
    }
    
    [self.contentView addSubview:self.detailLabel];
}


- (void)setupAccessoryType
{
    switch (self.model.accessoryType) {
        case BLAccessoryTypeNone:
            break;
        case BLAccessoryTypeDisclosureIndicator:
            [self setupIndicator];
            break;
        case BLAccessoryTypeSwitch:
            [self setupSwitch];
            break;
        default:
            break;
    }
}

- (void)setupSwitch
{
    [self.contentView addSubview:self.aswitch];
}

- (void)setupIndicator
{
    [self.contentView addSubview:self.indicator];
    
}

- (void)setupImgView
{
    self.imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.model.imgName]];
    self.imgView.x = FuncImgToLeftGap;
    self.imgView.centerY = self.contentView.centerY;
    [self.contentView addSubview:self.imgView];
}

- (void)setupFuncLabel
{
    self.funcNameLabel = [[UILabel alloc]init];
    self.funcNameLabel.text = self.model.funcName;
    self.funcNameLabel.textColor = BlColorRGBA(51, 51, 51, 1);
    self.funcNameLabel.font = [UIFont systemFontOfSize:FuncLabelFont];
    self.funcNameLabel.size = [self sizeForTitle:self.model.funcName withFont:self.funcNameLabel.font];
    self.funcNameLabel.centerY = self.contentView.centerY;
    self.funcNameLabel.x = CGRectGetMaxX(self.imgView.frame) + FuncLabelToFuncImgGap;
    [self.contentView addSubview:self.funcNameLabel];
}

- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
    
    return CGSizeMake(titleRect.size.width,
                      titleRect.size.height);
}


- (void)setupJumpClass
{
    
}
- (UIImageView *)indicator
{
    if (!_indicator) {
        _indicator = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-arrow1"]];
        _indicator.centerY = self.contentView.centerY;
        _indicator.x = MainScreenW - _indicator.width - IndicatorToRightGap;
    }
    return _indicator;
}

- (UISwitch *)aswitch
{
    if (!_aswitch) {
        _aswitch = [[UISwitch alloc]init];
        _aswitch.centerY = self.contentView.centerY;
        _aswitch.x = MainScreenW - _aswitch.width - IndicatorToRightGap;
        [_aswitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
    }
    return _aswitch;
}

- (void)switchTouched:(UISwitch *)sw
{
    __weak typeof(self) weakSelf = self;
    self.model.switchValueChanged(weakSelf.aswitch.isOn);
}
@end
