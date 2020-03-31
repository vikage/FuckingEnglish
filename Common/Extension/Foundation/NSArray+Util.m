//
//  NSArray+Util.m
//  FuckingEnglish
//
//  Created by Thanh Vu on 3/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import "NSArray+Util.h"

@implementation NSArray (Util)
- (NSArray *)shuffle {
    NSMutableArray *store = [[NSMutableArray alloc] initWithArray:self];
    for (NSUInteger i = store.count; i > 1; i--) {
        [store exchangeObjectAtIndex:i - 1 withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
    
    return store;
}
@end
