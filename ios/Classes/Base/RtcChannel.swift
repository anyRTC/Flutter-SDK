//
//  ArRtcChannel.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2020/10/29.
//

import Foundation
import ARtcKit

protocol RtcChannelInterface:
        RtcChannelAudioInterface,
        RtcChannelVideoInterface,
        RtcChannelDualStreamInterface {
    func create(_ params: NSDictionary, _ callback: Callback)

    func destroy(_ params: NSDictionary, _ callback: Callback)

    func setClientRole(_ params: NSDictionary, _ callback: Callback)

    func joinChannel(_ params: NSDictionary, _ callback: Callback)

    func leaveChannel(_ params: NSDictionary, _ callback: Callback)

    func renewToken(_ params: NSDictionary, _ callback: Callback)

    func publish(_ params: NSDictionary, _ callback: Callback)

    func unpublish(_ params: NSDictionary, _ callback: Callback)
}

protocol RtcChannelAudioInterface {
    func adjustUserPlaybackSignalVolume(_ params: NSDictionary, _ callback: Callback)

    func muteRemoteAudioStream(_ params: NSDictionary, _ callback: Callback)

    func muteAllRemoteAudioStreams(_ params: NSDictionary, _ callback: Callback)

    func setDefaultMuteAllRemoteAudioStreams(_ params: NSDictionary, _ callback: Callback)
}

protocol RtcChannelVideoInterface {
    func muteRemoteVideoStream(_ params: NSDictionary, _ callback: Callback)

    func muteAllRemoteVideoStreams(_ params: NSDictionary, _ callback: Callback)

    func setDefaultMuteAllRemoteVideoStreams(_ params: NSDictionary, _ callback: Callback)
}

protocol RtcChannelDualStreamInterface {
    func setRemoteVideoStreamType(_ params: NSDictionary, _ callback: Callback)

    func setRemoteDefaultVideoStreamType(_ params: NSDictionary, _ callback: Callback)
}


@objc
class RtcChannelManager: NSObject, RtcChannelInterface {
    private var emitter: (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void
    private var rtcChannelMap = [String: ARtcChannel]()
    private var rtcChannelDelegateMap = [String: RtcChannelEventHandler]()

    init(_ emitter: @escaping (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void) {
        self.emitter = emitter
    }

    func Release() {
        rtcChannelMap.forEach { key, value in
            value.destroy()
        }
        rtcChannelMap.removeAll()
        rtcChannelDelegateMap.removeAll()
    }

    subscript(channelId: String) -> ARtcChannel? {
        get {
            return rtcChannelMap[channelId]
        }
    }

    @objc func create(_ params: NSDictionary, _ callback: Callback) {
        callback.resolve(params["engine"] as? ARtcEngineKit) { [weak self] it in
            if let rtcChannel = it.createRtcChannel(params["channelId"] as! String) {
                let delegate = RtcChannelEventHandler() { [weak self] methodName, data in
                    self?.emitter(methodName, data)
                }
                rtcChannel.setRtcChannelDelegate(delegate)
                self?.rtcChannelMap[rtcChannel.getId()!] = rtcChannel
                self?.rtcChannelDelegateMap[rtcChannel.getId()!] = delegate
            }
            return nil
        }
    }

    @objc func destroy(_ params: NSDictionary, _ callback: Callback) {
        var code: Int32? = -Int32(ARErrorCode.notInitialized.rawValue)
        if let it = self[params["channelId"] as! String] {
            code = rtcChannelMap.removeValue(forKey: it.getId()!)?.destroy()
        }
        callback.code(code)
    }

    @objc func setClientRole(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.setClientRole(ARClientRole(rawValue: params["role"] as! Int)!))
    }

    @objc func joinChannel(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.join(byToken: params["token"] as? String,uid: params["optionalUid"] as? String, options: mapToChannelMediaOptions(params["options"] as! Dictionary)))
    }

    @objc func leaveChannel(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.leave())
    }

    @objc func renewToken(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.renewToken(params["token"] as! String))
    }

    @objc func publish(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.publish())
    }

    @objc func unpublish(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.unpublish())
    }

    @objc func adjustUserPlaybackSignalVolume(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.adjustUserPlaybackSignalVolume(params["uid"] as! String, volume: params["volume"] as! Int32))
    }

    @objc func muteRemoteAudioStream(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.muteRemoteAudioStream(params["uid"] as! String, mute: params["muted"] as! Bool))
    }

    @objc func muteAllRemoteAudioStreams(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.muteAllRemoteAudioStreams(params["muted"] as! Bool))
    }

    @objc func setDefaultMuteAllRemoteAudioStreams(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.setDefaultMuteAllRemoteAudioStreams(params["muted"] as! Bool))
    }

    @objc func muteRemoteVideoStream(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.muteRemoteVideoStream(params["uid"] as! String, mute: params["muted"] as! Bool))
    }

    @objc func muteAllRemoteVideoStreams(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.muteAllRemoteVideoStreams(params["muted"] as! Bool))
    }

    @objc func setDefaultMuteAllRemoteVideoStreams(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.setDefaultMuteAllRemoteVideoStreams(params["muted"] as! Bool))
    }

    @objc func setRemoteVideoStreamType(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.setRemoteVideoStream(params["uid"] as! String, type: ARVideoStreamType(rawValue: params["streamType"] as! Int)!))
    }

    @objc func setRemoteDefaultVideoStreamType(_ params: NSDictionary, _ callback: Callback) {
        callback.code(self[params["channelId"] as! String]?.setRemoteDefaultVideoStreamType(ARVideoStreamType(rawValue: params["streamType"] as! Int)!))
    }
}

