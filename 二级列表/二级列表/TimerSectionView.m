//
//  TimerSectionView.m
//  二级列表
//
//  Created by KOCHIAEE6 on 2019/5/24.
//  Copyright © 2019 KOCHIAEE6. All rights reserved.
//

#import "TimerSectionView.h"

@interface TimerSectionView()
@property(nonatomic, strong)UILabel *leftLabel;
@end

@implementation TimerSectionView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setUpViews];
        
        
    }
    return self;
}

- (void)setUpViews{
    CGFloat sectionHeigth = self.contentView.frame.size.height;
    CGFloat sectionWidth = self.contentView.frame.size.width;
    //NSLog(@"width--%lf hegith--%lf",sectionWidth,sectionHeigth);
    UIView *topSpaceView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 2)];
    topSpaceView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:topSpaceView];
    
    UILabel *leftLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 250, 20)];
    leftLB.textAlignment = NSTextAlignmentLeft;
    leftLB.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:leftLB];
    leftLB.font = [UIFont boldSystemFontOfSize:16];
    leftLB.tag = 2000;
    _leftLabel = leftLB;
}

- (void)addTarget:(id)target action:(nonnull SEL)action tag:(NSInteger)tag{
    self.contentView.tag = tag;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    self.contentView.userInteractionEnabled = true;
    [self.contentView addGestureRecognizer:tapGes];
}


- (void)leftStr:(NSString *)leftStr rightStr:(NSString *)rightStr{
    self.leftLabel.text = leftStr;
}

@end
