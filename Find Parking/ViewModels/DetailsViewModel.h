//
//  DetailsViewModel.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 02/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSString *phone;

- (void)loadParkingDetailsWithPlaceId:(NSString *)placeId;

@end

NS_ASSUME_NONNULL_END
