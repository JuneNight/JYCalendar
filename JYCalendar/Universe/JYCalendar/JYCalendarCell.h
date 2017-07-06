//
//  JYCalendarCell.h
//  JYCalendar
//
//  Created by 张涛 on 16/8/1.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarDayModel.h"

@interface JYCalendarCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *item;
@property (nonatomic, retain) CalendarDayModel *calendarDay;
@property (weak, nonatomic) IBOutlet UILabel *dateItem;

@end
