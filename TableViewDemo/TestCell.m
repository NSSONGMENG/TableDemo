//
//  TestCell.m
//  TableViewDemo
//
//  Created by songmeng on 16/11/27.
//  Copyright © 2016年 songmeng. All rights reserved.
//

#import "TestCell.h"
#import "Masonry.h"

@interface TestCell ()

@property (nonatomic, strong) UILabel   * titleLab;
@property (nonatomic, strong) UILabel   * detaiLab;
@property (nonatomic, strong) UIView    * bottomLine;

@end

@implementation TestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubview];
    }
    return self;
}


/**
 创建并添加子视图
 */
- (void)createSubview{
    [self addSubview:self.titleLab];
    [self addSubview:self.detaiLab];
    [self addSubview:self.bottomLine];
    [self layoutSubview];
}


/**
 给子视图添加约束
 */
- (void)layoutSubview{
    /**
        请仔细看两个控件之间以及它们和父视图的约束，主要是top和bottom之间的约束
        1、titleLab在上面，距离父视图上方和左边各10像素
        2、detailLab在titleLab下面，距离titleLab 8像素，左边和titleLab对齐，切底部距离bottomLine 10像素
        3、bottomLine在最下面，左右和底都和父视图对齐，高度为1
     Label是个好玩的东西，如果有文本，则label有高度，如果内容为空，则高度为0，我们就是利用了它们的这个特性来省区计算高度的步骤
     * 当然，为了使其能自适应高度，我们一般会把label的宽度约束死
     */
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-15);
    }];
    [self.detaiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(8);
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detaiLab.mas_bottom).offset(10);
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

#pragma  mark  - setter

- (void)setTitle:(NSString *)title{
    _title = title;
    _titleLab.text = title;
}

- (void)setDetail:(NSString *)detail{
    _detail = detail;
    _detaiLab.text = detail;
}




#pragma  mark  - getter
- (UILabel *)titleLab{
    if (!_titleLab){
        _titleLab = [UILabel new];
//        _titleLab.textColor = [UIColor blackColor];
        _titleLab.numberOfLines = 1;    //title只显示一行
    }
    return _titleLab;
}

- (UILabel *)detaiLab{
    if (!_detaiLab) {
        _detaiLab = [UILabel new];
        _detaiLab.font = [UIFont systemFontOfSize:13];
        _detaiLab.textColor = [UIColor darkGrayColor];
        _detaiLab.numberOfLines = 0;    //detail可显示若干行
    }
    return _detaiLab;
}

- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _bottomLine;
}

@end
