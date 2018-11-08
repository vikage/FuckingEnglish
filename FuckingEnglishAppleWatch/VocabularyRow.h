//
//  VocabularyRow.h
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/7/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
@interface VocabularyRow : NSObject
@property (nonatomic, strong) IBOutlet WKInterfaceLabel *wordLabel;
@property (nonatomic, strong) IBOutlet WKInterfaceLabel *meanLabel;
@end
