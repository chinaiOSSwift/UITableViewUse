//
//  TimerSectionView.h
//  二级列表
//
//  Created by KOCHIAEE6 on 2019/5/24.
//  Copyright © 2019 KOCHIAEE6. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerSectionView : UITableViewHeaderFooterView
- (void)addTarget:(id)target action:(nonnull SEL)action tag:(NSInteger)tag;
- (void)leftStr:(NSString *)leftStr rightStr:(NSString *)rightStr;
@end

NS_ASSUME_NONNULL_END
