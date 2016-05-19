//
//  ViewController.m
//  MoviePlayer
//
//  Created by Groupfly on 16/5/18.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

#import "ViewController.h"
#import "TBPlayer.h"

@interface ViewController ()

@property (nonatomic,strong) TBPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    NSLog(@"document===%@",document);
    NSString *filePath =  [document stringByAppendingPathComponent:@"movie.mp4"];
    
    NSURL *url;
    
    if (![[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        url = [NSURL URLWithString:@"http://zyvideo1.oss-cn-qingdao.aliyuncs.com/zyvd/7c/de/04ec95f4fd42d9d01f63b9683ad0"];
    }else {
        url = [NSURL fileURLWithPath:filePath];
    }
    
    [[TBPlayer sharedInstance] playWithUrl:url showView:self.view];
}

@end
