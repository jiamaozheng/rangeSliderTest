//
//  ViewController.h
//  rangeSlider
//
//  Created by Jiamao Zheng on 7/28/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMRangeSlider.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet NMRangeSlider *labelSlider;
@property (weak, nonatomic) IBOutlet UILabel *lowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *upperLabel;

- (IBAction)labelSliderChanged:(NMRangeSlider*)sender;
@end

