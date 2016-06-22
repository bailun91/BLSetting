//
//  BLSettingItemModel.h
//  BLSetting
//
//  Created by 蔡瑶 on 16/4/27.
//  Copyright © 2016年 bailun91. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,BLAccessoryType) {
    BLAccessoryTypeNone,                   // don't show any accessory view
    BLAccessoryTypeDisclosureIndicator,    // the same with system DisclosureIndicator
    BLAccessoryTypeSwitch,                 //  swithch
};
@interface BLSettingItemModel : NSObject
@property (nonatomic,copy) NSString  *funcName;     /**<      功能名称*/
@property (nonatomic,copy) NSString *imgName;          /**< 功能图片名  */
@property (nonatomic,copy) NSString *detailText;    /**< 更多信息-提示文字  */
@property (nonatomic,copy) NSString *detailImageName;  /**< 更多信息-提示图片名  */
/**
 *  跳转的控制器名字
 */
@property (nonatomic, assign) Class jumpClass;


@property (nonatomic,assign)BLAccessoryType  accessoryType;    /**< accessory */
@property (nonatomic,copy) void (^executeCode)(); /**<      点击item要执行的代码*/
@property (nonatomic,copy) void (^switchValueChanged)(BOOL isOn); /**<  XBSettingAccessoryTypeSwitch下开关变化 */

@end
