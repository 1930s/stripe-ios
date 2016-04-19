//
//  STPCardPaymentMethod.m
//  Stripe
//
//  Created by Ben Guo on 4/19/16.
//  Copyright © 2016 Stripe, Inc. All rights reserved.
//

#import "STPCardPaymentMethod.h"
#import "STPSource.h"

@interface STPCardPaymentMethod ()

@property (nonatomic, readwrite) id<STPSource> source;

@end

@implementation STPCardPaymentMethod

- (instancetype)initWithSource:(id<STPSource>)source {
    self = [super init];
    if (self) {
        _source = source;
    }
    return self;
}

- (STPPaymentMethodType)type {
    return STPPaymentMethodTypeCard;
}

- (UIImage *)image {
    return self.source.image;
}

- (NSString *)label {
    return self.source.label;
}

@end
