//
//  LwViewController.m
//  LwDatePicker
//
//  Created by liaowei on 09/20/2016.
//  Copyright (c) 2016 liaowei. All rights reserved.
//

#import "LwViewController.h"
#import "LwDatePiker.h"

@interface LwViewController ()

@property (weak, nonatomic) IBOutlet LwDatePiker *piker;

@end

@implementation LwViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.piker.datePikerModel = LwDatePikerModelDay;
    self.piker.valueChangeBlock = ^(id date)
    {
        NSLog(@"%@",date);
    };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
