//
//  STPAddressFieldTableViewCell.h
//  Stripe
//
//  Created by Ben Guo on 4/13/16.
//  Copyright © 2016 Stripe, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, STPAddressFieldType) {
    STPAddressFieldTypeName,
    STPAddressFieldTypeLine1,
    STPAddressFieldTypeLine2,
    STPAddressFieldTypeCity,
    STPAddressFieldTypeState,
    STPAddressFieldTypeZip,
    STPAddressFieldTypeCountry,
    STPAddressFieldTypeEmail,
    STPAddressFieldTypePhone,
};

@class STPFormTextField, STPAddressFieldTableViewCell;

@protocol STPAddressFieldTableViewCellDelegate <NSObject>

- (void)addressFieldTableViewCellDidUpdateText:(STPAddressFieldTableViewCell *)cell;
- (void)addressFieldTableViewCellDidReturn:(STPAddressFieldTableViewCell *)cell;
- (void)addressFieldTableViewCellDidBackspaceOnEmpty:(STPAddressFieldTableViewCell *)cell;

@end

@interface STPAddressFieldTableViewCell : UITableViewCell

- (instancetype)initWithType:(STPAddressFieldType)type
                    contents:(NSString *)contents
                  lastInList:(BOOL)lastInList
                    delegate:(id<STPAddressFieldTableViewCellDelegate>)delegate;

@property(nonatomic)STPAddressFieldType type;
@property (nonatomic, copy) NSString *contents;

@end
