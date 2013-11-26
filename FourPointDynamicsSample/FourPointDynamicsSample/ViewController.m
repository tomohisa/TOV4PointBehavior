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
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
	// Do any additional setup after loading the view, typically from a nib.
    self.fourPointBehavior = [[TOV4PointBehavior alloc] initWithItem:self.viewToMove attachedToAnchor:CGPointMake(100, 100) distance:100.];
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

@end
