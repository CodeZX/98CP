//
//  LXRouteManage.m
//  LiangFengYouXin
//
//  Created by ZX on 2018/4/18.
//  Copyright © 2018年 LiangFengYouXin. All rights reserved.
//

#import "LXRouteManage.h"
#import "SDLaunchViewController.h"
#import "BasicMainTBVC.h"

@implementation LXRouteManage

WMSingletonM(LXRouteManage)


+ (UIViewController *)rootViewController {

    BasicMainTBVC *basicTBVC = [[BasicMainTBVC alloc]init];
    
    
    SDLaunchViewController *launchVC = [[SDLaunchViewController alloc]initWithMainVC:basicTBVC viewControllerType:ADLaunchViewController];
    launchVC.imageURL = @"http://img5.duitang.com/uploads/item/201411/06/20141106104720_WHEe2.jpeg";
    
    return launchVC;
    
}
@end
