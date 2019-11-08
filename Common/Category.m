//
//  Category.m
//  FuckingEnglish
//
//  Created by Thanh Vu on 11/7/19.
//  Copyright © 2019 fuxsociety. All rights reserved.
//

#import "Category.h"

@implementation Category
- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        self.name = dict[@"name"];
        self.value = dict[@"value"];
    }
    return self;
}
@end
