//
//  QNSPromitView.m
//  NQSPromitView
//
//  Created by 李旭洲 on 16/3/4.
//  Copyright © 2016年 李旭洲. All rights reserved.
//

#import "QNSPromitView.h"
#import "Masonry.h"
@interface QNSPromitView ()


@property (nonatomic, strong) UIButton *titleLable;
@property (nonatomic, strong) UILabel *promptLable;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UIView *conentView;

@end

@implementation QNSPromitView


- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.conentView];
    [self.conentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.bounds.size.height * 0.3);
        make.width.equalTo(@(self.bounds.size.width * 0.7));
        make.centerX.equalTo(self.mas_centerX);
    }];
    self.backgroundColor = [UIColor blackColor];
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
}


//title，text，confirmButton，cancelButton
- (instancetype)doYesNo:(NSString *)strTitle
                   body:(NSString *)strBody
                    yes:(QNSPromitViewHandler)yes
                     no:(QNSPromitViewHandler)no
{
    _alertTitle  = strTitle;
    _alertBody   = strBody;
    _doYes  = yes;
    _doNo   = no;
    [self setupUI];
    [self showAnimation];
    return self;
}
//title，text，confirmButton
- (instancetype)doYes:(NSString *)strTitle
                 body:(NSString *)strBody
                  yes:(QNSPromitViewHandler)yes
{
    _alertTitle  = strTitle;
    _alertBody   = strBody;
    _doYes       = yes;
    [self setupSecoundUI];
    return self;
}
//text，confirmButton
- (instancetype)doYes:(NSString *)strBody
                  yes:(QNSPromitViewHandler)yes
{
    _alertBody   = strBody;
    _doYes       = yes;
    [self setupThirdUI];
    return self;
}


- (void)setupUI {
    self.conentView.layer.cornerRadius = 5;
    self.conentView.layer.masksToBounds = YES;
    self.cancelButton.layer.cornerRadius = 0;
    self.cancelButton.layer.masksToBounds = YES;
    self.confirmButton.layer.cornerRadius = 0;
    self.confirmButton.layer.masksToBounds = YES;
    self.confirmButton.backgroundColor = [UIColor whiteColor];
    [self.confirmButton setTitleColor:[UIColor colorWithRed:49/255.0 green:198/255.0 blue:138/255.0 alpha:1] forState:UIControlStateNormal];
    self.confirmButton.layer.borderColor = [[UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1] CGColor];
    self.confirmButton.layer.borderWidth = 0.5;
    self.cancelButton.layer.borderColor = [[UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1] CGColor];
    self.cancelButton.layer.borderWidth = 0.5;
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.conentView.mas_top);
        make.right.equalTo(self.conentView.mas_right);
        make.left.equalTo(self.conentView.mas_left);
        make.height.equalTo(@(44));
    }];
    [self.promptLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.conentView.mas_right).offset(-10);
        make.left.equalTo(self.conentView.mas_left).offset(10);
        make.centerX.equalTo(self.conentView.mas_centerX);
        make.centerY.equalTo(self.conentView.mas_centerY);
        make.top.equalTo(self.titleLable.mas_bottom).offset(15);
    }];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.conentView.mas_centerX);
        make.left.equalTo(self.conentView.mas_left).offset(-1);
        make.bottom.equalTo(self.conentView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.conentView.mas_centerX);
        make.right.equalTo(self.conentView.mas_right);
        make.bottom.equalTo(self.conentView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
}


- (void)setupSecoundUI {
    self.conentView.layer.cornerRadius = 5;
    self.conentView.layer.masksToBounds = YES;
    //titleLable
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.conentView.mas_top);
        make.right.equalTo(self.conentView.mas_right);
        make.left.equalTo(self.conentView.mas_left);
        make.height.equalTo(@(44));
    }];
    //promptLable
    [self.promptLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.conentView.mas_right).offset(-10);
        make.left.equalTo(self.conentView.mas_left).offset(10);
        make.centerX.equalTo(self.conentView.mas_centerX);
        make.centerY.equalTo(self.conentView.mas_centerY);
        make.top.equalTo(self.titleLable.mas_bottom).offset(15);
    }];
    //confirmButton
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.conentView.mas_left).offset(-1);
        make.right.equalTo(self.conentView.mas_right).offset(1);
        make.bottom.equalTo(self.conentView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
}

