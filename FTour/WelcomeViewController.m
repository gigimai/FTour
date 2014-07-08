//
//  WelcomeViewController.m
//  FTour
//
//  Created by Khanhhoa Mai on 7/8/14.
//  Copyright (c) 2014 FSoft. All rights reserved.
//

#import "WelcomeViewController.h"
#import "FSoftViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//
//    NSUUID *uuid = [[NSUUID alloc]initWithUUIDString:KFSoftUUID];
//    self.beaconRegion = [[CLBeaconRegion alloc]initWithProximityUUID:uuid major:1 identifier:@"FSoft"];
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    
    NSUUID *uuid = [[NSUUID alloc]initWithUUIDString:kFSoftUUID];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"Fsoft"];
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
    
    
}
-(void) peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    
}
-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    NSLog(@"Founded");
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}
-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region{
    [self
     .locationManager stopRangingBeaconsInRegion:self.beaconRegion];
    self.statusLable.text = @"Out of Range";
    NSLog(@"lost");
}
-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    CLBeacon *foundBeacon = [beacons firstObject];
    switch (foundBeacon.major.intValue) {
        case 1:
            [self loadFsoft];
           // _distanceLabel.text = @"FSoft";
            //self.barProgress.progress =
            break;
        case 2:
            _distanceLabel.text = @"FSU1";
            break;
        case 3:
            _distanceLabel.text = @"Cafe";
            break;
        default:
            break;
    }
}

-(void)loadFsoft
{
    FSoftViewController *vc = [[FSoftViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    NSLog(@"%@", [region class].description);
    [_locationManager startRangingBeaconsInRegion:_beaconRegion];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
