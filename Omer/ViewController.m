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
    [self ShkiaSwitches];
    
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval:10.0f target:self selector:@selector(ShkiaSwitches) userInfo:NULL repeats:YES];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    [locationManager requestWhenInUseAuthorization];
  
    

    
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
        
    }
   
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)ShkiaSwitches{
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];

 
    float latitude = locationManager.location.coordinate.latitude;
    float longitude = locationManager.location.coordinate.longitude;
    
    
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMMM dd, yyyy (EEEE) h:mm:ss a z Z"];
    
    
    
    KCGeoLocation *location = [[KCGeoLocation alloc] initWithLatitude:latitude andLongitude:longitude andTimeZone:timeZone];

    KCAstronomicalCalendar *calendar = [[KCAstronomicalCalendar alloc] initWithLocation:location];

    NSDate *now = [calendar sunset];
    
    NSString *nsstr = [format stringFromDate:now];
    label1.text = nsstr;
    NSLog(@"%@",nsstr);
    NSCalendar *nextCal = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *nextComp = [nextCal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:now];
    
   
    NSDate *dateToCheck = [nextCal dateFromComponents:nextComp];
    NSDate *now2 = [NSDate date];

  
switch ([now2 compare:dateToCheck]) {
        case NSOrderedAscending:{
            
            NSDate *now2 = [NSDate date];
            NSInteger dayOfSefira1 = [KCSefiratHaomerCalculator dayOfSefiraForDate:now2];
            
            NSString *inStr = [NSString stringWithFormat: @"%ld", (long)dayOfSefira1];
            label.text = [NSString stringWithFormat:@"Day Of Sefira: %@", inStr];
            
            KCSefiraFormatter *sefiraFormatter = [[KCSefiraFormatter alloc] init];
            sefiraFormatter.custom = KCSefiraCustomSefard;
            sefiraFormatter.language = KCSefiraLanguageHebrew;
            
            KCSefiraPrayerAddition prayers = KCSefiraPrayerAdditionBeracha | KCSefiraPrayerAdditionHarachaman | KCSefiraPrayerAdditionAleinu |KCSefiraPrayerAdditionLeshaimYichud | KCSefiraPrayerAdditionAna | KCSefiraPrayerAdditionRibono | KCSefiraPrayerAdditionLamenatzaiach;
            NSString *string = [sefiraFormatter countStringFromInteger:dayOfSefira1 withPrayers:prayers];
            textView.text = string;
            [textView setFont:[UIFont boldSystemFontOfSize:26]];
            textView.textAlignment = NSTextAlignmentCenter;
            
            UILocalNotification *notifications = [[UILocalNotification alloc] init];
            UIApplication *app = [UIApplication sharedApplication];
            
            if (notifications) {
                notifications.fireDate = now2;
                notifications.timeZone = [NSTimeZone defaultTimeZone];
                notifications.repeatInterval = 0;
                notifications.applicationIconBadgeNumber = dayOfSefira1;
                [app scheduleLocalNotification:notifications];
                NSLog(@"Notification");
                
            }
            
            
            NSLog(@"Date in the future");
            NSLog(@"Day Of Sefira: %ld", (long)dayOfSefira1);

        }
            break;
            
        case NSOrderedDescending:{
            int daysToAdd = 1;
            NSDate *newDate2 = [now2 dateByAddingTimeInterval:60*60*24*daysToAdd];
            NSInteger dayOfSefira = [KCSefiratHaomerCalculator dayOfSefiraForDate:newDate2];
            
            NSString *inStr2 = [NSString stringWithFormat: @"%ld", (long)dayOfSefira];
            label.text = [NSString stringWithFormat:@"Day Of Sefira: %@", inStr2];
            
            KCSefiraFormatter *sefiraFormatter = [[KCSefiraFormatter alloc] init];
            sefiraFormatter.custom = KCSefiraCustomSefard;
            sefiraFormatter.language = KCSefiraLanguageHebrew;
            
            KCSefiraPrayerAddition prayers = KCSefiraPrayerAdditionBeracha | KCSefiraPrayerAdditionHarachaman | KCSefiraPrayerAdditionAleinu |KCSefiraPrayerAdditionLeshaimYichud | KCSefiraPrayerAdditionAna | KCSefiraPrayerAdditionRibono | KCSefiraPrayerAdditionLamenatzaiach;
            NSString *string = [sefiraFormatter countStringFromInteger:dayOfSefira withPrayers:prayers];
            textView.text = string;
            [textView setFont:[UIFont boldSystemFontOfSize:35]];
            textView.textAlignment = NSTextAlignmentCenter;
            UILocalNotification *notifications = [[UILocalNotification alloc] init];
            UIApplication *app = [UIApplication sharedApplication];
            
            if (notifications) {
                notifications.fireDate = now2;
                notifications.timeZone = [NSTimeZone defaultTimeZone];
                notifications.repeatInterval = 0;
                notifications.applicationIconBadgeNumber = dayOfSefira;
                [app scheduleLocalNotification:notifications];
                NSLog(@"Notification");
                
            }
            
            
            NSLog(@"Day Of Sefira: %ld", (long)dayOfSefira);
            NSLog(@"Date in the past");

           
                    }
          break;
            
        case NSOrderedSame:{
            NSLog(@"Date is now");
        }
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
