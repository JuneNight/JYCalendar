//
//  JYCalendarCell.m
//  JYCalendar
//
//  Created by 张涛 on 16/8/1.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "JYCalendarCell.h"

@implementation JYCalendarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCalendarDay:(CalendarDayModel *)calendarDay
{
    _calendarDay = calendarDay;
    self.dateItem.text = [NSString stringWithFormat:@"%ld \n %@",calendarDay.day,calendarDay.Chinese_calendar];
    self.dateItem.hidden = calendarDay.style==CellDayTypeEmpty;
}

@end
