//
//  QNSPromitView.h
//  NQSPromitView
//
//  Created by 李旭洲 on 16/3/4.
//  Copyright © 2016年 李旭洲. All rights reserved.
//
#pragma mark - 用前必读
/******************************************************************
 必须导入Masonry框架！如不知道是啥请百度
 此demo为菜鸟所写，用前请慎重，你可以修改原代码！
 如果造成身体上的不适后果自负！
 ******************************************************************/

#import <UIKit/UIKit.h>
@class QNSPromitView;
typedef void(^QNSPromitViewHandler)(QNSPromitView *alertView);

@interface QNSPromitView : UIView


{
@private
    NSString                *_alertTitle;
    NSString                *_alertBody;
    BOOL                    _bNeedNo;
    QNSPromitViewHandler      _doYes;
    QNSPromitViewHandler      _doNo;
    QNSPromitViewHandler      _doDone;
    UIWindow                *_alertWindow;
    UIView                  *_vAlert;
}

@property (readonly) int nTag;

//title，text，confirmButton，cancelButton
- (instancetype)doYesNo:(NSString *)strTitle
                   body:(NSString *)strBody
                    yes:(QNSPromitViewHandler)yes
                     no:(QNSPromitViewHandler)no;

//title，text，confirmButton
- (instancetype)doYes:(NSString *)strTitle
                   body:(NSString *)strBody
                    yes:(QNSPromitViewHandler)yes;


//text，confirmButton
- (instancetype)doYes:(NSString *)strBody
                  yes:(QNSPromitViewHandler)yes;

@end

