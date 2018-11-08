//
//  Utils.h
//  FuckingEnglish
//
//  Created by fuxsociety on 11/8/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

@end

NS_ASSUME_NONNULL_END
