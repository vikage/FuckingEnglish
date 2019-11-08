//
//  Category.h
//  FuckingEnglish
//
//  Created by Thanh Vu on 11/7/19.
//  Copyright © 2019 fuxsociety. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Category : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* value;

- (instancetype)initWithDictionary:(NSDictionary*)dict;
@end

NS_ASSUME_NONNULL_END
