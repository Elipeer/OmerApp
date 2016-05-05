//
//  ViewController.m
//  Omer
//
//  Created by Eli Peer on 5/3/16.
//  Copyright © 2016 elipeer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize locationManager;



- (void)viewDidLoad {
    NSArray *locations;
    
    CLLocation* loc = [locations lastObject]; // locations is guaranteed to have at least one object
    double latitude = loc.coordinate.latitude;
    double longitude = loc.coordinate.longitude;
    NSLog(@"%.8f",latitude);
    NSLog(@"%.8f",longitude);

    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
    
    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    KCGeoLocation *location = [[KCGeoLocation alloc] initWithLatitude:latitude andLongitude:longitude andTimeZone:timeZone];
    KCAstronomicalCalendar *calendar = [[KCAstronomicalCalendar alloc] initWithLocation:location];
    NSDate *sunrise = [calendar sunrise];
    NSLog(@"sunrise: %@", sunrise);
    NSString *Sunrise1 = [NSString stringWithFormat: @"%@", sunrise];
    label1.text = Sunrise1;
    
    NSDate *today = [NSDate date];
   NSInteger dayOfSefira = [KCSefiratHaomerCalculator dayOfSefiraForDate:today];
    NSString *inStr = [NSString stringWithFormat: @"%ld", (long)dayOfSefira];
    

     NSLog(@"dos: %ld", (long)dayOfSefira);
    
    label.text = inStr;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)sefira{
    
    
    
    
}
@end
