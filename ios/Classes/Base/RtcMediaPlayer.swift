//
//  RtcMediaPlayer.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2021/1/7.
//

import Foundation
import ARtcKit

protocol RtcMediaPlayerInterface {
    
    func createInstance(_ callback: Callback)
    
    func destory(_ callback: Callback)
    
    func open(_ params: NSDictionary,_ callback: Callback)
    
    func play(_ callback: Callback)
    
    func pause(_ callback: Callback)
    
    func stop(_ callback: Callback)
    
    func seek(_ params: NSDictionary, _ callback: Callback)
    
    func mute(_ params: NSDictionary, _ callback: Callback)
    
    func isMute(_ callback: Callback)
    
    func adjustPlayoutVolume(_ params: NSDictionary, _ callback: Callback)
    
    func getPlayoutVolume(_ callback: Callback)
    
    func getPlayPosition(_ callback: Callback)
    
    func getDuration(_ callback: Callback)
    
    func getState(_ callback: Callback)
    
    func setRenderMode(_ params: NSDictionary, _ callback: Callback)
    
    func getStreamCount(_ callback: Callback)
    
    func getStreamByIndex(_ params: NSDictionary, _ callback: Callback)
}

@objc
class RtcMediaPlayerManager: NSObject, RtcMediaPlayerInterface {
    
    private var emitter: (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void
    private(set) var player: ARMediaPlayer?
    private var delegate: RtcMediaPlayerEventHandler?

    init(_ emitter: @escaping (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void) {
        self.emitter = emitter
    }

    func Release() {
        player?.destroy()
        player = nil
        delegate = nil
    }
    
    @objc func createInstance(_ callback: Callback) {
        delegate = RtcMediaPlayerEventHandler() { [weak self] methodName, data in
            self?.emitter(methodName, data)
        }
        
        player = ARMediaPlayer.init(delegate: delegate!)
        callback.code(0)
    }
    
    @objc func destory(_ callback: Callback) {
        player?.destroy()
        callback.code(0)
    }
    
    @objc func open(_ params: NSDictionary, _ callback: Callback) {
        player?.open(params["url"] as! String, startPos: params["startPos"] as! Int)
        callback.code(0)
    }
    
    @objc func play(_ callback: Callback) {
        player?.play()
        callback.code(0)
    }
    
    @objc func pause(_ callback: Callback) {
        player?.pause()
        callback.code(0)
    }
    
    @objc func stop(_ callback: Callback) {
        player?.stop()
        callback.code(0)
    }
    
    @objc func seek(_ params: NSDictionary, _ callback: Callback) {
        player?.seek(toPosition: params["position"] as! Int)
        callback.code(0)
    }
    
    @objc func mute(_ params: NSDictionary, _ callback: Callback) {
        player?.mute(params["mute"] as! Bool)
        callback.code(0)
    }
    
    @objc func isMute(_ callback: Callback) {
        callback.resolve(player) { it in
            it.getMute()
        }
    }
    
    @objc func adjustPlayoutVolume(_ params: NSDictionary, _ callback: Callback) {
        callback.resolve(player) { (it) -> Any? in
            it.adjustVolume(Int32(params["vol"] as! Int))
        }
    }
    
    @objc func getPlayoutVolume(_ callback: Callback) {
        callback.resolve(player) { it in
            it.volume
        }
    }
    
    @objc func getPlayPosition(_ callback: Callback) {
        callback.resolve(player) { (it) -> Any? in
            it.getPosition()
        }
    }
    
    @objc func getDuration(_ callback: Callback) {
        callback.resolve(player) { (it) -> Any? in
            it.getDuration()
        }
    }
    
    @objc func getState(_ callback: Callback) {
        callback.resolve(player) { (it) -> Any? in
            it.state
        }
    }
    
    @objc func setRenderMode(_ params: NSDictionary, _ callback: Callback) {
        player?.setRenderMode(ARMediaPlayerRenderMode(rawValue: ARMediaPlayerRenderMode.RawValue(params["mode"] as! Int))!)
        callback.code(0)
    }
    
    @objc func getStreamCount(_ callback: Callback) {
        callback.resolve(player) { (it) -> Any? in
            it.getStreamCount()
        }
    }
    
    @objc func getStreamByIndex(_ params: NSDictionary, _ callback: Callback) {
        callback.resolve(player) { (it) -> Any? in
            it.getStreamBy(Int32(params["index"] as! Int))
        }
    }
}
