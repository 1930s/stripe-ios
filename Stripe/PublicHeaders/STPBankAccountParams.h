//
//  STPBankAccountParams.h
//  Stripe
//
//  Created by Jack Flintermann on 10/4/15.
//  Copyright © 2015 Stripe, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Representation of a user's bank account details. You can assemble these with information that your user enters and
 *  then create Stripe tokens with them using an STPAPIClient. @see https://stripe.com/docs/api#create_bank_account_token
 */
@interface STPBankAccountParams : NSObject

/**
 *  The account number for the bank account. Currently must be a checking account.
 */
@property (nonatomic, copy, nullable) NSString *accountNumber;

/**
 *  The last 4 digits of the bank account's account number, if it's been set, otherwise nil.
 */
- (nullable NSString *)last4;

/**
 *  The routing number for the bank account. This should be the ACH routing number, not the wire routing number.
 */
@property (nonatomic, copy, nullable) NSString *routingNumber;

/**
 *  The country the bank account is in.
 */
@property (nonatomic, copy, nullable) NSString *country;

/**
 *  The default currency for the bank account.
 */
@property (nonatomic, copy, nullable) NSString *currency;

@end
