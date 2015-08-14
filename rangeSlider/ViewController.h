//
//  ViewController.h
//  rangeSlider
//
//  Created by Jiamao Zheng on 7/28/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMRangeSlider.h"
#import "CERangeSlider.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet NMRangeSlider *labelSlider;
@property (weak, nonatomic) IBOutlet UILabel *lowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *upperLabel;
@property (weak, nonatomic) IBOutlet CERangeSlider *_rangeSlider;

@property (weak, nonatomic) IBOutlet NMRangeSlider *testSlider;
@property (strong, nonatomic)  UILabel *oneLabel;
@property (strong, nonatomic)  UILabel *secondLabel;

- (IBAction)testedChanged:(NMRangeSlider *)sender;
- (IBAction)aaa:(CERangeSlider *)sender;

- (IBAction)labelSliderChanged:(NMRangeSlider*)sender;
@end

