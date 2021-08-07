//
//  main.m
//  Demo
//
//  Created by hibo on 2021/7/25.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int gloab = 1;

int func1(int a, int b) {
    int c = a + b;
    return c;
}

int main(int argc, char * argv[]) {
    int num = func1(1, 2);
    NSLog(@"num:%d",num);
}
