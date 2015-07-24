# Tour VC


`#import "TourVC.h"`

`
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

// remove this for production app
[defaults setBool:NO forKey:@"HasSeenTour"];


BOOL hasSeenTour = [defaults boolForKey:@"HasSeenTour"];

if (hasOpened == NO && hasSeenTour == NO) {
[self viewTour:nil];
hasOpened = YES;

// To make tour show only one in the
// first time
[defaults setBool:YES forKey:@"HasSeenTour"];
[defaults synchronize];
//
}
`