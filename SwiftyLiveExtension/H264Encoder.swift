//
//  H264Encoder.swift
//  SwiftyLiveExtension
//
//  Created by zhy on 04/02/2018.
//  Copyright © 2018 zhy. All rights reserved.
//

import Foundation
import VideoToolbox

class H264Encoder {
    
    var status: OSStatus!
    var outputCallback: VTCompressionOutputCallback!
    var encodingSession: VTCompressionSession?
    var h264Data: UnsafeMutableRawPointer?
    
    init(width: Int, height: Int) {
//        //@convention(c) (UnsafeMutableRawPointer?, UnsafeMutableRawPointer?, OSStatus, VTEncodeInfoFlags, CMSampleBuffer?) -> Swift.Void
//        outputCallback = { outputCallbackRefCon, sourceFrameRefCon, status, infoFlags, sampleBuffer in
//
//        }
        
        status = VTCompressionSessionCreate(nil, Int32(width), Int32(height), kCMVideoCodecType_H264, nil, nil, nil, didCompressCallBack, nil, &encodingSession)
    }
    
    
    func didCompress(with callBack: ((UnsafeMutableRawPointer?) -> Void)) {
        callBack(h264Data)
    }
}

//MARK: - 全局函数，编码器完成一帧编码后的回调
func didCompressCallBack(outputCallbackRefCon: UnsafeMutableRawPointer?, sourceFrameRefCon: UnsafeMutableRawPointer?, status: OSStatus, infoFlags: VTEncodeInfoFlags, sampleBuffer: CMSampleBuffer?)  {
    
}
