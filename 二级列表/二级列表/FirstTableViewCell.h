//
//  FirstTableViewCell.h
//  二级列表
//
//  Created by KOCHIAEE6 on 2019/5/24.
//  Copyright © 2019 KOCHIAEE6. All rights reserved.
//


#import <UIKit/UIKit.h>
@class MyDataPicker;
@protocol FirstTableViewCellDelegate <NSObject>

-(void)selectedData:(MyDataPicker *)datePick;
@end




NS_ASSUME_NONNULL_BEGIN

@interface FirstTableViewCell : UITableViewCell
@property(nonatomic, weak)id<FirstTableViewCellDelegate>delegate;

@property(nonatomic, strong)NSIndexPath *indexPath;
@end

NS_ASSUME_NONNULL_END
