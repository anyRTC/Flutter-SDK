//
//  Extensions.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2020/10/29.
//

import UIKit
import ARtcKit

extension ARtcLocalAudioStats {
    func toMap() -> Dictionary<String, Any?> {
        return [
            "numChannels": numChannels,
            "sentSampleRate": sentSampleRate,
            "sentBitrate": sentBitrate
        ]
    }
}

extension ARChannelStats {
    func toMap() -> Dictionary<String, Any?> {
        return [
            "totalDuration": duration,
            "txBytes": txBytes,
            "rxBytes": rxBytes,
            "txAudioBytes": txAudioBytes,
            "txVideoBytes": txVideoBytes,
            "rxAudioBytes": rxAudioBytes,
            "rxVideoBytes": rxVideoBytes,
            "txKBitRate": txKBitrate,
            "rxKBitRate": rxKBitrate,
            "txAudioKBitRate": txAudioKBitrate,
            "rxAudioKBitRate": rxAudioKBitrate,
            "txVideoKBitRate": txVideoKBitrate,
            "rxVideoKBitRate": rxVideoKBitrate,
            "users": userCount,
            "lastmileDelay": lastmileDelay,
            "txPacketLossRate": txPacketLossRate,
            "rxPacketLossRate": rxPacketLossRate,
            "cpuTotalUsage": cpuTotalUsage,
            "cpuAppUsage": cpuAppUsage,
            "gatewayRtt": gatewayRtt,
            "memoryAppUsageRatio": memoryAppUsageRatio,
            "memoryTotalUsageRatio": memoryTotalUsageRatio,
            "memoryAppUsageInKbytes": memoryAppUsageInKbytes
        ]
    }
}

extension CGRect {
    func toMap() -> Dictionary<String, Any?> {
        return [
            "left": origin.x,
            "top": origin.y,
            "right": origin.x + size.width,
            "bottom": origin.y + size.height
        ]
    }
}

extension ARtcRemoteAudioStats {
    func toMap() -> Dictionary<String, Any?> {
        return [
            "uid": uid,
            "quality": quality.rawValue,
            "networkTransportDelay": networkTransportDelay,
            "jitterBufferDelay": jitterBufferDelay,
            "audioLossRate": audioLossRate,
            "numChannels": numChannels,
            "receivedSampleRate": receivedSampleRate,
            "receivedBitrate": receivedBitrate,
            "totalFrozenTime": totalFrozenTime,
            "frozenRate": frozenRate
        ]
    }
}

extension ARtcLocalVideoStats {
    func toMap() -> Dictionary<String, Any?> {
        return [
            "sentBitrate": sentBitrate,
            "sentFrameRate": sentFrameRate,
            "encoderOutputFrameRate": encoderOutputFrameRate,
            "rendererOutputFrameRate": rendererOutputFrameRate,
            "targetBitrate": sentTargetBitrate,
            "targetFrameRate": sentTargetFrameRate,
            "qualityAdaptIndication": qualityAdaptIndication.rawValue,
            "encodedBitrate": encodedBitrate,
            "encodedFrameWidth": encodedFrameWidth,
            "encodedFrameHeight": encodedFrameHeight,
            "encodedFrameCount": encodedFrameCount,
            "codecType": codecType.rawValue,
        ]
    }
}

extension ARtcRemoteVideoStats {
    func toMap() -> Dictionary<String, Any?> {
        return [
            "uid": uid,
            "delay": delay,
            "width": width,
            "height": height,
            "receivedBitrate": receivedBitrate,
            "decoderOutputFrameRate": decoderOutputFrameRate,
            "rendererOutputFrameRate": rendererOutputFrameRate,
            "packetLossRate": packetLossRate,
            "rxStreamType": rxStreamType.rawValue,
            "totalFrozenTime": totalFrozenTime,
            "frozenRate": frozenRate
        ]
    }
}

extension ARtcAudioVolumeInfo {
    func toMap() -> Dictionary<String, Any?> {
        return [
            "uid": uid,
            "volume": volume,
            "vad": vad,
            "channelId": channelId
        ]
    }
}

extension Array where Element: ARtcAudioVolumeInfo {
    func toMapList() -> Array<Dictionary<String, Any?>> {
        var list = [Dictionary<String, Any?>]()
        self.forEach { (item) in
            list.append(item.toMap())
        }
        return list
    }
}

extension ARFacePositionInfo {
    func toMap() -> Dictionary<String, Any?> {
        return [
            "x": x,
            "y": y,
            "width": width,
            "height": height,
            "distance": distance
        ]
    }
}

extension Array where Element: ARFacePositionInfo {
    func toMapList() -> Array<Dictionary<String, Any?>> {
        var list = [Dictionary<String, Any?>]()
        self.forEach { (item) in
            list.append(item.toMap())
        }
        return list
    }
}

