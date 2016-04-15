//
//  STPBasicapiAdapter.m
//  Stripe
//
//  Created by Jack Flintermann on 1/12/16.
//  Copyright © 2016 Stripe, Inc. All rights reserved.
//

#import "STPBasicAPIAdapter.h"

@interface STPBasicAPIAdapter()
@property(nonatomic, copy)STPRetrieveSourcesBlock retrieveSourcesBlock;
@property(nonatomic, nullable)NSArray<id<STPSource>>* sources;
@property(nonatomic, nullable)id<STPSource> selectedSource;
@end

@implementation STPBasicAPIAdapter

- (void)afterDelay:(void(^)())block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block();
    });
}

- (instancetype)init {
    return [self initWithRetrieveSourcesBlock:^(STPSourceCompletionBlock  _Nonnull completion) {
        completion(self.selectedSource, self.sources, nil);
    }];
}

- (instancetype)initWithRetrieveSourcesBlock:(STPRetrieveSourcesBlock)retrieveSourcesBlock {
    self = [super init];
    if (self) {
        _sources = @[];
        _retrieveSourcesBlock = retrieveSourcesBlock;
    }
    return self;
}

- (void)retrieveSources:(STPSourceCompletionBlock)completion {
    [self afterDelay:^{
        __weak STPBasicAPIAdapter *weakself = self;
        self.retrieveSourcesBlock(^(id<STPSource> _Nullable selectedSource, NSArray<id<STPSource>> * _Nullable sources, NSError * _Nullable error) {
            if (error) {
                completion(nil, nil, error);
                return;
            }
            weakself.selectedSource = selectedSource;
            weakself.sources = sources;
            completion(selectedSource, sources, error);
        });
    }];
}

- (void)addSource:(id<STPSource>)source completion:(STPSourceCompletionBlock)completion {
    self.sources = [self.sources arrayByAddingObject:source];
    [self selectSource:source completion:completion];
}

- (void)selectSource:(nonnull id<STPSource>)source completion:(nonnull STPSourceCompletionBlock)completion {
    self.selectedSource = source;
    completion(source, self.sources, nil);
}

- (void)updateCustomerShippingAddress:(nonnull STPAddress *)shippingAddress
                           completion:(nonnull STPAddressCompletionBlock)completion {
    [self afterDelay:^{
        self.shippingAddress = shippingAddress;
        completion(shippingAddress, nil);
    }];
}

- (void)retrieveCustomerShippingAddress:(nonnull STPAddressCompletionBlock)completion {
    [self afterDelay:^{
        completion(self.shippingAddress, nil);
    }];
}

@end
