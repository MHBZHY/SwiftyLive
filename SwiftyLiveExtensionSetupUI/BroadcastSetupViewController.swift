//
//  BroadcastSetupViewController.swift
//  SwiftyLiveExtensionSetupUI
//
//  Created by zhy on 03/02/2018.
//  Copyright © 2018 zhy. All rights reserved.
//

import ReplayKit

class BroadcastSetupViewController: UIViewController {
    
    var url: URL?
    var setupInfo: [String : NSCoding & NSObjectProtocol]?

    // Call this method when the user has finished interacting with the view controller and a broadcast stream can start
    func userDidFinishSetup() {
        // URL of the resource where broadcast can be viewed that will be returned to the application
        url = URL(string:"http://apple.com/broadcast/streamID")
        
        // Dictionary with setup information that will be provided to broadcast extension when broadcast is started
        setupInfo = ["broadcastName": "example" as NSCoding & NSObjectProtocol]
        
        // Tell ReplayKit that the extension is finished setting up and can begin broadcasting
        
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 30, height: 10))
        label.text = "请选择直播地址"
        
        let btn = UIButton(type: .custom)
        btn.setTitle("确认", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.addTarget(self, action: #selector(confirm), for: .touchUpInside)
    }
    
    func userDidCancelSetup() {
        let error = NSError(domain: "YouAppDomain", code: -1, userInfo: nil)
        // Tell ReplayKit that the extension was cancelled by the user
        self.extensionContext?.cancelRequest(withError: error)
    }
    
    @objc func confirm() {
        self.extensionContext?.completeRequest(withBroadcast: url!, setupInfo: setupInfo!)
    }
}
