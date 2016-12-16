//
//  TestXIBCell.m
//  TableViewDemo
//
//  Created by songmeng on 16/12/16.
//  Copyright © 2016年 songmeng. All rights reserved.
//

#import "TestXIBCell.h"

@interface TestXIBCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;

@end

@implementation TestXIBCell


- (void)setTitle:(NSString *)title{
    _title = title;
    _titleLab.text = title;
}

- (void)setDetail:(NSString *)detail{
    _detail = detail;
    _detailLab.text = detail;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
