// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import "Insert.h"

%hook MMUINavigationController

- (void)viewDidLoad {
    %orig;
    NSLog(@"BaseMsgContentViewController来了");
    Insert *insert = [[Insert alloc] init];
}

%end
