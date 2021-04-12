//
//  main.m
//  Dylib
//
//  Created by 卜磊 on 2020/9/29.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }
  // 打印下argv的参数
  char** envp = &argv[argc+1];
  // log DYLD PRINT ENV 打印下启动参数
  char** apple = envp;
  int i = 0;
  while (*apple != NULL) {
    NSLog(@"argv参数%d: %s\n",i,*apple);
    ++apple;
    i++;
  }
  ++apple;

  // 打印下苹果的额外的内核参数
  int j = 0;
  char **p;
  for (p = apple + 1; p && *p; p++) {
    if (p && *p) {
      NSLog(@"内核参数%d: %s\n",j,*p);
    }

    j++;
  }

  
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
