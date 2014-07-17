//
//  WapsSDK.m
//  Unity-iPhone
//
//  Created by guang on 14-1-3.
//
//

#import "WapsSDK.h"
#import "WapsOffer/AppConnect.h"
#include "UnityAppController.h"


@implementation WapsSDK

static WapsSDK * sharedWapsSDK = nil;

void _connectInit() {
    [WapsSDK sharedWapsSDK];
    
    //开启后台打印调试信息
    [WapsLog setLogThreshold:LOG_DEBUG];
    //初始化计数器
    [AppConnect getConnect:@"1bf390a13d540df7bf72418498dfe503" pid:@"appstore"];
    //初始化插屏广告
    [AppConnect initPopAd];
    //显示广告条
    UnityAppController *controller = (UnityAppController *) [UIApplication sharedApplication].delegate;
    [AppConnect displayAd:controller.rootViewController];//  默认在x=0,y=0 的位置显示
    //  [AppConnect displayAd:viewController showX:0 showY:10];
    //  [AppConnect displayAd:viewController adSize:AD_SIZE_480X75]; //指定位置显示互动广告尺
}

+(WapsSDK *) sharedWapsSDK{
    @synchronized(self){
        if (sharedWapsSDK == nil) {
            sharedWapsSDK = [[self alloc] init];
        }
    }
    return  sharedWapsSDK;
}

+(id) allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (sharedWapsSDK == nil) {
            sharedWapsSDK = (WapsSDK *) [super allocWithZone:zone];
            return  sharedWapsSDK;
        }
    }
    return nil;
}

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"sharedMyView 初始化");

        //获取连接状态事件
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConnectSuccess:) name:WAPS_CONNECT_SUCCESS object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConnectFailed:) name:WAPS_CONNECT_FAILED object:nil];
        
        //此通知任何积分操作成功都会调用
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onUpdatePoints:)
                                                     name:WAPS_UPDATE_POINTS
                                                   object:nil];
        
        //只有getPoints成功会通知
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onGetPointsSuccess:)
                                                     name:WAPS_GET_POINTS_SUCCESS
                                                   object:nil];
        
        //只有getPoints失败会通知
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onGetPointsFailed:)
                                                     name:WAPS_GET_POINTS_FAILED
                                                   object:nil];
        
        //获取用户消费积成功事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onSpendPointsSuccess:)
                                                     name:WAPS_SPEND_POINTS_SUCCESS
                                                   object:nil];
        
        //获取用户奖励积分成功事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onAwardPointsSuccess:)
                                                     name:WAPS_AWARD_POINTS_SUCCESS
                                                   object:nil];
        
        //获取获取用户积分失事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onGetPointsFailed:)
                                                     name:WAPS_GET_POINTS_FAILED
                                                   object:nil];
        
        //获取获取用户积分失事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onSpendPointsFailed:)
                                                     name:WAPS_SPEND_POINTS_FAILED
                                                   object:nil];
        
        //获取广告条显示事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onBannerAdShow:)
                                                     name:WAPS_BANNERAD_SHOW
                                                   object:nil];
        
        //获取广告条点击事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onBannerAdClick:)
                                                     name:WAPS_BANNERAD_CLICK
                                                   object:nil];
        
        //获取广告条关闭事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onBannerAdClosed:)
                                                     name:WAPS_BANNERAD_CLOSED
                                                   object:nil];
        
        //获取广告条显示失败事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onBannerAdFail:)
                                                     name:WAPS_BANNERAD_FAILED
                                                   object:nil];
        
        //获取Offer关闭事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onOfferClosed:)
                                                     name:WAPS_OFFER_CLOSED
                                                   object:nil];
        
        //获取插屏广告初始化成功事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onPopAdInitSuccess:)
                                                     name:WAPS_POPAD_INIT_SUCESS
                                                   object:nil];
        
        //获取插屏广告初始化没有广告内容的事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onPopAdInitNull:)
                                                     name:WAPS_POPAD_INIT_NULL
                                                   object:nil];
        
        //获取插屏广告初始化失败的事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onPopAdInitFail:)
                                                     name:WAPS_POPAD_INIT_FAILED
                                                   object:nil];
        
        //获取插屏广告显示事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onPopAdShow:)
                                                     name:WAPS_POPAD_SHOW_SUCESS
                                                   object:nil];
        
        //获取插屏广告点击事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onPopAdClick:)
                                                     name:WAPS_POPAD_CLICKED
                                                   object:nil];
        
        //获取插屏广告显示失败事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onPopAdShowFail:)
                                                     name:WAPS_POPAD_SHOW_FAILED
                                                   object:nil];
        
        //获取插屏广告关闭事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onPopAdClosed:)
                                                     name:WAPS_POPAD_CLOSED
                                                   object:nil];

    }
    return self;
}

- (void)onConnectSuccess:(NSNotification *)notifyObj {
    NSString *url = [[AppConnect getConfigItems] objectForKey:@"url"];
    NSLog(@"在线参数 url=%@", url);
}


- (void)onConnectFailed:(NSNotification *)notifyObj {
    NSLog(@"连接失败");
}

