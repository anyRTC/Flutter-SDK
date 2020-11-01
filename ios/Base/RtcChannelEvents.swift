//
//  RtcChannelEvents.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2020/10/29.
//

import Foundation
import ARtcKit

class RtcChannelEvents {
    static let Warning = "Warning"
    static let Error = "Error"
    static let JoinChannelSuccess = "JoinChannelSuccess"
    static let RejoinChannelSuccess = "RejoinChannelSuccess"
    static let LeaveChannel = "LeaveChannel"
    static let ClientRoleChanged = "ClientRoleChanged"
    static let UserJoined = "UserJoined"
    static let UserOffline = "UserOffline"
    static let ConnectionStateChanged = "ConnectionStateChanged"
    static let ConnectionLost = "ConnectionLost"
    static let TokenPrivilegeWillExpire = "TokenPrivilegeWillExpire"
    static let RequestToken = "RequestToken"
    static let ActiveSpeaker = "ActiveSpeaker"
    static let VideoSizeChanged = "VideoSizeChanged"
    static let RemoteVideoStateChanged = "RemoteVideoStateChanged"
    static let RemoteAudioStateChanged = "RemoteAudioStateChanged"
    static let LocalPublishFallbackToAudioOnly = "LocalPublishFallbackToAudioOnly"
    static let RemoteSubscribeFallbackToAudioOnly = "RemoteSubscribeFallbackToAudioOnly"
    static let RtcStats = "RtcStats"
    static let NetworkQuality = "NetworkQuality"
    static let RemoteVideoStats = "RemoteVideoStats"
    static let RemoteAudioStats = "RemoteAudioStats"
    static let RtmpStreamingStateChanged = "RtmpStreamingStateChanged"
    static let TranscodingUpdated = "TranscodingUpdated"
    static let StreamInjectedStatus = "StreamInjectedStatus"
    static let StreamMessage = "StreamMessage"
    static let StreamMessageError = "StreamMessageError"
    static let ChannelMediaRelayStateChanged = "ChannelMediaRelayStateChanged"
    static let ChannelMediaRelayEvent = "ChannelMediaRelayEvent"
    static let MetadataReceived = "MetadataReceived"
    static let AudioPublishStateChanged = "AudioPublishStateChanged"
    static let VideoPublishStateChanged = "VideoPublishStateChanged"
    static let AudioSubscribeStateChanged = "AudioSubscribeStateChanged"
    static let VideoSubscribeStateChanged = "VideoSubscribeStateChanged"
    static let RtmpStreamingEvent = "RtmpStreamingEvent"

    static func toMap() -> Dictionary<String, String> {
        return [
            "Warning": Warning,
            "Error": Error,
            "JoinChannelSuccess": JoinChannelSuccess,
            "RejoinChannelSuccess": RejoinChannelSuccess,
            "LeaveChannel": LeaveChannel,
            "ClientRoleChanged": ClientRoleChanged,
            "UserJoined": UserJoined,
            "UserOffline": UserOffline,
            "ConnectionStateChanged": ConnectionStateChanged,
            "ConnectionLost": ConnectionLost,
            "TokenPrivilegeWillExpire": TokenPrivilegeWillExpire,
            "RequestToken": RequestToken,
            "ActiveSpeaker": ActiveSpeaker,
            "VideoSizeChanged": VideoSizeChanged,
            "RemoteVideoStateChanged": RemoteVideoStateChanged,
            "RemoteAudioStateChanged": RemoteAudioStateChanged,
            "LocalPublishFallbackToAudioOnly": LocalPublishFallbackToAudioOnly,
            "RemoteSubscribeFallbackToAudioOnly": RemoteSubscribeFallbackToAudioOnly,
            "RtcStats": RtcStats,
            "NetworkQuality": NetworkQuality,
            "RemoteVideoStats": RemoteVideoStats,
            "RemoteAudioStats": RemoteAudioStats,
            "RtmpStreamingStateChanged": RtmpStreamingStateChanged,
            "TranscodingUpdated": TranscodingUpdated,
            "StreamInjectedStatus": StreamInjectedStatus,
            "StreamMessage": StreamMessage,
            "StreamMessageError": StreamMessageError,
            "ChannelMediaRelayStateChanged": ChannelMediaRelayStateChanged,
            "ChannelMediaRelayEvent": ChannelMediaRelayEvent,
            "MetadataReceived": MetadataReceived,
            "AudioPublishStateChanged": AudioPublishStateChanged,
            "VideoPublishStateChanged": VideoPublishStateChanged,
            "AudioSubscribeStateChanged": AudioSubscribeStateChanged,
            "VideoSubscribeStateChanged": VideoSubscribeStateChanged,
            "RtmpStreamingEvent": RtmpStreamingEvent,
        ]
    }
}

