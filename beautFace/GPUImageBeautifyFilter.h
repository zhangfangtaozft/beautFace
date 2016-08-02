//
//  GPUImageBeautifyFilter.h
//  beautFace
//
//  Created by 张芳涛 on 16/8/2.
//  Copyright © 2016年 张芳涛. All rights reserved.
//

#import <GPUImage/GPUImage.h>
@class GPUImageCombinationFilter;

@interface GPUImageBeautifyFilter : GPUImageFilterGroup
{
    GPUImageBilateralFilter *bilateralFilter;
    GPUImageCannyEdgeDetectionFilter *cannyEdgeFilter;
    GPUImageCombinationFilter *combinationFilter;
    GPUImageHSBFilter *hsbFilter;
}
@end