//任何积分操作成功都会调用
- (void)onUpdatePoints:(NSNotification *)notifyObj {
    WapsUserPoints *userPointsObj = notifyObj.object;
    NSString *pointsName = [userPointsObj getPointsName];
    int pointsValue = [userPointsObj getPointsValue];
    NSString *pointsStr = [NSString stringWithFormat:@"您的%@: %d", pointsName, pointsValue];
    const char * charStr =[pointsStr UTF8String];
    UnitySendMessage("Main Camera", "updatePoints", charStr);
}
//只有getPoints操作才会调用
-(void)onGetPointsSuccess:(NSNotification*)notifyObj
{
    WapsUserPoints *userPointsObj = notifyObj.object;
    NSString * pointsName=[userPointsObj getPointsName];
    int  pointsValue=[userPointsObj getPointsValue];
	NSString *pointsStr = [NSString stringWithFormat:@"您的%@: %d",pointsName, pointsValue];
	const char * charStr =[pointsStr UTF8String];
    UnitySendMessage("Main Camera", "updatePoints", charStr);
}

-(void)onAwardPointsSuccess:(NSNotification*)notifyObj
{
    NSLog(@"奖励积分:%@", notifyObj.object);
}

-(void)onSpendPointsSuccess:(NSNotification*)notifyObj
{
    NSLog(@"消费积分:%@", notifyObj.object);
}

- (void)onGetPointsFailed:(NSNotification*)notifyObj
{
    
}

-(void)onAwardPointsFailed:(NSNotification*)notifyObj
{
    NSLog(@"奖励积分错误");
}

-(void)onSpendPointsFailed:(NSNotification*)notifyObj
{
    NSLog(@"消费积分错误 %@",notifyObj.object);
}

#pragma mark 广告条相关通知
- (void)onBannerAdShow:(NSNotification*)notifyObj
{
	NSLog(@"%@", @"显示广告条");
}

- (void)onBannerAdClick:(NSNotification *)notifyObj
{
    NSLog(@"%@", @"广告条点击");
}

- (void)onBannerAdClosed:(NSNotification*)notifyObj
{
	NSLog(@"%@", @"广告条关闭");
}

- (void)onBannerAdFail:(NSNotification*)notifyObj
{
	NSLog(@"%@", @"广告条显示失败，或服务器端未开启");
}

#pragma mark 广告墙相关通知
- (void)onOfferClosed:(NSNotification*)notifyObj
{
	NSLog(@"%@", @"Offer已关闭");
}

#pragma mark 插屏广告相关通知
- (void) onPopAdInitSuccess:(NSNotification*)notifyObj
{
    NSLog(@"%@", @"插屏广告初始化成功");
}

- (void)onPopAdClosed:(NSNotification*)notifyObj
{
	NSLog(@"%@", @"插屏广告关闭");
}

- (void)onPopAdClick:(NSNotification*)notifyObj
{
	NSLog(@"%@", @"插屏广告点击");
}

- (void)onPopAdShow:(NSNotification*)notifyObj
{
	NSLog(@"%@", @"插屏广告显示");
}

- (void)onPopAdShowFail:(NSNotification*)notifyObj
{
	NSLog(@"%@", @"插屏广告没有广告可显示，或服务器端未开启");
}

- (void) onPopAdInitFail:(NSNotification*)notifyObj
{
    NSLog(@"%@", @"插屏广告初始化失败");
}

- (void) onPopAdInitNull:(NSNotification*)notifyObj
{
    NSLog(@"%@", @"没有可显示的插屏广告");
}


#if 0
- (void)onOfferClosed:(NSNotification *)notifyObj {
    NSLog(@"%@", @"Offer已关闭");
}

- (void)onPopAdClosed:(NSNotification *)notifyObj {
    NSLog(@"%@", @"Pop关闭");
}

- (void)onPopAdShow:(NSNotification *)notifyObj {
    NSLog(@"%@", @"Pop显示成功");
}

- (void)onPopAdShowFail:(NSNotification *)notifyObj {
    NSLog(@"%@", @"Pop未开启，或没有广告可显示");
}

- (void)initPopAdSuccess:(NSNotification *)notifyObj {
    NSLog(@"%@", @"pop初始化成功");
}

- (void)initPopAdFail:(NSNotification *)notifyObj {
    NSLog(@"%@", @"pop初始化失败");
}

- (void)initPopAdNull:(NSNotification *)notifyObj {
    NSLog(@"%@", @"没有可显示的插屏广告");
}

- (void)getUpdatedPointsFailed:(NSNotification *)notifyObj {

}
#endif

void _adShow() {

    UnityAppController *controller = (UnityAppController *) [UIApplication sharedApplication].delegate;
    [AppConnect displayAd:controller.rootViewController];

}

void _popShow() {
    UnityAppController *controller = (UnityAppController *) [UIApplication sharedApplication].delegate;
    [AppConnect showPopAd:controller.rootViewController];
}

void _offerShow() {
    UnityAppController *controller = (UnityAppController *) [UIApplication sharedApplication].delegate;
    [AppConnect showOffers:controller.rootViewController];
}

void _getPoints() {
    [AppConnect getPoints];
}

void _awardPoints() {
    //奖励积分接口
    [AppConnect awardPoints:10];
    //显示积分奖励提示
    [AppConnect showEarnedPoints];
}

void _spendPoints() {
    [AppConnect spendPoints:10];
}

void _bannerShow () {
    //显示广告条
    UnityAppController *controller = (UnityAppController *) [UIApplication sharedApplication].delegate;
    [AppConnect displayAd:controller.rootViewController];
}

void _bannerClose () {
    //关闭广告条
    [AppConnect closeBannerAd];
}

void _showFeedBack () {
    //显示用户反馈
    UnityAppController *controller = (UnityAppController *) [UIApplication sharedApplication].delegate;
    [AppConnect showFeedBack:controller.rootViewController];
}
@end
