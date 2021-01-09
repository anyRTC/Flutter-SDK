//
//  StreamingKit.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2021/1/7.
//

import Foundation
import ARtcKit

protocol StreamingKitInterface {
    
    func createInstance(_ params: NSDictionary, _ callback: Callback)

    func release(callback: Callback)

    func pushStream(_ params: NSDictionary, _ callback: Callback)

    func unPushStream(_ callback: Callback)

    func setMode(_ params: NSDictionary, _ callback: Callback)

    func setLiveTranscoding(params: NSDictionary, _ callback: Callback)
}

@objc
class StreamingKitManager: NSObject, StreamingKitInterface {
    
    private var emitter: (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void
    private(set) var streamingKit: ARStreamingKit?

    init(_ emitter: @escaping (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void) {
        self.emitter = emitter
    }

    func Release() {
        streamingKit = nil
    }
    
    @objc func createInstance(_ params: NSDictionary, _ callback: Callback) {
        callback.resolve(params["engine"] as? ARtcEngineKit) { (e) -> Any? in
            streamingKit = ARStreamingKit.init()
            streamingKit?.setRtcEngine(e)
            return 0
        }
    }
    
    @objc func release(callback: Callback) {
        streamingKit?.destroy()
        callback.code(0)
    }
    
    @objc func pushStream(_ params: NSDictionary, _ callback: Callback) {
        callback.code(streamingKit?.pushStream(params["url"] as! String))
    }
    
    @objc func unPushStream(_ callback: Callback) {
        callback.code(streamingKit?.unPushStream())
    }
    
    @objc func setMode(_ params: NSDictionary, _ callback: Callback) {
        callback.code(0)
    }
    
    @objc func setLiveTranscoding(params: NSDictionary, _ callback: Callback) {
        callback.code(streamingKit?.setLiveTranscoding(mapToLiveTranscoding(params["transcoding"] as! Dictionary)))
    }
}
