//
//  ANPopoverView.m
//  CustomSlider
//
//  Created by Gabriel  on 30/1/13.
//  Copyright (c) 2013 App Ninja. All rights reserved.
//

#import "ANPopoverView.h"

@implementation ANPopoverView {
    UILabel *textLabel;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont boldSystemFontOfSize:15.0f];
        
        UIImageView *popoverView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tooltip-image"]];
        [self addSubview:popoverView];
        
        textLabel = [[UILabel alloc] init];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.font = self.font;
        textLabel.textColor = [UIColor blackColor];
        textLabel.text = self.text;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.frame = CGRectMake(0, -2.0f, popoverView.frame.size.width, popoverView.frame.size.height);
        [self addSubview:textLabel];
        
        self.value = .5;
        
    }
    return self;
}

-(void)setValue:(float)aValue {
    _value = aValue*10;
    self.text = [NSString stringWithFormat:@"%4.2f", _value];
    textLabel.text = self.text;
    [self setNeedsDisplay];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
