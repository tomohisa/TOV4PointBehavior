//
//  TOV4PointBehavior.m
//  TwitOverview
//
//  Created by Tomohisa Takaoka on 11/8/13.
//
//

#import "TOV4PointBehavior.h"
#define TOVConstFrequency 1.0
#define TOVConstItemLength (100.)
#define TOVConstDamping (0.5)

@interface TOV4PointBehavior ()
@property UIAttachmentBehavior * attachmentLT;
@property UIAttachmentBehavior * attachmentLB;
@property UIAttachmentBehavior * attachmentRT;
@property UIAttachmentBehavior * attachmentRB;
@property CGFloat innerDistance;
@property CGPoint innerAnchor;
@end


@implementation TOV4PointBehavior
- (instancetype)initWithItem:(id <UIDynamicItem>)item attachedToAnchor:(CGPoint)point distance:(CGFloat)distance {
    self = [super init];
    if (self) {
        self.innerDistance = distance;
        self.innerAnchor = point;
        _attachmentLT = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:CGPointMake(point.x-distance, point.y-distance)];
        _attachmentLT.frequency = TOVConstFrequency;
        _attachmentLT.damping = TOVConstDamping;
        _attachmentLT.length = TOVConstItemLength;
        [self addChildBehavior:_attachmentLT];
        
        _attachmentLB = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:CGPointMake(point.x-distance, point.y+distance)];
        _attachmentLB.frequency = TOVConstFrequency;
        _attachmentLB.damping = TOVConstDamping;
        _attachmentLB.length = TOVConstItemLength;
        [self addChildBehavior:_attachmentLB];

        _attachmentRT = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:CGPointMake(point.x+distance, point.y-distance)];
        _attachmentRT.frequency = TOVConstFrequency;
        _attachmentRT.damping = TOVConstDamping;
        _attachmentRT.length = TOVConstItemLength;
        [self addChildBehavior:_attachmentRT];

        _attachmentRB = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:CGPointMake(point.x+distance, point.y+distance)];
        _attachmentRB.frequency = TOVConstFrequency;
        _attachmentRB.damping = TOVConstDamping;
        _attachmentRB.length = TOVConstItemLength;
        [self addChildBehavior:_attachmentRB];

    }
    return self;
}
-(void)setDamping:(CGFloat)damping{
    self.attachmentLB.damping = damping;
    self.attachmentLT.damping = damping;
    self.attachmentRB.damping = damping;
    self.attachmentRT.damping = damping;
}
-(CGFloat)damping{
    return self.attachmentLT.damping;
}

-(CGFloat)distance{
    return self.innerDistance;
}
-(void)setDistance:(CGFloat)distance{
    self.innerDistance = distance;
    self.attachmentLT.anchorPoint = CGPointMake(self.innerAnchor.x-distance, self.innerAnchor.y-distance);
    self.attachmentLB.anchorPoint = CGPointMake(self.innerAnchor.x-distance, self.innerAnchor.y+distance);
    self.attachmentRT.anchorPoint = CGPointMake(self.innerAnchor.x+distance, self.innerAnchor.y-distance);
    self.attachmentRB.anchorPoint = CGPointMake(self.innerAnchor.x+distance, self.innerAnchor.y+distance);
}
-(CGFloat)length{
    return self.attachmentLB.length;
}
-(void)setLength:(CGFloat)length{
    self.attachmentLB.length = length;
    self.attachmentLT.length = length;
    self.attachmentRB.length = length;
    self.attachmentRT.length = length;
}
-(CGPoint)anchorPoint{
    return self.innerAnchor;
}
-(void)setAnchorPoint:(CGPoint)anchorPoint{
    self.innerAnchor = anchorPoint;
    self.attachmentLT.anchorPoint = CGPointMake(self.innerAnchor.x-self.innerDistance, self.innerAnchor.y-self.innerDistance);
    self.attachmentLB.anchorPoint = CGPointMake(self.innerAnchor.x-self.innerDistance, self.innerAnchor.y+self.innerDistance);
    self.attachmentRT.anchorPoint = CGPointMake(self.innerAnchor.x+self.innerDistance, self.innerAnchor.y-self.innerDistance);
    self.attachmentRB.anchorPoint = CGPointMake(self.innerAnchor.x+self.innerDistance, self.innerAnchor.y+self.innerDistance);
}
@end