class RtcChannelEventHandler: NSObject {
    static let PREFIX = "io.anyrtc.rtc."

    var emitter: (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void

    init(_ emitter: @escaping (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void) {
        self.emitter = emitter
    }

    private func callback(_ methodName: String, _ channel: ARtcChannel, _ data: Any?...) {
        emitter(methodName, [
            "channelId": channel.getId(),
            "data": data
        ])
    }
}

extension RtcChannelEventHandler: ARtcChannelDelegate {
    func rtcChannel(_ rtcChannel: ARtcChannel, didOccurWarning warningCode: ARWarningCode) {
        callback(RtcChannelEvents.Warning, rtcChannel, warningCode.rawValue)
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, didOccurError errorCode: ARErrorCode) {
        callback(RtcChannelEvents.Error, rtcChannel, errorCode.rawValue)
    }
    
    func rtcChannelDidJoin(_ rtcChannel: ARtcChannel, withUid uid: String, elapsed: Int) {
        callback(RtcChannelEvents.JoinChannelSuccess, rtcChannel, rtcChannel.getId(), uid, elapsed)
    }
    
    func rtcChannelDidRejoin(_ rtcChannel: ARtcChannel, withUid uid: String, elapsed: Int) {
        callback(RtcChannelEvents.RejoinChannelSuccess, rtcChannel, rtcChannel.getId(), uid, elapsed)
    }
    
    func rtcChannelDidLeave(_ rtcChannel: ARtcChannel, with stats: ARChannelStats) {
        callback(RtcChannelEvents.LeaveChannel, rtcChannel, stats.toMap())
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, didClientRoleChanged oldRole: ARClientRole, newRole: ARClientRole) {
        callback(RtcChannelEvents.ClientRoleChanged, rtcChannel, oldRole.rawValue, newRole.rawValue)
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, didJoinedOfUid uid: String, elapsed: Int) {
        callback(RtcChannelEvents.UserJoined, rtcChannel, uid, elapsed)
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, didOfflineOfUid uid: String, reason: ARUserOfflineReason) {
        callback(RtcChannelEvents.UserOffline, rtcChannel, uid, reason.rawValue)
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, connectionChangedTo state: ARConnectionStateType, reason: ARConnectionChangedReason) {
        callback(RtcChannelEvents.ConnectionStateChanged, rtcChannel, state.rawValue, reason.rawValue)
    }
    
    func rtcChannelDidLost(_ rtcChannel: ARtcChannel) {
        callback(RtcChannelEvents.ConnectionLost, rtcChannel)
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, tokenPrivilegeWillExpire token: String) {
        callback(RtcChannelEvents.TokenPrivilegeWillExpire, rtcChannel, token)
    }

    func rtcChannelRequestToken(_ rtcChannel: ARtcChannel) {
        callback(RtcChannelEvents.RequestToken, rtcChannel)
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, activeSpeaker speakerUid: String) {
        callback(RtcChannelEvents.ActiveSpeaker, rtcChannel, speakerUid)
    }

    func rtcChannel(_ rtcChannel: ARtcChannel, videoSizeChangedOfUid uid: String, size: CGSize, rotation: Int) {
        callback(RtcChannelEvents.VideoSizeChanged, rtcChannel, uid, Int(size.width), Int(size.height), rotation)
    }

    func rtcChannel(_ rtcChannel: ARtcChannel, remoteVideoStateChangedOfUid uid: String, state: ARVideoRemoteState, reason: ARVideoRemoteStateReason, elapsed: Int) {
        callback(RtcChannelEvents.RemoteVideoStateChanged, rtcChannel, uid, state.rawValue, reason.rawValue, elapsed)
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, remoteAudioStateChangedOfUid uid: String, state: ARAudioRemoteState, reason: ARAudioRemoteStateReason, elapsed: Int) {
        callback(RtcChannelEvents.RemoteAudioStateChanged, rtcChannel, uid, state.rawValue, reason.rawValue, elapsed)
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, reportRtcStats stats: ARChannelStats) {
        callback(RtcChannelEvents.RtcStats, rtcChannel, stats.toMap())
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, networkQuality uid: String, txQuality: ARNetworkQuality, rxQuality: ARNetworkQuality) {
        callback(RtcChannelEvents.NetworkQuality, rtcChannel, uid, txQuality.rawValue, rxQuality.rawValue)
    }
    
    func rtcChannel(_ rtcChannel: ARtcChannel, remoteVideoStats stats: ARtcRemoteVideoStats) {
        callback(RtcChannelEvents.RemoteVideoStats, rtcChannel, stats.toMap())
    }

    func rtcChannel(_ rtcChannel: ARtcChannel, remoteAudioStats stats: ARtcRemoteAudioStats) {
        callback(RtcChannelEvents.RemoteAudioStats, rtcChannel, stats.toMap())
    }
}
