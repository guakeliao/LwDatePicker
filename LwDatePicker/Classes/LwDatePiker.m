//
//  LwDatePiker.m
//  Pods
//
//  Created by guakeliao on 16/9/20.
//
//

#import "LwDatePiker.h"

@interface LwDatePiker()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *pikerView;

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSDateComponents *dateComp;
@property (nonatomic, strong) NSCalendar *gregorian;

//data
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger day;
@property (nonatomic, assign) NSInteger hour;
@property (nonatomic, assign) NSInteger minute;
@property (nonatomic, assign) NSInteger second;

@end


@implementation LwDatePiker
@synthesize date = _date;


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self cominit];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self cominit];
    }
    return self;
}

-(void)cominit
{
    [self initWihtData];
    [self initWihtView];
    [self initWihtAction];
}

-(void)initWihtData
{
    self.dateFormatter = [[NSDateFormatter alloc]init];
    self.dateComp = [[NSDateComponents alloc]init];
    self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
}
-(void)initWihtView
{
    self.pikerView = [[UIPickerView alloc]init];
    self.pikerView.delegate = self;
    self.pikerView.dataSource = self;
    self.pikerView.showsSelectionIndicator = YES;
    self.pikerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.pikerView];
    NSLayoutConstraint *contraint1 = [NSLayoutConstraint constraintWithItem:self.pikerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *contraint2 = [NSLayoutConstraint constraintWithItem:self.pikerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    NSLayoutConstraint *contraint3 = [NSLayoutConstraint constraintWithItem:self.pikerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint *contraint4 = [NSLayoutConstraint constraintWithItem:self.pikerView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    //把约束添加到父视图上
    NSArray *array = [NSArray arrayWithObjects:contraint1, contraint2, contraint3, contraint4,nil];
    [self addConstraints:array];

}
-(void)initWihtAction
{
    self.date = [NSDate date];
    self.datePikerModel = LwDatePikerModelSecond;
}
#pragma mark
#pragma mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return (NSInteger)self.datePikerModel;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger count = 0;
    //year
    if (component == 0)
    {
        count = (2051-1970);
    }
    //month
    else if(component == 1)
    {
        count = 12;
    }
    //day
    else if (component == 2)
    {
        if (_month == 1 || _month == 3 || _month == 5 ||
            _month == 7 || _month == 8 || _month == 10 ||
            _month == 12)
        {
            count = 31;
        }
        else if( _month == 2)
        {
            if (((_year%4 == 0)&&(_year%100 != 0))||(_year%400 == 0))
            {
                count = 29;
            }
            else
            {
                count = 28;
            }
        }
        else
        {
            count = 30;
        }
    }
    else if (component == 3)
    {
        count = 24;
    }
    else if (component == 4)
    {
        count = 60;
    }
    else if (component == 5)
    {
        count = 60;
    }
    return count;
}

#pragma mark
#pragma mark UIPickerViewDelegate

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    CGRect rect = CGRectMake(0, 0, 70, 40);
    if (component == 0) {
        rect.size.width = 70;
    }else{
        rect.size.width = 40;
    }
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    label.font = [UIFont systemFontOfSize:12];
    return label;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = @"";
    switch (component) {
        case 0:
            title = [NSString stringWithFormat:@"%@年",@(1970+row)];
            break;
        case 1:
            title = [NSString stringWithFormat:@"%@月",@(1+row)];
            break;
        case 2:
            title = [NSString stringWithFormat:@"%@日",@(1+row)];
            break;
        case 3:
            title = [NSString stringWithFormat:@"%@时",@(1+row)];
            break;
        case 4:
            title = [NSString stringWithFormat:@"%@分",@(1+row)];
            break;
        case 5:
            title = [NSString stringWithFormat:@"%@秒",@(1+row)];
            break;
        default:
            break;
    }
    return title;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    CGFloat width = 0;
    if (component == 0){
        width = 70;
    }
    else{
        width = 40;
    }
    return width;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            _year = [pickerView selectedRowInComponent:0] + 1970;
            if (self.datePikerModel >= LwDatePikerModelDay) {
                [self.pikerView reloadComponent:LwDatePikerModelDay - 1];
            }break;
        case 1:
           _month = [pickerView selectedRowInComponent:1] + 1;
            if (self.datePikerModel >= LwDatePikerModelDay) {
                [self.pikerView reloadComponent:LwDatePikerModelDay - 1];
            }break;
        case 2:
            _day = [pickerView selectedRowInComponent:2] + 1;
            break;
        case 3:
            _hour = [pickerView selectedRowInComponent:3] + 1;
            break;
        case 4:
            _minute = [pickerView selectedRowInComponent:4] + 1;
            break;
        case 5:
            _second = [pickerView selectedRowInComponent:5] + 1;
            break;
        default:
            break;
    }
    if (self.valueChangeBlock) {
        self.valueChangeBlock(self.date);
    }
}


#pragma mark
#pragma mark setter
-(void)setDatePikerModel:(LwDatePikerModel)datePikerModel
{
    _datePikerModel = datePikerModel;
    switch (_datePikerModel) {
        case LwDatePikerModelSecond:
        {
            [_pikerView selectRow:(_second-1) inComponent:5 animated:NO];
        }
        case LwDatePikerModelMinute:
        {
            [_pikerView selectRow:(_minute-1) inComponent:4 animated:NO];
        }
        case LwDatePikerModelHour:
        {
            [_pikerView selectRow:(_hour-1) inComponent:3 animated:NO];
        }
        case LwDatePikerModelDay:
        {
            [_pikerView selectRow:(_day-1) inComponent:2 animated:NO];
        }
        case LwDatePikerModelMonth:
        {
            [_pikerView selectRow:(_month-1) inComponent:1 animated:NO];
        }
        case LwDatePikerModelYear:
        {
            [_pikerView selectRow:(_year-1970) inComponent:0 animated:NO];
        }
        default:
            break;
    }
}

-(void)setDate:(NSDate *)date
{
    _date = date;
    
    [_dateFormatter setDateFormat:@"yyyy"];
    _year = [[_dateFormatter stringFromDate:_date] integerValue];
    
    [_dateFormatter setDateFormat:@"MM"];
    _month = [[_dateFormatter stringFromDate:_date] integerValue];
    
    [_dateFormatter setDateFormat:@"dd"];
    _day = [[_dateFormatter stringFromDate:_date] integerValue];
    
    [_dateFormatter setDateFormat:@"HH"];
    _hour = [[_dateFormatter stringFromDate:_date] integerValue];
    
    [_dateFormatter setDateFormat:@"mm"];
    _minute = [[_dateFormatter stringFromDate:_date] integerValue];
    
    [_dateFormatter setDateFormat:@"ss"];
    _second = [[_dateFormatter stringFromDate:_date] integerValue];
}

-(NSDate *)date
{
    [_dateComp setYear:_year];
    [_dateComp setMonth:_month];
    [_dateComp setDay:_day];
    [_dateComp setHour:_hour];
    [_dateComp setMinute:_minute];
    [_dateComp setSecond:_second];
    
    return [_gregorian dateFromComponents:_dateComp];
}

@end
