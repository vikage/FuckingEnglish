//
//  InterfaceController.h
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/6/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfaceTable *categoryTable;
@end
