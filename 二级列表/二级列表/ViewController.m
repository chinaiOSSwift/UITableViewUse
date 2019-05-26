//
//  ViewController.m
//  二级列表
//
//  Created by KOCHIAEE6 on 2019/5/24.
//  Copyright © 2019 KOCHIAEE6. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewCell.h"
#import "TimerSectionView.h"

#import "MyDataPicker.h"

static NSString * const FIRSTCELL = @"FirstTableViewCellName";
/**section identifier*/
static NSString * const SECTIONTITLENAME = @"TimerSectionViewName";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,FirstTableViewCellDelegate>
@property(nonatomic, strong)UITableView *setTimerTableView;
@property(nonatomic, strong)NSMutableArray *firstArr;
@property(nonatomic, strong)NSMutableArray *status;
@end

@implementation ViewController


- (NSMutableArray *)firstArr{
    if (!_firstArr) {
        _firstArr = [NSMutableArray arrayWithCapacity:1];
        
        _status = [NSMutableArray arrayWithCapacity:1];
        
        [_firstArr addObject:@"Strar at"];
        [_firstArr addObject:@"End at"];
        [_firstArr addObject:@"Repeat every"];
        [_firstArr addObject:@"Full charge"];
        for (int i = 0; i < 4; i ++) {
            [_status addObject:@0];
        }
        
    }
    return _firstArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    //[tableView registerNib:[UINib nibWithNibName:@"SectionView" bundle:nil] forHeaderFooterViewReuseIdentifier:SECTIONTITLENAME];
    [tableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil] forCellReuseIdentifier:FIRSTCELL];
    [tableView registerClass:NSClassFromString(@"TimerSectionView") forHeaderFooterViewReuseIdentifier:SECTIONTITLENAME];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    _setTimerTableView = tableView;
    [self.view addSubview:tableView];
    
    
    
    
    
    
}


#pragma mark - 代理协议方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.firstArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSNumber *number = self.status[section];
    if (number.integerValue == 0) { // 关闭
        return 0;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FIRSTCELL forIndexPath:indexPath];
    cell.delegate = self;
    cell.indexPath = indexPath;
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TimerSectionView *sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:SECTIONTITLENAME];
    if (sectionView == nil) {
        NSLog(@"13456543234");
        sectionView = [[TimerSectionView alloc]initWithReuseIdentifier:SECTIONTITLENAME];
    }
    [sectionView addTarget:self action:@selector(sectionViewClick:) tag:1000 + section];
    [sectionView leftStr:self.firstArr[section] rightStr:@""];
    return sectionView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//    static NSString *hIdentifier = @"hIdentifier";
//
//    UITableViewHeaderFooterView *view= [tableView dequeueReusableHeaderFooterViewWithIdentifier:hIdentifier];
//    if(view==nil){
//        NSLog(@"qweruytrewertyuyt");
//        view = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
//        view.backgroundColor = [UIColor yellowColor];
//
//        for (int i=0; i<3; i++) {
//            UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(i*105, 0, 100, 38)];
//            btn.backgroundColor = [UIColor redColor];
//            [btn setTitle:[NSString stringWithFormat:@"header-%d",i] forState:UIControlStateNormal];
//            //[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//            [view addSubview:btn];
//        }
//    }
//    return view;
//}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 182;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0f;
}

- (void)sectionViewClick:(UITapGestureRecognizer *)tapGes{
    UIView *tapView = tapGes.view;
    NSNumber *number = self.status[tapView.tag - 1000];
    if (number.integerValue == 0) {
        number = @1;
    }else{
        number = @0;
    }
    [self.status replaceObjectAtIndex:tapView.tag - 1000 withObject:number];
    [self.setTimerTableView reloadSections:[NSIndexSet indexSetWithIndex:tapView.tag - 1000] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)selectedData:(MyDataPicker *)datePick{
    NSLog(@"section:%d---row:%d--时间:%@",datePick.indexPath.section,datePick.indexPath.row,datePick.date);
    TimerSectionView* sectionView = (TimerSectionView*)[self.setTimerTableView headerViewForSection:datePick.indexPath.section];
    UILabel *leftLabel = [sectionView viewWithTag:2000];
    leftLabel.text = [NSString stringWithFormat:@"%@",datePick.date];
    
}



@end
