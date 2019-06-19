//
//  XjhColorSizeFuncHeader.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#ifndef XjhColorSizeFuncHeader_h
#define XjhColorSizeFuncHeader_h

#define WeakSelf  __weak typeof(self) weakSelf = self

/////////---------------------------------------Func
//----------------------------自定义
///方法
#define UIimageName(A) [UIImage imageNamed:A]
///MB提示框时间
#define showtime 1.5
///判读字符串 空的返回@“”
#define STRINGNOTNIL(string) string.length==0?@"":string
//字符串防控
#define isStrEmpty(string) (string == nil || string == NULL || (![string isKindOfClass:[NSString class]]) || ([string isEqual:@""]) || [string isEqualToString:@""] || [string isEqualToString:@" "] || ([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0))
//数组防控
#define isArrEmpty(array) (array == nil || array == NULL || (![array isKindOfClass:[NSArray class]]) || array.count == 0)

//-----------------------------系统

// View 圆角
#define XViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

// View 边框
#define XViewBord(View, Color, Width)\
\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:(Color).CGColor]


//UerDefail
#define UserGetObject(key)  [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define UserSetObject(ob,key)  [[NSUserDefaults standardUserDefaults] setObject:ob forKey:key]
//字体大小IPH
#define UiFontIPH(num) [UIFont systemFontOfSize:IPHONEWIDTH(num)]
//字体大小sys
#define UiFontSys(num) [UIFont systemFontOfSize:num]

/////////---------------------------------------Color

#define ColorRGB(r,g,b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

#define HexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]
#define ColorloginGray [UIColor colorWithHexString:@"#848484"]
#define Colorblack [UIColor colorWithHexString:@"#333333"]
#define ColorYellowHui [UIColor colorsWithRed:254 green:187 blue:8]
///酒红色
#define ColorRedJiuHong ColorRGB(97, 4, 17)
#define CollorRedHui [UIColor colorsWithRed:185 green:0 blue:20]
#define ColorGreenHui [UIColor colorWithHexString:@"007700"]
#define ColorWhite  [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0]
#define Colorgray  [UIColor colorWithHexString:@"#6A6E76"]
#define ColorbackGround [UIColor colorWithRed:236/255.0 green:239/255.0 blue:241/255.0 alpha:1/1.0]
#define ColorLightGray  [UIColor colorWithRed:71/255.0 green:93/255.0 blue:114/255.0 alpha:1/1.0]
#define ColorGrayQian [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1/1.0]
#define ColorOrange [UIColor colorWithRed:243/255.0 green:104/255.0 blue:25/255.0 alpha:1/1.0]
#define ColorOrangeQian [UIColor colorsWithRed:229 green:140 blue:49]
#define ColorBlueLight  [UIColor colorsWithRed:59 green:84 blue:245]
#define ColorBlue [UIColor colorWithRed:64/255.0 green:158/255.0 blue:255/255.0 alpha:1/1.0]
#define ColorBlueDark [UIColor colorWithRed:10/255.0 green:86/255.0 blue:139/255.0 alpha:1/1.0]
#define ColorBlueQian [UIColor colorWithRed:64/255.0 green:158/255.0 blue:255/255.0 alpha:0.7/1.0]
#define ColorBlueQianQian  [UIColor colorWithRed:64/255.0 green:158/255.0 blue:255/255.0 alpha:0.3/1.0]
#define ColorClear [UIColor clearColor]
#define ColorCellLine [UIColor colorWithHexString:@"#d8d8d8" ]
#define ColoePurPleQian [UIColor colorsWithRed:135 green:69 blue:163]
/////////---------------------------------------Size
//状态栏、导航栏、工具栏高度
#define kDeviceStatusHeight  [UIApplication sharedApplication].statusBarFrame.size.height
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
#define kDeviceTabBarHeight self.tabBarController.tabBar.bounds.size.height
#define kDeviceNavHeight  [UIApplication sharedApplication].statusBarFrame.size.height + 44
//屏幕宽高
#define ScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define ScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)

//比例适配 返回整数 应对 label有小数时会有边框
#define IPHONEHIGHT(b) (int)([UIScreen mainScreen].bounds.size.height*((b)/1294.0))
#define IPHONEWIDTH(a) (int)([UIScreen mainScreen].bounds.size.width*((a)/750.0))


#endif /* XjhColorSizeFuncHeader_h */