- (void)setupThirdUI {
    self.conentView.layer.cornerRadius = 5;
    self.conentView.layer.masksToBounds = YES;
    [self.promptLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.conentView.mas_right).offset(-10);
        make.left.equalTo(self.conentView.mas_left).offset(10);
        make.top.equalTo(self.conentView.mas_top).offset(10);
    }];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.conentView.mas_left).offset(3);
        make.right.equalTo(self.conentView.mas_right).offset(-3);
        make.bottom.equalTo(self.conentView.mas_bottom).offset(-3);
        make.top.equalTo(self.promptLable.mas_bottom).offset(10);
        make.height.equalTo(@(35));
    }];
    
}

- (void)buttonTarget:(id)sender
{
    _nTag = (int)[sender tag];
    [self hideAnimation];
}

- (void)setLabelAttributes:(UILabel *)lb
{
    lb.backgroundColor = [UIColor clearColor];
    lb.textAlignment = NSTextAlignmentCenter;
    lb.numberOfLines = 0;
    lb.font = [UIFont systemFontOfSize:17];
    lb.textColor = [UIColor blackColor];
}

- (void)hideAlertView
{
    if (_doDone != nil)
        _doDone(self);
    else
    {
        if (_nTag == 100)
            _doYes(self);
        else
            _doNo(self);
    }
    [self removeFromSuperview];
    [_alertWindow removeFromSuperview];
    _alertWindow = nil;
}

- (void)showAnimation
{
    self.alpha = 0.0;
    double dDuration = 0.2;
    [UIView animateWithDuration:dDuration animations:^{
        self.alpha = 1.0;
        _vAlert.alpha = 1.0;
    }];
}

- (void)hideAnimation
{
    double dDuration = 0.2;
    [UIView animateWithDuration:dDuration animations:^{
        _vAlert.alpha = 0.0;
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self hideAlertView];
    }];
}

#pragma mark - 懒加载
- (UIButton *)titleLable {
    if (_titleLable == nil) {
        _titleLable = [UIButton buttonWithType:UIButtonTypeCustom];
        [_titleLable setTitle:_alertTitle forState:UIControlStateNormal];
        _titleLable.backgroundColor = [UIColor colorWithRed:49/255.0 green:198/255.0 blue:138/255.0 alpha:1];
        [self.conentView addSubview:_titleLable];
    }
    return _titleLable;
}
- (UILabel *)promptLable {
    if (_promptLable == nil) {
        _promptLable = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
        [_promptLable setNumberOfLines:0];
        _promptLable.lineBreakMode = UILineBreakModeWordWrap;
        _promptLable.text = _alertBody;
        UIFont *font = [UIFont fontWithName:@"Arial" size:12];
        CGSize size = CGSizeMake(320,2000);
        CGSize labelsize = [_promptLable.text sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
        _promptLable.textAlignment = NSTextAlignmentCenter;
        [_promptLable setFrame:CGRectMake(0, 0, labelsize.width, labelsize.height)];
        [self.conentView addSubview:_promptLable];
    }
    return _promptLable;
}

- (UIButton *)cancelButton {
    if (_cancelButton == nil) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_cancelButton.layer setBorderWidth:1.0];
        [_cancelButton.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [_cancelButton addTarget:self action:@selector(buttonTarget:) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton.tag = 200;
        [self.conentView addSubview:_cancelButton];
        _cancelButton.layer.cornerRadius = 5;
        _cancelButton.layer.masksToBounds = YES;
    }
    return _cancelButton;
}
- (UIButton *)confirmButton {
    if (_confirmButton == nil) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor colorWithRed:49/255.0 green:198/255.0 blue:138/255.0 alpha:1] forState:UIControlStateNormal];
        _confirmButton.backgroundColor = [UIColor whiteColor];
        [_confirmButton addTarget:self action:@selector(buttonTarget:) forControlEvents:UIControlEventTouchUpInside];
        _confirmButton.tag = 100;
        [self.conentView addSubview:_confirmButton];
        _confirmButton.layer.borderWidth = 0.5;
        _confirmButton.layer.borderColor = [[UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1] CGColor];
    }
    return _confirmButton;
}


- (UIView *)conentView {
    if (_conentView == nil) {
        _conentView = [[UIView alloc] init];
        _conentView.backgroundColor = [UIColor whiteColor];
    }
    return _conentView;
}

@end
