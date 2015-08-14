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

int const DONE = 1;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureLabelSlider];

       NSLog(@"test range slider: %@", self.testSlider);
       NSLog(@"real range slider: %@", self.labelSlider);
    
    self.testSlider.minimumValue = 0;
    self.testSlider.maximumValue = 100;
    self.testSlider.lowerValue = 0;
    self.testSlider.upperValue = 100;
    self.testSlider.minimumRange = 10;
//    NSLog(@"Age range slider: %@", self.ageRangeSlider);
    NSLog(@"lowerValue: %d", (int)self.testSlider.lowerValue);
    NSLog(@"upperValue: %d", (int)self.testSlider.upperValue);
    
    
    //CE
    NSUInteger margin = 20;
    CGRect sliderFrame = CGRectMake(margin, margin, self.view.frame.size.width - margin * 2, 50);
    self._rangeSlider = [[CERangeSlider alloc] initWithFrame:sliderFrame];
    
    [self.view addSubview:self._rangeSlider];
    
    [self._rangeSlider addTarget:self
                     action:@selector(slideValueChanged:)
           forControlEvents:UIControlEventValueChanged];
    
    [self performSelector:@selector(updateState) withObject:nil afterDelay:1.0f];
    
        self.oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(self._rangeSlider.frame.origin.x + self._rangeSlider.lowerValue, self._rangeSlider.frame.origin.y, 100, self._rangeSlider.frame.size.height + 80)];
    
        self.secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(self._rangeSlider.frame.origin.x + self._rangeSlider.frame.size.width, self._rangeSlider.frame.origin.y, 100, self._rangeSlider.frame.size.height + 80)];
    
    self.oneLabel.text = @"0";
    self.secondLabel.text = @"100";
    
    [self.view addSubview:self.oneLabel];
    [self.view addSubview:self.secondLabel];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)slideValueChanged:(id)control
{
    NSLog(@"Slider value changed: (%.2f,%.2f)",
          self._rangeSlider.lowerValue,self._rangeSlider.upperValue);
    
    [self.oneLabel removeFromSuperview];
    [self.secondLabel removeFromSuperview];

    self.oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(self._rangeSlider.frame.origin.x + self._rangeSlider.lowerValue *self._rangeSlider.frame.size.width/100, self._rangeSlider.frame.origin.y, 80, self._rangeSlider.frame.size.height + 80)];
    
    self.secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(self._rangeSlider.frame.origin.x + self._rangeSlider.upperValue *self._rangeSlider.frame.size.width/100, self._rangeSlider.frame.origin.y, 80, self._rangeSlider.frame.size.height + 80)];
    
    self.oneLabel.text = [NSString stringWithFormat:@"%d", (int)self._rangeSlider.lowerValue];
    self.secondLabel.text = [NSString stringWithFormat:@"%d", (int)self._rangeSlider.upperValue];
    
    [self.view addSubview:self.oneLabel];
    [self.view addSubview:self.secondLabel];
   
  
    
}

-(void)aaa{
      self.oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(self._rangeSlider.frame.origin.x + self._rangeSlider.lowerValue, self._rangeSlider.frame.origin.y, 50, self._rangeSlider.frame.size.height + 30)];
}
- (IBAction)testedChanged:(NMRangeSlider *)sender {
    

}

- (IBAction)aaa:(CERangeSlider *)sender {
    [self aaa];
}

- (void)updateState
{
    self._rangeSlider.trackHighlightColour = [UIColor redColor];
    self._rangeSlider.curvatiousness = 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void) viewDidAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//
//    if([self.view respondsToSelector:@selector(setTintColor:)])
//    {
//        self.view.tintColor = [UIColor orangeColor];
//    }
//    
//}

#pragma mark -
#pragma mark - Label  Slider

- (void) configureLabelSlider
{
    [self.labelSlider layoutSubviews];
    
    self.labelSlider.minimumValue = 0;
    self.labelSlider.maximumValue = 100;
    
    self.labelSlider.lowerValue = 0;
    self.labelSlider.upperValue = 100;
    
    self.labelSlider.minimumRange = 10;
    self.labelSlider.continuous = YES;
    
    
    self.labelSlider.lowerHandleHidden = true; 
    
    [self updateLowerSliderLabels];
    [self updateUpperSliderLabels];
    
}

- (void) updateLowerSliderLabels
{
    // You get get the center point of the slider handles and use this to arrange other subviews
//    self.labelSlider.lowerHandleHidden = YES;
    CGPoint lowerCenter;
    lowerCenter.x = (self.labelSlider.lowerCenter.x + self.labelSlider.frame.origin.x);
    lowerCenter.y = (self.labelSlider.center.y - 30.0f);
    self.lowerLabel.center = lowerCenter;
    self.lowerLabel.text = [NSString stringWithFormat:@"%d", (int)self.labelSlider.lowerValue];
    
    self.lowerLabel.hidden = NO;
}

- (void) updateUpperSliderLabels{
    // You get get the center point of the slider handles and use this to arrange other subviews
    
    CGPoint upperCenter;
    upperCenter.x = (self.labelSlider.upperCenter.x + self.labelSlider.frame.origin.x);
    upperCenter.y = (self.labelSlider.center.y - 30.0f);
    self.upperLabel.center = upperCenter;
    self.upperLabel.text = [NSString stringWithFormat:@"%d", (int)self.labelSlider.upperValue];

    self.upperLabel.hidden = NO;
}



// Handle control value changed events just like a normal slider

- (IBAction)labelSliderChanged:(NMRangeSlider*)sender
{
    
        self.lowerLabel.hidden = YES;
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self
                                       selector:@selector(updateLowerSliderLabels)
                                       userInfo:nil
                                        repeats:nil];

        self.upperLabel.hidden = YES;
         [NSTimer scheduledTimerWithTimeInterval:1
                                          target:self
                                        selector:@selector(updateUpperSliderLabels)
                                        userInfo:nil
                                         repeats:nil];
}


@end
