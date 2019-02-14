//
//  ViewController.m
//  Baidu翻译API测试
//
//  Created by 萨缪 on 2019/2/13.
//  Copyright © 2019年 萨缪. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSString+NSString__MD5_.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.resStr = [[NSString alloc] init];
    //申请的 appId
    NSNumber * appId = @20190213000266436;
    NSNumber * salt = @1435660288;
    //密钥
    NSString * pass = @"9UfHmHynDU34DOsU0QAZ";
    //要翻译的东西
    NSString  * q = @"annual";
    NSString * string = [NSString stringWithFormat:@"%@%@%@%@",appId,q,salt,pass];
    //对其进行UTF-8编码
    NSString * utf8String = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString * utf8String = [NSString stringWithCString:[string UTF8String] encoding:NSUnicodeStringEncoding];
    //加密
#pragma mark MD5加密方法出错 重新找方法！！！
    NSString * sign = [NSString md5:utf8String];
//    NSString * sign = [utf8String getMD5];
    //对q进行UTF-8编码
    NSString * qEncoding = [q stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString * qEncoding1 = [NSString stringWithCString:[q UTF8String] encoding:NSUnicodeStringEncoding];
    
    NSString * httpStr = @"http://api.fanyi.baidu.com/api/trans/vip/translate";
    //拼接 URL
//    NSString * encodeHttpStr = [httpStr stringByAddingPercentEncodingWithAllowedCharacters:httpStr];
    NSString * urlStr = [NSString stringWithFormat:@"%@?q=%@&from=en&to=zh&appid=%@&salt=%@&sign=%@",
                         httpStr,
                         qEncoding,
                         appId,
                         salt,
                         sign];
    NSURL * url = [NSURL URLWithString:urlStr];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error = %@",error);
        } else {
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            //获取翻译后的字符串
            self.resStr = [[dic objectForKey:@"trans_result"] firstObject][@"dst"];
            NSString * finalStr = [dic objectForKey:@"trans_result"];
            NSLog(@"finalStr = %@",finalStr);
            NSLog(@"self.resStr = %@",self.resStr);
        }
    }];
    //开启任务
    [task resume];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
