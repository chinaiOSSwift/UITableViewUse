//
//  FirstTableViewCell.m
//  二级列表
//
//  Created by KOCHIAEE6 on 2019/5/24.
//  Copyright © 2019 KOCHIAEE6. All rights reserved.
//

#import "FirstTableViewCell.h"
#import "MyDataPicker.h"

@interface FirstTableViewCell()
@property (weak, nonatomic) IBOutlet MyDataPicker *dataView;
@property (nonatomic, strong)NSDate *selectedDate;

@end

@implementation FirstTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    [self.dataView setDatePickerMode:UIDatePickerModeTime];
    [self.dataView addTarget:self action:@selector(datePickerDateChanged:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)datePickerDateChanged:(MyDataPicker *)paramDatePicker{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedData:)]) {
        [self.delegate selectedData:paramDatePicker];
    }
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    self.dataView.indexPath = indexPath;
}



@end
