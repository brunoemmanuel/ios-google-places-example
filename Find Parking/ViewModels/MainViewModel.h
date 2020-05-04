//
//  MainViewModel.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "Parking.h"
#import "Location.h"
#import "Api.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewModel : NSObject

@property (nonatomic, readonly) RACSignal *dataListUpdated;
@property (nonatomic, readonly) RACSignal *errorUpdated;

- (instancetype)init;
- (instancetype)initWithApi:(Api *)api;
- (void)loadNearbyParkings:(Location *)location;
- (NSUInteger)numberOfRowsInSection:(NSInteger)section;
- (Parking *)parkingAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)errorMessage;

@end

NS_ASSUME_NONNULL_END
