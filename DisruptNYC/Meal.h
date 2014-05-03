//
//  Meal.h
//  DisruptNYC
//
//  Created by Joseph Nardone on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Meal : NSObject
{
    NSDate *mealDate;
    float amountSpent;
}

@property (nonatomic, retain) NSDate *mealDate;
@property (nonatomic, assign) float amountSpent;

@end
