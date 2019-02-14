//
//  NSString+MD5.m
//  Baidu翻译API测试
//
//  Created by 萨缪 on 2019/2/13.
//  Copyright © 2019年 萨缪. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString_MD5

//- (NSString *)getMD5
//{
//    //1: 将字符串转换成C语言的字符串(因为:MD5加密是基于C的)
//    const char *data = [self UTF8String];
//    //2: 初始化一个字符串数组,用来存放MD5加密后的数据
//    unsigned char resultArray[CC_MD5_DIGEST_LENGTH];
//    //3: 计算MD5的值
//    //参数一: 表示要加密的字符串
//    //参数二: 表示要加密字符串的长度
//    //参数三: 表示接受结果的数组
//    CC_MD5(data, (CC_LONG) strlen(data), resultArray);
//    //4: 初始化一个保存结果的字符串
//    NSMutableString *resultString = [NSMutableString string];
//    //5: 从保存结果的数组中,取出值赋给字符串
//    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
//        [resultString appendFormat:@"%02X", resultArray[i]];
//    }
//    //6: 返回结果
//    return resultString;
//}

@end
