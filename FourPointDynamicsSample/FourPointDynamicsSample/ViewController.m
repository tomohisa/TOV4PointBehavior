//
//  ViewController.m
//  FourPointDynamicsSample
//
//  Created by Tomohisa Takaoka on 11/26/13.
//  Copyright (c) 2013 Tomohisa Takaoka. All rights reserved.
//

#import "ViewController.h"
#import "TOV4PointBehavior.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewToMove;
@property TOV4PointBehavior * fourPointBehavior;
@property UIDynamicAnimator * animator;
@property (weak, nonatomic) IBOutlet UILabel *labelDamping;
@property (weak, nonatomic) IBOutlet UILabel *labelFrequency;
@property (weak, nonatomic) IBOutlet UILabel *labelDistance;
@property (weak, nonatomic) IBOutlet UILabel *labelLength;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
	// Do any additional setup after loading the view, typically from a nib.
    self.fourPointBehavior = [[TOV4PointBehavior alloc] initWithItem:self.viewToMove attachedToAnchor:CGPointMake(100, 100) distance:200];
    [self.animator addBehavior:self.fourPointBehavior];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionTapped:(UITapGestureRecognizer*)sender {
    self.fourPointBehavior.anchorPoint = [sender locationInView:self.view];
}
- (IBAction)valueChanged:(UISlider*)sender {
    self.labelDamping.text = [NSString stringWithFormat:@"Daming (%f)",sender.value];
    self.fourPointBehavior.damping = sender.value;

}
- (IBAction)valueChangedFrequency:(UISlider*)sender {
    self.labelFrequency.text = [NSString stringWithFormat:@"Frequency (%f)",sender.value];
    self.fourPointBehavior.frequency = sender.value;
}
- (IBAction)valueChangedDistance:(UISlider*)sender {
    self.labelDistance.text = [NSString stringWithFormat:@"Distance (%f)",sender.value];
    self.fourPointBehavior.distance = sender.value;
}
- (IBAction)valueChangedLength:(UISlider *)sender {
    self.labelLength.text = [NSString stringWithFormat:@"Length (%f)",sender.value];
    self.fourPointBehavior.length = sender.value;
}

@end
