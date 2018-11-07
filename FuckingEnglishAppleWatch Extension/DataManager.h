//
//  DataManager.h
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/7/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vocabulary.h"
@interface DataManager : NSObject
+(instancetype) shareInstanced;

-(Vocabulary *) getAnyVocabulary;
@end

