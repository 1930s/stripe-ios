//
//  NSArray+StripeTest.m
//  Stripe
//
//  Created by Jack Flintermann on 1/19/16.
//  Copyright © 2016 Stripe, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+Stripe.h"

@interface NSArray_StripeTest : XCTestCase

@end

@implementation NSArray_StripeTest

- (void)testEmptyArray {
    XCTAssertNil([@[] stp_boundSafeObjectAtIndex:5]);
}

- (void)testTooHighIndex {
    NSArray *test = @[@1, @2, @3];
    XCTAssertNil([test stp_boundSafeObjectAtIndex:5]);
}

- (void)testWithinBoundsIndex {
    NSArray *test = @[@1, @2, @3];
    XCTAssertEqual([test stp_boundSafeObjectAtIndex:1], @2);
}

@end
