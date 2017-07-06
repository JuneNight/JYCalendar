//
//  JYCalendarView.m
//  JYCalendar
//
//  Created by 张涛 on 16/7/29.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "JYCalendarView.h"
#import "JYCalendarCell.h"
#import "JYCalendarLogic.h"

@interface JYCalendarView()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (retain, nonatomic) UICollectionView *collectionView;

@property (nonatomic, retain) NSMutableArray *dataSource;

@property (nonatomic, retain) UIView *headView;
@property (nonatomic, retain) UILabel *dateLabel;

@end

@implementation JYCalendarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headView];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)reloadJYCalendar
{
    [self.dataSource addObjectsFromArray:[self getMonthArrayOfDays:365]];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataSource[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JYCalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JYCalendarCell" forIndexPath:indexPath];
    cell.calendarDay = self.dataSource[indexPath.section][indexPath.row];
    return cell;
}

#pragma  mark - UIScrollView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger section = scrollView.contentOffset.y / (ITEMSIZE *5);
    CalendarDayModel *calendarDay = self.dataSource[section][10];
    self.dateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",calendarDay.year,calendarDay.month];
    
}

#pragma mark - LazyLoad
- (UICollectionView *)collectionView
{
    if (nil == _collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(ITEMSIZE, ITEMSIZE);
        layout.headerReferenceSize = CGSizeMake(UI_Screen_Width, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 0.0f;
        layout.minimumInteritemSpacing = 0.0f;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, UI_Screen_Width, ITEMSIZE *5) collectionViewLayout:layout];
        _collectionView.contentSize = CGSizeMake(UI_Screen_Width, ITEMSIZE *5);
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate =self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JYCalendarCell class]) bundle:nil] forCellWithReuseIdentifier:@"JYCalendarCell"];
    }
    
    return _collectionView;
}

- (NSMutableArray *)dataSource
{
    if (nil == _dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSMutableArray *)getMonthArrayOfDays:(int )days
{
    NSDate *date = [NSDate date];
    JYCalendarLogic *logic = [[JYCalendarLogic alloc] init];
    return [logic getCalendarDataSource:date selectedDate:nil needDays:days];
}

- (UIView *)headView
{
    if (nil == _headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UI_Screen_Width, 50)];
        _headView.backgroundColor = [UIColor clearColor];
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, UI_Screen_Width, 20)];
        self.dateLabel.font = [UIFont systemFontOfSize:16.];
        self.dateLabel.textColor = [UIColor redColor];
        self.dateLabel.text = [NSDate stringFromDate:[NSDate date]];
        [_headView addSubview:self.dateLabel];
        NSArray *items = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
        for (int i =0; i < 7; i++) {
            UILabel *item = [[UILabel alloc] initWithFrame:CGRectMake(ITEMSIZE *i, 20, ITEMSIZE, 30)];
            item.textAlignment = NSTextAlignmentCenter;
            item.backgroundColor = [UIColor clearColor];
            item.font = [UIFont systemFontOfSize:15.];
            item.textColor = [UIColor blackColor];
            item.text = items[i];
            [_headView addSubview:item];
        }
    }
    return _headView;
}

@end
