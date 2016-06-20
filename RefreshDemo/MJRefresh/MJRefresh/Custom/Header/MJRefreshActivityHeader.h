//
//  MJRefreshActivityHeader.h
//  RefreshDemo
//
//  Created by 曹小猿 on 16/6/18.
//  Copyright © 2016年 曹小猿. All rights reserved.
//

#import "MJRefreshStateHeader.h"

@interface MJRefreshActivityHeader : MJRefreshStateHeader
@property (weak, nonatomic, readonly) UIImageView *arrowView;
/** 菊花的样式 */
@property (assign, nonatomic) UIActivityIndicatorViewStyle activityIndicatorViewStyle;
@end
