//
//  TOV4PointBehavior.h
//  TwitOverview
//
//  Created by Tomohisa Takaoka on 11/8/13.
//
//

#import <UIKit/UIKit.h>

@interface TOV4PointBehavior : UIDynamicBehavior
- (instancetype)initWithItem:(id <UIDynamicItem>)item attachedToAnchor:(CGPoint)point distance:(CGFloat)distance;
@property CGFloat distance;
@property (readwrite, nonatomic) CGPoint anchorPoint;
@property (readwrite, nonatomic) CGFloat length;
@property (readwrite, nonatomic) CGFloat damping;
@property (readwrite, nonatomic) CGFloat frequency;
@end
