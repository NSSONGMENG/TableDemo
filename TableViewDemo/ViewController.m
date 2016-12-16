//
//  ViewController.m
//  TableViewDemo
//
//  Created by songmeng on 16/11/27.
//  Copyright © 2016年 songmeng. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"
#import "TestXIBCell.h"
#import "Masonry.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView   * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(20);
    }];
}

#pragma  mark  - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //估算高度，添加此方法后，cellForRow方法和heightForRow方法的执行顺序将颠倒
    return 20.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * testCellIdent = @"test_cell";
    static NSString * testXIBCellIdent  = @"text_xib_cell";
    if (indexPath.section == 0) {
        TestCell    * cell = [tableView dequeueReusableCellWithIdentifier:testCellIdent];
        if (!cell) {
            cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:testCellIdent];
        }
        cell.title = [NSString stringWithFormat:@"row : %ld -- section : %ld",indexPath.row,indexPath.section];
        if (!cell.detail) {
            cell.detail = @"生活如此美好，再也不用计算高度了^.^ ";
        }else{
            if (cell.detail.length <= 66) {
                //别太多，看着眼花
                cell.detail = [cell.detail stringByAppendingString:cell.detail];
            }
        }
        return cell;
    }
    else{
        TestXIBCell * cell = [tableView dequeueReusableCellWithIdentifier:testXIBCellIdent];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TestXIBCell" owner:self options:nil] firstObject];
        }
        cell.title = [NSString stringWithFormat:@"row : %ld -- section : %ld",indexPath.row,indexPath.section];
        if (!cell.detail) {
            cell.detail = @"生活如此美好，再也不用计算高度了^.^ ";
        }else{
            if (cell.detail.length <= 88) {
                cell.detail = [cell.detail stringByAppendingString:cell.detail];
            }
        }
        return cell;
    }
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        TestCell    * cell = (TestCell *)[tableView cellForRowAtIndexPath:indexPath];
//        cell.title = [NSString stringWithFormat:@"row : %ld -- section : %ld",indexPath.row,indexPath.section];
//        if (!cell.detail) {
//            cell.detail = @"生活如此美好，再也不用计算高度了^.^ ";
//        }else{
//            if (cell.detail.length <= 88) {
//                cell.detail = [cell.detail stringByAppendingString:cell.detail];
//            }
//        }
//    }else{
//        TestXIBCell * cell = (TestXIBCell *)[tableView cellForRowAtIndexPath:indexPath];
//        cell.title = [NSString stringWithFormat:@"row : %ld -- section : %ld",indexPath.row,indexPath.section];
//        if (!cell.detail) {
//            cell.detail = @"生活如此美好，再也不用计算高度了^.^ ";
//        }else{
//            if (cell.detail.length <= 88) {
//                cell.detail = [cell.detail stringByAppendingString:cell.detail];
//            }
//        }
//    }
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * lab = [UILabel new];
    lab.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    lab.textColor = [UIColor whiteColor];
    if (section == 0) {
        lab.text = @"手写约束";
    }else{
        lab.text = @"xib约束";
    }
    return lab;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma  mark  - getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
