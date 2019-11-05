//
//  ComplicationController.m
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/6/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import "ComplicationController.h"
#import "DataManager.h"
@interface ComplicationController ()

@end

@implementation ComplicationController

#pragma mark - Timeline Configuration

- (void)getSupportedTimeTravelDirectionsForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTimeTravelDirections directions))handler {
    handler(CLKComplicationTimeTravelDirectionForward);
}

- (void)getTimelineStartDateForComplication:(CLKComplication *)complication withHandler:(void(^)(NSDate * __nullable date))handler {
    handler(NSDate.date);
}

- (void)getTimelineEndDateForComplication:(CLKComplication *)complication withHandler:(void(^)(NSDate * __nullable date))handler {
    handler([NSDate.date dateByAddingTimeInterval:4*60*60]);
}

- (void)getPrivacyBehaviorForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationPrivacyBehavior privacyBehavior))handler {
    handler(CLKComplicationPrivacyBehaviorShowOnLockScreen);
}

#pragma mark - Timeline Population

- (void)getCurrentTimelineEntryForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTimelineEntry * __nullable))handler {
    CLKComplicationTimelineEntry *entry = [self entryForDate:[NSDate date]];
    handler(entry);
}

- (void)getTimelineEntriesForComplication:(CLKComplication *)complication beforeDate:(NSDate *)date limit:(NSUInteger)limit withHandler:(void(^)(NSArray<CLKComplicationTimelineEntry *> * __nullable entries))handler {
    // Call the handler with the timeline entries prior to the given date
    handler(nil);
}

- (void)getTimelineEntriesForComplication:(CLKComplication *)complication afterDate:(NSDate *)date limit:(NSUInteger)limit withHandler:(void(^)(NSArray<CLKComplicationTimelineEntry *> * __nullable entries))handler {
    NSMutableArray<CLKComplicationTimelineEntry*> *entries = [[NSMutableArray alloc] init];
    NSDate *nextDate = date;
    while (entries.count != 16) {
        nextDate = [nextDate dateByAddingTimeInterval:15*60];
        [entries addObject:[self entryForDate:nextDate]];
    }
    
    handler(entries);
}

- (CLKComplicationTimelineEntry*)entryForDate:(NSDate*)date {
    Vocabulary *vocabulary = [[DataManager shareInstanced] getAnyVocabulary];
    CLKComplicationTemplateModularLargeStandardBody *template = [[CLKComplicationTemplateModularLargeStandardBody alloc] init];
    NSString *header = [NSString stringWithFormat:@"%@•%@",vocabulary.word, vocabulary.pronunciation];
    NSString *categoryAndMean = [NSString stringWithFormat:@"%@•%@", vocabulary.category, vocabulary.mean];
    template.headerTextProvider = [CLKSimpleTextProvider textProviderWithText:header];
    template.body1TextProvider = [CLKSimpleTextProvider textProviderWithText:categoryAndMean];
    
    CLKComplicationTimelineEntry *entry = [CLKComplicationTimelineEntry entryWithDate:date complicationTemplate:template];
    return entry;
}

#pragma mark - Placeholder Templates

- (void)getLocalizableSampleTemplateForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTemplate * __nullable complicationTemplate))handler {
    // This method will be called once per supported complication, and the results will be cached
    
    CLKComplicationTemplateModularLargeStandardBody *t = [[CLKComplicationTemplateModularLargeStandardBody alloc] init];
    t.headerTextProvider = [CLKSimpleTextProvider textProviderWithText:@"English•ˈiNG(g)liSH"];
    t.body1TextProvider = [CLKSimpleTextProvider textProviderWithText:@"Tiếng anh"];
    
    handler(t);
}



@end
