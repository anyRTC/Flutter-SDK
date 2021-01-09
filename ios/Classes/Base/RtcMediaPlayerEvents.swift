//
//  RtcMediaPlayerEvents.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2021/1/9.
//

import Foundation
import ARtcKit

class RtcMediaPlayerEvents {
    static let MediaPlayerStateChanged = "MediaPlayerStateChanged"
    static let MediaPlayerChangedToPosition = "MediaPlayerChangedToPosition"
    static let MediaPlayerDidOccurEvent = "MediaPlayerDidOccurEvent"
    static let MediaPlayerReceiveData = "MediaPlayerReceiveData"
    static let MediaPlayerReceiveVideoFrame = "MediaPlayerReceiveVideoFrame"
    static let MediaPlayerReceiveAudioFrame = "MediaPlayerReceiveAudioFrame"
    
    static func toMap() -> Dictionary<String, String> {
        return [
            "MediaPlayerStateChanged": MediaPlayerStateChanged,
            "MediaPlayerChangedToPosition": MediaPlayerChangedToPosition,
            "MediaPlayerDidOccurEvent": MediaPlayerDidOccurEvent,
            "MediaPlayerReceiveData": MediaPlayerReceiveData,
            "MediaPlayerReceiveVideoFrame": MediaPlayerReceiveVideoFrame,
            "MediaPlayerReceiveAudioFrame": MediaPlayerReceiveAudioFrame,
        ];
    }
}

class RtcMediaPlayerEventHandler: NSObject {
    static let PREFIX = "io.anyrtc.rtc."

    var emitter: (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void

    init(emitter: @escaping (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void) {
        self.emitter = emitter
    }

    private func callback(_ methodName: String, _ data: Any?...) {
        emitter(methodName, ["data": data])
    }
}

extension RtcMediaPlayerEventHandler: ARMediaPlayerDelegate {
    func rtcMediaPlayer(_ playerKit: ARMediaPlayer, didChangedTo state: ARMediaPlayerState, error: ARMediaPlayerError) {
        //报告播放器状态改变
        callback(RtcMediaPlayerEvents.MediaPlayerStateChanged, playerKit,state,error)
    }
    
    func rtcMediaPlayer(_ playerKit: ARMediaPlayer, didChangedToPosition position: Int) {
        //报告当前播放进度
        callback(RtcMediaPlayerEvents.MediaPlayerChangedToPosition, playerKit,position)
    }
    
    func rtcMediaPlayer(_ playerKit: ARMediaPlayer, didOccur event: ARMediaPlayerEvent) {
        //报告定位播放的结果
        callback(RtcMediaPlayerEvents.MediaPlayerDidOccurEvent, playerKit,event)
    }
    
    func rtcMediaPlayer(_ playerKit: ARMediaPlayer, metaDataType type: ARMediaPlayerMetaDataType, didReceiveData data: String, length: Int) {
        //报告已获取媒体附属信息
        callback(RtcMediaPlayerEvents.MediaPlayerReceiveData, playerKit,type,data,length)
    }
    
    func rtcMediaPlayer(_ playerKit: ARMediaPlayer, didReceiveVideoFrame pixelBuffer: CVPixelBuffer) {
        //已获取视频帧回调
        callback(RtcMediaPlayerEvents.MediaPlayerReceiveVideoFrame, playerKit,pixelBuffer)
    }
    
    func rtcMediaPlayer(_ playerKit: ARMediaPlayer, didReceiveAudioFrame audioFrame: CMSampleBuffer) {
        //已获取音频帧回调
        callback(RtcMediaPlayerEvents.MediaPlayerReceiveAudioFrame, playerKit,audioFrame)
    }
}
