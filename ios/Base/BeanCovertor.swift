//
//  BeanCovertor.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2020/10/29.
//

import Foundation
import ARtcKit

func mapToPoint(_ map: Dictionary<String, Any>) -> CGPoint {
    var point = CGPoint()
    if let x = map["x"] as? Int {
        point.x = CGFloat(x)
    }
    if let y = map["y"] as? Int {
        point.y = CGFloat(y)
    }
    return point
}

func mapToSize(_ map: Dictionary<String, Any>) -> CGSize {
    var size = CGSize()
    if let width = map["width"] as? Int {
        size.width = CGFloat(width)
    }
    if let height = map["height"] as? Int {
        size.height = CGFloat(height)
    }
    return size
}

func mapToRect(_ map: Dictionary<String, Any>) -> CGRect {
    return CGRect(
            origin: mapToPoint(map),
            size: mapToSize(map)
    )
}

func mapToVideoEncoderConfiguration(_ map: Dictionary<String, Any>) -> ARVideoEncoderConfiguration {
    let config = ARVideoEncoderConfiguration()
    if let dimensions = map["dimensions"] as? Dictionary<String, Any> {
        config.dimensions = mapToSize(dimensions)
    }
    if let frameRate = map["frameRate"] as? Int {
        config.frameRate = frameRate
    }
    if let minFrameRate = map["minFrameRate"] as? Int {
        config.minFrameRate = minFrameRate
    }
    if let bitrate = map["bitrate"] as? Int {
        config.bitrate = bitrate
    }
    if let minBitrate = map["minBitrate"] as? Int {
        config.minBitrate = minBitrate
    }
    if let orientationMode = map["orientationMode"] as? Int {
        if let orientationMode = ARVideoOutputOrientationMode(rawValue: orientationMode) {
            config.orientationMode = orientationMode
        }
    }
    if let degradationPreference = map["degradationPrefer"] as? Int {
        if let degradationPreference = ARDegradationPreference(rawValue: degradationPreference) {
            config.degradationPreference = degradationPreference
        }
    }
    if let mirrorMode = map["mirrorMode"] as? Int {
        if let mirrorMode = ARVideoMirrorMode(rawValue: UInt(mirrorMode)) {
            config.mirrorMode = mirrorMode
        }
    }
    return config
}

func mapToColor(_ map: Dictionary<String, Any>) -> UIColor {
    return UIColor(
            red: CGFloat(map["red"] as! Int),
            green: CGFloat(map["green"] as! Int),
            blue: CGFloat(map["blue"] as! Int),
            alpha: 1.0
    )
}

func mapToChannelMediaInfo(_ map: Dictionary<String, Any>) -> ARChannelMediaRelayInfo {
    let info = ARChannelMediaRelayInfo()
    if let channelName = map["channelName"] as? String {
        info.channelName = channelName
    }
    if let token = map["token"] as? String {
        info.token = token
    }
    if let uid = map["uid"] as? String {
        info.uid = uid
    }
    return info
}

func mapToChannelMediaRelayConfiguration(_ map: Dictionary<String, Any>) -> ARChannelMediaRelayConfiguration {
    let config = ARChannelMediaRelayConfiguration()
    if let srcInfo = map["srcInfo"] as? Dictionary<String, Any> {
        config.sourceInfo = mapToChannelMediaInfo(srcInfo)
    }
    if let destInfos = map["destInfos"] as? Array<Any> {
        destInfos.forEach { (item) in
            if let item = item as? Dictionary<String, Any> {
                let info = mapToChannelMediaInfo(item)
                config.setDestinationInfo(info, forChannelName: info.channelName ?? "")
            }
        }
    }
    return config
}

func mapToLiveInjectStreamConfig(_ map: Dictionary<String, Any>) -> ARLiveInjectStreamConfig {
    let config = ARLiveInjectStreamConfig.default()
    config.size = mapToSize(map)
    if let videoGop = map["videoGop"] as? Int {
        config.videoGop = videoGop
    }
    if let videoFramerate = map["videoFramerate"] as? Int {
        config.videoFramerate = videoFramerate
    }
    if let videoBitrate = map["videoBitrate"] as? Int {
        config.videoBitrate = videoBitrate
    }
    if let audioSampleRate = map["audioSampleRate"] as? Int {
        if let audioSampleRate = ARAudioSampleRateType(rawValue: audioSampleRate) {
            config.audioSampleRate = audioSampleRate
        }
    }
    if let audioBitrate = map["audioBitrate"] as? Int {
        config.audioBitrate = audioBitrate
    }
    if let audioChannels = map["audioChannels"] as? Int {
        config.audioChannels = audioChannels
    }
    return config
}

func mapToCameraCapturerConfiguration(_ map: Dictionary<String, Any>) -> ARCameraCapturerConfiguration {
    let config = ARCameraCapturerConfiguration()
    config.preference = ARCameraCaptureOutputPreference(rawValue: map["preference"] as! Int)!
    config.cameraDirection = ARCameraDirection(rawValue: map["cameraDirection"] as! Int)!
    return config
}

func mapToChannelMediaOptions(_ map: Dictionary<String, Any>) -> ARtcChannelMediaOptions {
    let options = ARtcChannelMediaOptions()
    if let autoSubscribeAudio = map["autoSubscribeAudio"] as? Bool {
        options.autoSubscribeAudio = autoSubscribeAudio
    }
    if let autoSubscribeVideo = map["autoSubscribeVideo"] as? Bool {
        options.autoSubscribeVideo = autoSubscribeVideo
    }
    return options
}
