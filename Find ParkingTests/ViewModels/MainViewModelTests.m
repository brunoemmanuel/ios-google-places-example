//
//  MainViewModelTests.m
//  Find ParkingTests
//
//  Created by Bruno Rodrigues on 04/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Api.h"
#import "NearbyParkingsResponse.h"
#import "Parking.h"
#import "MainViewModel.h"
#import "Location.h"
#import "Utils.h"

#pragma mark - Mocks

@interface MockApiNearbyParkings : Api

@property (nonatomic, strong) NearbyParkingsResponse *response;

@end

@implementation MockApiNearbyParkings

-(NearbyParkingsResponse *) loadNearbyParkingsWithLocation:(Location *)location andRadius:(int)radius {
    return _response;
}

@end

#pragma mark - Test Class

@interface MainViewModelTests : XCTestCase

@property (nonatomic, strong) MockApiNearbyParkings *mockApi;
@property (nonatomic, strong) MainViewModel *viewModel;
@property (nonatomic, strong) Location *location;

@end

@implementation MainViewModelTests

- (void)setUp {
    _mockApi = [[MockApiNearbyParkings alloc] init];
    _viewModel = [[MainViewModel alloc] initWithApi:_mockApi];
    _location = [[Location alloc] initWithDictionary:[Utils loadInfoPlistWithFileName:@"LocationMock"]];
}

- (void)tearDown {
    _mockApi = nil;
    _viewModel = nil;
    _location = nil;
}

- (void)testReturnedDataAfterLoad {
    _mockApi.response = [[NearbyParkingsResponse alloc] initWithDictionary:[Utils loadInfoPlistWithFileName:@"NearbyParkingsResponseMock"]];
    [_viewModel loadNearbyParkings:_location];
    
    XCTAssertEqual([_viewModel numberOfRowsInSection:0], 3);
    XCTAssertNil([_viewModel errorMessage]);
}

- (void)testReturnedErrorIsEqualToServerError {
    NSString *errorMessage = @"Connection error";
    NSDictionary *dict =@{@"errorMessage": errorMessage};
    _mockApi.response = [[NearbyParkingsResponse alloc] initWithDictionary:dict];
    [_viewModel loadNearbyParkings:_location];
    
    XCTAssertEqual([_viewModel errorMessage], errorMessage);
}

- (void)testReturnedListIsOrderedByDistanceAsc {
    _mockApi.response = [[NearbyParkingsResponse alloc] initWithDictionary:[Utils loadInfoPlistWithFileName:@"NearbyParkingsResponseMock"]];
    [_viewModel loadNearbyParkings:_location];
    
    XCTAssertTrue([[[_viewModel parkingAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] name] isEqualToString:@"test-name-0"]);
    
    XCTAssertTrue([[[_viewModel parkingAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]] name] isEqualToString:@"test-name-1"]);
    
    XCTAssertTrue([[[_viewModel parkingAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]] name] isEqualToString:@"test-name-2"]);
}

@end
