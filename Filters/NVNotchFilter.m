//
//  NVNotchFilter.m
//  NVDSP
//
//  Created by Bart Olsthoorn on 23/05/2012.
//  Copyright (c) 2012 Bart Olsthoorn. All rights reserved.
//

#import "NVNotchFilter.h"

@implementation NVNotchFilter

@synthesize Q;
@synthesize centerFrequency;

- (void) setQ:(float)_Q {
    Q = _Q;
    [self calculateCoefficients];
}

- (void) setCenterFrequency:(float)_centerFrequency {
    centerFrequency = _centerFrequency;
    [self calculateCoefficients];
}

- (void) calculateCoefficients {
    if ((centerFrequency != 0.0f) && (Q != 0.0f)) {
        
        [self intermediateVariables:centerFrequency Q:Q];
        
        a0 = (1 + alpha);
        b0 = 1                      / a0; 
        b1 = (-2 * omegaC)          / a0; 
        b2 = 1                      / a0;
        a1 = (-2 * omegaC)          / a0; 
        a2 = (1 - alpha)            / a0;
        
        [super setCoefficients];
    }
}

@end
