//
//  LHNetWorkTool.m
//  SimpleCellFactory
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LHNetWorkTool.h"

@implementation LHNetWorkTool

+ (void)getWithURL:(NSString *)url paramer:(NSDictionary *)parameter httpHeader:(NSDictionary<NSString *,NSString *> *)header responseType:(ResponseType)responseType progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure{
    
    
    //    检查管理器单例的startMonitoring，用来检查网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    //    检查网络连接的单例，网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //  NSLog(@"%ld", status);
    }];
    
    
    
    
    // 1.初始化sessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.reachabilityManager 判断网络状态
    // 2.处理请求头
    for (NSString *key in header.allKeys) {
        [manager.requestSerializer setValue:header[key] forHTTPHeaderField:key];
    }
    
    // 3.处理返回值类型
    switch (responseType) {
        case ResponseTypeDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
            
        case ResponseTypeJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
            
        case ResponseTypeXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
            
    }
    
    // 4.设置返回值支持的文本类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"application/x-javascript",nil]];
    
    // 5.GET请求
    [manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
   
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        
    }];
}





+ (void)postWithURL:(NSString *)url body:(id)body bodyType:(BodyType)bodyType httpHeader:(NSDictionary<NSString *,NSString *> *)header responseType:(ResponseType)responseType progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure{
    // 1.初始化sessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.reachabilityManager 判断网络状态
    // 2.处理请求头
    for (NSString *key in header.allKeys) {
        [manager.requestSerializer setValue:header[key] forHTTPHeaderField:key];
    }
    
    // 3.处理返回值类型
    switch (responseType) {
        case ResponseTypeDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
            
        case ResponseTypeJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
            
        case ResponseTypeXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
    }
    
    // 4.设置返回值支持的文本类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"application/x-javascript",nil]];
    
    // 5.处理body类型
    switch (bodyType) {
        case BodyTypeJSONString:{
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable __autoreleasing * _Nullable error) {
                return parameters;
            }];
            break;
        }
        case BodyTypeNormal:{
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        }
            
    }
    
    // 6.post请求
    [manager POST:url parameters:body progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
@end
