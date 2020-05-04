//
//  DetailsViewModelTests.m
//  Find ParkingTests
//
//  Created by Bruno Rodrigues on 04/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Api.h"
#import "ParkingDetailsResponse.h"
#import "DetailsViewModel.h"
#import "Utils.h"

#pragma mark - Mocks

@interface MockApiParkingDetails : Api

@property (nonatomic, strong) ParkingDetailsResponse *response;

@end

@implementation MockApiParkingDetails

- (ParkingDetailsResponse *) loadParkingDetailsWithPlaceId:(NSString *)placeId; {
    return _response;
}

@end

#pragma mark - Test Class

@interface DetailsViewModelTests : XCTestCase

@property (nonatomic, strong) MockApiParkingDetails *mockApi;
@property (nonatomic, strong) DetailsViewModel *viewModel;

@end

@implementation DetailsViewModelTests

- (void)setUp {
    _mockApi = [[MockApiParkingDetails alloc] init];
    _viewModel = [[DetailsViewModel alloc] initWithApi:_mockApi];//
}

- (void)tearDown {
    _mockApi = nil;
    _viewModel = nil;
}

- (void)testReturnedDataAfterLoad {
    _mockApi.response = [[ParkingDetailsResponse alloc] initWithDictionary:[Utils loadInfoPlistWithFileName:@"ParkingDetailsResponseMock"]];
    [_viewModel loadParkingDetailsWithPlaceId:@"abc123"];
    
    XCTAssertTrue([[_viewModel parkingName] isEqualToString:@"test-name"]);
    XCTAssertTrue([[_viewModel parkingRating] isEqualToString:@"1.2"]);
    XCTAssertTrue([[_viewModel parkingAddress] isEqualToString:@"Test Street, 100"]);
    XCTAssertTrue([[_viewModel parkingWebsite] isEqualToString:@"https://www.testwebsite.com"]);
    XCTAssertTrue([[_viewModel parkingPhone] isEqualToString:@"(00) 1234-4568"]);
    XCTAssertEqual([[_viewModel parkingLocation] latitude], 0);
    XCTAssertEqual([[_viewModel parkingLocation] longitude], 0);
    XCTAssertNil([_viewModel errorMessage]);
}

- (void)testReturnedErrorIsEqualToServerError {
    NSString *errorMessage = @"Connection error";
    NSDictionary *dict =@{@"errorMessage": errorMessage};
    _mockApi.response = [[ParkingDetailsResponse alloc] initWithDictionary:dict];
    [_viewModel loadParkingDetailsWithPlaceId:@"abc123"];
    
    XCTAssertEqual([_viewModel errorMessage], errorMessage);
}

@end
