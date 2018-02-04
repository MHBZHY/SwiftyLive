//
//  SampleHandler.swift
//  SwiftyLiveExtension
//
//  Created by zhy on 03/02/2018.
//  Copyright © 2018 zhy. All rights reserved.
//

import ReplayKit

class SampleHandler: RPBroadcastSampleHandler, SmartPublisherDelegate {
    //MARK: Variables
    var publisher: SmartPublisherSDK?
    var publisherDelegate: SmartPublisherDelegate?
    var userDefaults = UserDefaults(suiteName: "group.SwiftyLive.Share")

    //MARK: - SmartPublisherDelegateMethod
    func handleSmartPublisherEvent(_ nID: Int, param1: UInt64, param2: UInt64, param3: String!, param4: String!, pObj: UnsafeMutableRawPointer!) -> Int {
        return 0
    }
    
    //MARK: - SampleHandlerOverrideMethod
    override func broadcastStarted(withSetupInfo setupInfo: [String : NSObject]?) {
        // User has requested to start the broadcast. Setup info from the UI extension can be supplied but optional.
        publisher = SmartPublisherSDK()
        
        if publisherDelegate == nil {
            publisherDelegate = self
        }
        
        
    }
    
    override func broadcastPaused() {
        // User has requested to pause the broadcast. Samples will stop being delivered.
        publisher?.smartPublisherStopPublisher()
    }
    
    override func broadcastResumed() {
        // User has requested to resume the broadcast. Samples delivery will resume.
        let url = userDefaults?.string(forKey: "publishURL")
        publisher?.smartPublisherStartPublish(url)
    }
    
    override func broadcastFinished() {
        // User has requested to finish the broadcast.
        publisher?.smartPublisherStopPublish()
    }
    
    override func processSampleBuffer(_ sampleBuffer: CMSampleBuffer, with sampleBufferType: RPSampleBufferType) {
        switch sampleBufferType {
            case RPSampleBufferType.video:
                // Handle video sample buffer
                break
            case RPSampleBufferType.audioApp:
                // Handle audio sample buffer for app audio
                break
            case RPSampleBufferType.audioMic:
                // Handle audio sample buffer for mic audio
                break
        }
    }
}
