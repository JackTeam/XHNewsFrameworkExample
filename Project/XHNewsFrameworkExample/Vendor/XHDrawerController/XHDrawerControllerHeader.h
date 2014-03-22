//
//  XHDrawerControllerHeader.h
//  XHDrawerController
//
//  Created by 曾 宪华 on 13-12-27.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#ifndef XHDrawerController_XHDrawerControllerHeader_h
#define XHDrawerController_XHDrawerControllerHeader_h
static const CGFloat XHContentContainerViewOriginX = 180.0f;

static inline void xh_UIViewSetFrameOriginX(UIView *view, CGFloat originX) {
    [view setFrame:CGRectMake(originX, CGRectGetMinY([view frame]), CGRectGetWidth([view frame]), CGRectGetHeight([view frame]))];
}

#endif
