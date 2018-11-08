//
//  DataManager.h
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/7/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vocabulary.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface DataManager : NSObject
+(instancetype) shareInstanced;

-(Vocabulary *) getAnyVocabulary;
-(NSArray<Vocabulary *> *) allVocabulary;
@end

