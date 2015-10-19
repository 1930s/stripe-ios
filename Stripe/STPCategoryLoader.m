//
//  STPCategoryLoader.m
//  Stripe
//
//  Created by Jack Flintermann on 10/19/15.
//  Copyright © 2015 Stripe, Inc. All rights reserved.
//

#import "STPCategoryLoader.h"
#import "PKPayment+Stripe.h"
#import "NSDictionary+Stripe.h"
#import "Stripe+ApplePay.h"
#import "STPAPIClient+ApplePay.h"

#ifdef STP_STATIC_LIBRARY_BUILD
@implementation STPCategoryLoader

+ (void)loadCategories {
    linkPKPaymentCategory();
    linkDictionaryCategory();
    linkStripeApplePayCategory();
    linkSTPAPIClientApplePayCategory();
}

@end
#endif
