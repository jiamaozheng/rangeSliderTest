//
//  ViewController.m
//  rangeSlider
//
//  Created by Jiamao Zheng on 7/28/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureLabelSlider];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self updateSliderLabels];
//
//    if([self.view respondsToSelector:@selector(setTintColor:)])
//    {
//        self.view.tintColor = [UIColor orangeColor];
//    }
    
}

#pragma mark -
#pragma mark - Label  Slider

- (void) configureLabelSlider
{
    self.labelSlider.minimumValue = 0;
    self.labelSlider.maximumValue = 100;
    
    self.labelSlider.lowerValue = 0;
    self.labelSlider.upperValue = 100;
    
    self.labelSlider.minimumRange = 10;
}

- (void) updateSliderLabels
{
    // You get get the center point of the slider handles and use this to arrange other subviews
    
    CGPoint lowerCenter;
    lowerCenter.x = (self.labelSlider.lowerCenter.x + self.labelSlider.frame.origin.x);
    lowerCenter.y = (self.labelSlider.center.y - 30.0f);
    self.lowerLabel.center = lowerCenter;
    self.lowerLabel.text = [NSString stringWithFormat:@"%d", (int)self.labelSlider.lowerValue];
    
    CGPoint upperCenter;
    upperCenter.x = (self.labelSlider.upperCenter.x + self.labelSlider.frame.origin.x);
    upperCenter.y = (self.labelSlider.center.y - 30.0f);
    self.upperLabel.center = upperCenter;
    self.upperLabel.text = [NSString stringWithFormat:@"%d", (int)self.labelSlider.upperValue];
}

// Handle control value changed events just like a normal slider
- (IBAction)labelSliderChanged:(NMRangeSlider*)sender
{
    [self updateSliderLabels];
}


@end
