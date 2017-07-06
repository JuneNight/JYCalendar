//
//  JYCalendarLogic.h
//  JYCalendar
//
//  Created by 张涛 on 16/8/1.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarDayModel.h"
@interface JYCalendarLogic : NSObject

- (NSMutableArray *)getCalendarDataSource:(NSDate *)date selectedDate:(NSDate *)selectedDate needDays:(int)days;
- (void)selectLogic:(CalendarDayModel *)day;
@end
