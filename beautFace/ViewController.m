//
//  ViewController.m
//  beautFace
//
//  Created by 张芳涛 on 16/8/2.
//  Copyright © 2016年 张芳涛. All rights reserved.
//

#import "ViewController.h"
#import <GPUImage/GPUImage.h>
#import "GPUImageBeautifyFilter.h"
#import <Masonry/Masonry.h>

@interface ViewController ()
@property(nonatomic,strong)GPUImageVideoCamera *videoCamera;
@property(nonatomic,strong)GPUImageView *filterView;
@property(nonatomic,strong)UIButton *beautiBtn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.videoCamera = [[GPUImageVideoCamera alloc]initWithSessionPreset:AVCaptureSessionPreset1280x720 cameraPosition:AVCaptureDevicePositionFront];
    self.videoCamera.outputImageOrientation =  UIInterfaceOrientationPortrait;
    self.videoCamera.horizontallyMirrorFrontFacingCamera = YES;
    self.filterView = [[GPUImageView alloc]initWithFrame:self.view.frame];
    self.filterView.center = self.view.center;
    
    
    [self.view addSubview:self.filterView];
    [self.videoCamera addTarget:self.filterView];
    [self.videoCamera startCameraCapture];
    
    self.beautiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.beautiBtn.backgroundColor = [UIColor whiteColor];
    [self.beautiBtn setTitle:@"开启美颜效果" forState:UIControlStateNormal];
    [self.beautiBtn setTitle:@"关闭美颜效果" forState:UIControlStateSelected];
    [self.beautiBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.beautiBtn addTarget:self action:@selector(beautify) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.beautiBtn];
    [self.beautiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-20);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
        make.centerX.equalTo(self.view);
    }];
    
    
}
-(void)beautify
{
    if (self.beautiBtn.selected) {
        self.beautiBtn.selected  =NO;
        [self.videoCamera removeAllTargets];
        [self.videoCamera addTarget:self.filterView];
        
    }
    else
    {
        self.beautiBtn.selected  = YES;
        [self.videoCamera removeAllTargets];
        GPUImageBeautifyFilter *beautifyFilter = [[GPUImageBeautifyFilter alloc]init];
        [self.videoCamera addTarget:beautifyFilter];
        [beautifyFilter addTarget:self.filterView];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
