//
//  STPPaymentMethodsViewController+Private.h
//  Stripe
//
//  Created by Jack Flintermann on 5/18/16.
//  Copyright © 2016 Stripe, Inc. All rights reserved.
//

#import <Stripe/Stripe.h>
#import "STPPromise.h"
#import "STPPaymentMethod.h"
#import "STPBackendAPIAdapter.h"
#import "STPPaymentMethodTuple.h"

@interface STPPaymentMethodsViewController (Private)

- (instancetype)initWithAPIClient:(STPAPIClient *)apiClient
                       APIAdapter:(id<STPBackendAPIAdapter>)apiAdapter
                    loadingPromise:(STPPromise<STPPaymentMethodTuple *> *)loadingPromise;

@end
