//
//  InterfaceController.m
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/6/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import "InterfaceController.h"
#import "Category.h"
#import "CategoryRow.h"
#import "DataManager.h"
#import "Vocabulary.h"
#import <AVFoundation/AVFoundation.h>

@interface InterfaceController ()
@property (nonatomic, strong) NSArray<Vocabulary*>* vocabularies;
@property (nonatomic, strong) NSArray<Category*>* categories;
@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];

    [self reloadTable];
    // Configure interface objects here.
}

- (void)willActivate
{
    [super willActivate];
}

- (void)reloadTable
{
    self.categories = [[DataManager shareInstanced] categories];
    [self.categoryTable setNumberOfRows:self.categories.count withRowType:@"CategoryRow"];
    for (int i = 0; i < self.categories.count; i++) {
        Category* category = [self.categories objectAtIndex:i];
        CategoryRow* row = [self.categoryTable rowControllerAtIndex:i];
        [row bindData:category];
    }
}

- (void)table:(WKInterfaceTable*)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    Category* selectedCategory = [self.categories objectAtIndex:rowIndex];
    [[DataManager shareInstanced] setSelectedCategoryValue:selectedCategory.value];
    [self reloadTable];
    [self reloadComplication];
}

- (void)didDeactivate
{
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)reloadComplication
{
    CLKComplicationServer* server = [CLKComplicationServer sharedInstance];
    for (CLKComplication* complication in server.activeComplications) {
        [server reloadTimelineForComplication:complication];
    }
}
@end
