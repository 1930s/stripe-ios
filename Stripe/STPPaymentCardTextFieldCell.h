//
//  STPPaymentCardTextFieldCell.h
//  Stripe
//
//  Created by Jack Flintermann on 6/16/16.
//  Copyright © 2016 Stripe, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "STPObscuredCardView.h"
#import "STPPaymentCardTextField.h"
#import "STPTheme.h"

NS_ASSUME_NONNULL_BEGIN

@class STPPaymentCardTextFieldCell;

@protocol STPPaymentCardTextFieldCellDelegate <NSObject>

- (void)paymentCellDidClear:(STPPaymentCardTextFieldCell *)cell;

@end

@interface STPPaymentCardTextFieldCell : UITableViewCell

@property(nonatomic, weak)id<STPPaymentCardTextFieldCellDelegate>delegate;
@property(nonatomic, weak, readonly)STPPaymentCardTextField *paymentField;
@property(nonatomic, weak, readonly)STPObscuredCardView *obscuredCardView;
@property(nonatomic, copy)STPTheme *theme;
@property(nonatomic, weak)UIView *inputAccessoryView;

- (void)configureWithCard:(STPCard *)card;
- (BOOL)isEmpty;
- (void)clear;

@end

NS_ASSUME_NONNULL_END
