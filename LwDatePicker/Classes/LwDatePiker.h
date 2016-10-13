//
//  LwDatePiker.h
//  Pods
//
//  Created by guakeliao on 16/9/20.
//
//
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LwDatePikerModel){
    LwDatePikerModelYear = 1,
    LwDatePikerModelMonth,
    LwDatePikerModelDay,
    LwDatePikerModelHour,
    LwDatePikerModelMinute,
    LwDatePikerModelSecond ,
};

@interface LwDatePiker : UIView

@property (nonatomic, assign) LwDatePikerModel datePikerModel;
@property (nonatomic, strong) NSDate *date;        // default is current date when picker created. Ignored in countdown timer mode. for that mode, picker starts at 0:00
@property (nonatomic, copy) void (^valueChangeBlock)(NSDate *date); //yyyy-MM-dd:HH:mm:ss


@end
