# LwDatePicker

[![CI Status](http://img.shields.io/travis/liaowei/LwDatePicker.svg?style=flat)](https://travis-ci.org/liaowei/LwDatePicker)
[![Version](https://img.shields.io/cocoapods/v/LwDatePicker.svg?style=flat)](http://cocoapods.org/pods/LwDatePicker)
[![License](https://img.shields.io/cocoapods/l/LwDatePicker.svg?style=flat)](http://cocoapods.org/pods/LwDatePicker)
[![Platform](https://img.shields.io/cocoapods/p/LwDatePicker.svg?style=flat)](http://cocoapods.org/pods/LwDatePicker)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LwDatePicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
用法
	pod "LwDatePicker"
	支持xib和view创建
    self.piker.datePikerModel = LwDatePikerModelDay;
    self.piker.valueChangeBlock = ^(id date)
    {
        NSLog(@"%@",date);
    };
```

## Author

guakeliao, 598951856@qq.com

## License

自定义时间选择器，可以定义yyyy-MM-dd:hh:mm:ss
