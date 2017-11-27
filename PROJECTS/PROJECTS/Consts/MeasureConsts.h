//
//  MeasureConsts.h
//  PROJECTS
//
//尺寸常量

#import <UIKit/UIKit.h>

/** 状态栏高度 */
#define msStateHeight ([UIScreen mainScreen].bounds.size.height == 812 ? 30 : 20)

/** 标题栏高度 */
UIKIT_EXTERN CGFloat const msTitleHeight;

/** 导航栏高度 */
#define msNavHeight (msStateHeight+44)

/** 左右一般间距 */
UIKIT_EXTERN CGFloat const msHMargin;

/** 上下一般间距 */
UIKIT_EXTERN CGFloat const msVMargin;

/** Button宽度 */
UIKIT_EXTERN CGFloat const msButtonWidth;

/** Button高度 */
UIKIT_EXTERN CGFloat const msButtonHeight;



