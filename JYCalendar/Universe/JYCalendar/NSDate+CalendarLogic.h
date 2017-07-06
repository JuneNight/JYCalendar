//
//  NSDate+CalendarLogic.h
//  JYCalendar
//
//  Created by 张涛 on 16/8/1.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CalendarLogic)

//当前月有几天
- (NSInteger)numberOfDaysInCurrentMonth;

//第一周有几天
- (NSInteger)numberOfDaysInFirstWeek;

//第一天是周几
- (NSDate *)firstDayOfCurrentMonth;

//这个月第一天是周几
- (NSInteger)weeklyOrdinality;

//当前月的最后一天日期
- (NSDate *)lastDayOfCurrentMonth;

//当前月有几周
- (NSInteger)numberOfWeeksInCurrentMonth;

//获取当前日期之后的几个天
- (NSDate *)dayInTheFollowingDay:(int)day;

//获取当前日期之后的几个月
- (NSDate *)dayInTheFollowingMonth:(int)month;

//上一个月
- (NSDate *)dayInThePreviousMonth;

//下一个月
- (NSDate *)dayInTheFollowingMonth;

//获取年月日对象
- (NSDateComponents *)JYComponents;

//周日是“1”，周一是“2”...
-(NSInteger)getWeekIntValueWithDate;

//判断日期是今天,明天,后天,周几
-(NSString *)compareIfTodayWithDate;

//NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date;

//NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)dateString;

@end
