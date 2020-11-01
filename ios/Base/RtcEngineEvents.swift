//
//  RtcEngineEvents.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2020/10/29.
//

import Foundation
import ARtcKit

class RtcEngineEvents {
    static let Warning = "Warning"
    static let Error = "Error"
    static let ApiCallExecuted = "ApiCallExecuted"
    static let JoinChannelSuccess = "JoinChannelSuccess"
    static let RejoinChannelSuccess = "RejoinChannelSuccess"
    static let LeaveChannel = "LeaveChannel"
    static let LocalUserRegistered = "LocalUserRegistered"
    static let UserInfoUpdated = "UserInfoUpdated"
    static let ClientRoleChanged = "ClientRoleChanged"
    static let UserJoined = "UserJoined"
    static let UserOffline = "UserOffline"
    static let ConnectionStateChanged = "ConnectionStateChanged"
    static let NetworkTypeChanged = "NetworkTypeChanged"
    static let ConnectionLost = "ConnectionLost"
    static let TokenPrivilegeWillExpire = "TokenPrivilegeWillExpire"
    static let RequestToken = "RequestToken"
    static let AudioVolumeIndication = "AudioVolumeIndication"
    static let ActiveSpeaker = "ActiveSpeaker"
    static let FirstLocalAudioFrame = "FirstLocalAudioFrame"
    static let FirstLocalVideoFrame = "FirstLocalVideoFrame"
    static let UserMuteVideo = "UserMuteVideo"
    static let VideoSizeChanged = "VideoSizeChanged"
    static let RemoteVideoStateChanged = "RemoteVideoStateChanged"
    static let LocalVideoStateChanged = "LocalVideoStateChanged"
    static let RemoteAudioStateChanged = "RemoteAudioStateChanged"
    static let LocalAudioStateChanged = "LocalAudioStateChanged"
    static let LocalPublishFallbackToAudioOnly = "LocalPublishFallbackToAudioOnly"
    static let RemoteSubscribeFallbackToAudioOnly = "RemoteSubscribeFallbackToAudioOnly"
    static let AudioRouteChanged = "AudioRouteChanged"
    static let CameraFocusAreaChanged = "CameraFocusAreaChanged"
    static let CameraExposureAreaChanged = "CameraExposureAreaChanged"
    static let FacePositionChanged = "FacePositionChanged"
    static let RtcStats = "RtcStats"
    static let LastmileQuality = "LastmileQuality"
    static let NetworkQuality = "NetworkQuality"
    static let LastmileProbeResult = "LastmileProbeResult"
    static let LocalVideoStats = "LocalVideoStats"
    static let LocalAudioStats = "LocalAudioStats"
    static let RemoteVideoStats = "RemoteVideoStats"
    static let RemoteAudioStats = "RemoteAudioStats"
    static let AudioMixingFinished = "AudioMixingFinished"
    static let AudioMixingStateChanged = "AudioMixingStateChanged"
    static let AudioEffectFinished = "AudioEffectFinished"
    static let RtmpStreamingStateChanged = "RtmpStreamingStateChanged"
    static let TranscodingUpdated = "TranscodingUpdated"
    static let StreamInjectedStatus = "StreamInjectedStatus"
    static let StreamMessage = "StreamMessage"
    static let StreamMessageError = "StreamMessageError"
    static let MediaEngineLoadSuccess = "MediaEngineLoadSuccess"
    static let MediaEngineStartCallSuccess = "MediaEngineStartCallSuccess"
    static let ChannelMediaRelayStateChanged = "ChannelMediaRelayStateChanged"
    static let ChannelMediaRelayEvent = "ChannelMediaRelayEvent"
    static let FirstRemoteVideoFrame = "FirstRemoteVideoFrame"
    static let FirstRemoteAudioFrame = "FirstRemoteAudioFrame"
    static let FirstRemoteAudioDecoded = "FirstRemoteAudioDecoded"
    static let UserMuteAudio = "UserMuteAudio"
    static let StreamPublished = "StreamPublished"
    static let StreamUnpublished = "StreamUnpublished"
    static let RemoteAudioTransportStats = "RemoteAudioTransportStats"
    static let RemoteVideoTransportStats = "RemoteVideoTransportStats"
    static let UserEnableVideo = "UserEnableVideo"
    static let UserEnableLocalVideo = "UserEnableLocalVideo"
    static let FirstRemoteVideoDecoded = "FirstRemoteVideoDecoded"
    static let MicrophoneEnabled = "MicrophoneEnabled"
    static let ConnectionInterrupted = "ConnectionInterrupted"
    static let ConnectionBanned = "ConnectionBanned"
    static let AudioQuality = "AudioQuality"
    static let CameraReady = "CameraReady"
    static let VideoStopped = "VideoStopped"
    static let MetadataReceived = "MetadataReceived"
    static let FirstLocalAudioFramePublished = "FirstLocalAudioFramePublished"
    static let FirstLocalVideoFramePublished = "FirstLocalVideoFramePublished"
    static let AudioPublishStateChanged = "AudioPublishStateChanged"
    static let VideoPublishStateChanged = "VideoPublishStateChanged"
    static let AudioSubscribeStateChanged = "AudioSubscribeStateChanged"
    static let VideoSubscribeStateChanged = "VideoSubscribeStateChanged"
    static let RtmpStreamingEvent = "RtmpStreamingEvent"

    static func toMap() -> Dictionary<String, String> {
        return [
            "Warning": Warning,
            "Error": Error,
            "ApiCallExecuted": ApiCallExecuted,
            "JoinChannelSuccess": JoinChannelSuccess,
            "RejoinChannelSuccess": RejoinChannelSuccess,
            "LeaveChannel": LeaveChannel,
            "LocalUserRegistered": LocalUserRegistered,
            "UserInfoUpdated": UserInfoUpdated,
            "ClientRoleChanged": ClientRoleChanged,
            "UserJoined": UserJoined,
            "UserOffline": UserOffline,
            "ConnectionStateChanged": ConnectionStateChanged,
            "NetworkTypeChanged": NetworkTypeChanged,
            "ConnectionLost": ConnectionLost,
            "TokenPrivilegeWillExpire": TokenPrivilegeWillExpire,
            "RequestToken": RequestToken,
            "AudioVolumeIndication": AudioVolumeIndication,
            "ActiveSpeaker": ActiveSpeaker,
            "FirstLocalAudioFrame": FirstLocalAudioFrame,
            "FirstLocalVideoFrame": FirstLocalVideoFrame,
            "UserMuteVideo": UserMuteVideo,
            "VideoSizeChanged": VideoSizeChanged,
            "RemoteVideoStateChanged": RemoteVideoStateChanged,
            "LocalVideoStateChanged": LocalVideoStateChanged,
            "RemoteAudioStateChanged": RemoteAudioStateChanged,
            "LocalAudioStateChanged": LocalAudioStateChanged,
            "LocalPublishFallbackToAudioOnly": LocalPublishFallbackToAudioOnly,
            "RemoteSubscribeFallbackToAudioOnly": RemoteSubscribeFallbackToAudioOnly,
            "AudioRouteChanged": AudioRouteChanged,
            "CameraFocusAreaChanged": CameraFocusAreaChanged,
            "CameraExposureAreaChanged": CameraExposureAreaChanged,
            "FacePositionChanged": FacePositionChanged,
            "RtcStats": RtcStats,
            "LastmileQuality": LastmileQuality,
            "NetworkQuality": NetworkQuality,
            "LastmileProbeResult": LastmileProbeResult,
            "LocalVideoStats": LocalVideoStats,
            "LocalAudioStats": LocalAudioStats,
            "RemoteVideoStats": RemoteVideoStats,
            "RemoteAudioStats": RemoteAudioStats,
            "AudioMixingFinished": AudioMixingFinished,
            "AudioMixingStateChanged": AudioMixingStateChanged,
            "AudioEffectFinished": AudioEffectFinished,
            "RtmpStreamingStateChanged": RtmpStreamingStateChanged,
            "TranscodingUpdated": TranscodingUpdated,
            "StreamInjectedStatus": StreamInjectedStatus,
            "StreamMessage": StreamMessage,
            "StreamMessageError": StreamMessageError,
            "MediaEngineLoadSuccess": MediaEngineLoadSuccess,
            "MediaEngineStartCallSuccess": MediaEngineStartCallSuccess,
            "ChannelMediaRelayStateChanged": ChannelMediaRelayStateChanged,
            "ChannelMediaRelayEvent": ChannelMediaRelayEvent,
            "FirstRemoteVideoFrame": FirstRemoteVideoFrame,
            "FirstRemoteAudioFrame": FirstRemoteAudioFrame,
            "FirstRemoteAudioDecoded": FirstRemoteAudioDecoded,
            "UserMuteAudio": UserMuteAudio,
            "StreamPublished": StreamPublished,
            "StreamUnpublished": StreamUnpublished,
            "RemoteAudioTransportStats": RemoteAudioTransportStats,
            "RemoteVideoTransportStats": RemoteVideoTransportStats,
            "UserEnableVideo": UserEnableVideo,
            "UserEnableLocalVideo": UserEnableLocalVideo,
            "FirstRemoteVideoDecoded": FirstRemoteVideoDecoded,
            "MicrophoneEnabled": MicrophoneEnabled,
            "ConnectionInterrupted": ConnectionInterrupted,
            "ConnectionBanned": ConnectionBanned,
            "AudioQuality": AudioQuality,
            "CameraReady": CameraReady,
            "VideoStopped": VideoStopped,
            "MetadataReceived": MetadataReceived,
            "FirstLocalAudioFramePublished": FirstLocalAudioFramePublished,
            "FirstLocalVideoFramePublished": FirstLocalVideoFramePublished,
            "AudioPublishStateChanged": AudioPublishStateChanged,
            "VideoPublishStateChanged": VideoPublishStateChanged,
            "AudioSubscribeStateChanged": AudioSubscribeStateChanged,
            "VideoSubscribeStateChanged": VideoSubscribeStateChanged,
            "RtmpStreamingEvent": RtmpStreamingEvent,
        ]
    }
}


class RtcEngineEventHandler: NSObject {
    static let PREFIX = "io.anyrtc.rtc."

    var emitter: (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void

    init(emitter: @escaping (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void) {
        self.emitter = emitter
    }

    private func callback(_ methodName: String, _ data: Any?...) {
        emitter(methodName, ["data": data])
    }
}

extension RtcEngineEventHandler: ARtcEngineDelegate {
    
    func rtcEngine(_ engine: ARtcEngineKit, didOccurWarning warningCode: ARWarningCode) {
        callback(RtcEngineEvents.Warning, warningCode.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didOccurError errorCode: ARErrorCode) {
        callback(RtcEngineEvents.Error, errorCode.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didJoinChannel channel: String, withUid uid: String, elapsed: Int) {
        callback(RtcEngineEvents.JoinChannelSuccess, channel, uid, elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didRejoinChannel channel: String, withUid uid: String, elapsed: Int) {
        callback(RtcEngineEvents.RejoinChannelSuccess, channel, uid, elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didLeaveChannelWith stats: ARChannelStats) {
        callback(RtcEngineEvents.LeaveChannel, stats.toMap())
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didClientRoleChanged oldRole: ARClientRole, newRole: ARClientRole) {
        callback(RtcEngineEvents.ClientRoleChanged, oldRole.rawValue, newRole.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didJoinedOfUid uid: String, elapsed: Int) {
        callback(RtcEngineEvents.UserJoined, uid, elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didOfflineOfUid uid: String, reason: ARUserOfflineReason) {
        callback(RtcEngineEvents.UserOffline, uid, reason.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, connectionChangedTo state: ARConnectionStateType, reason: ARConnectionChangedReason) {
        callback(RtcEngineEvents.ConnectionStateChanged, state.rawValue, reason.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, networkTypeChangedTo type: ARNetworkType) {
        callback(RtcEngineEvents.NetworkTypeChanged, type.rawValue)
    }
    
    func rtcEngineConnectionDidLost(_ engine: ARtcEngineKit) {
        callback(RtcEngineEvents.ConnectionLost)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, tokenPrivilegeWillExpire token: String) {
        callback(RtcEngineEvents.TokenPrivilegeWillExpire, token)
    }

    func rtcEngineRequestToken(_ engine: ARtcEngineKit) {
        callback(RtcEngineEvents.RequestToken)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, reportAudioVolumeIndicationOfSpeakers speakers: [ARtcAudioVolumeInfo], totalVolume: Int) {
        callback(RtcEngineEvents.AudioVolumeIndication, speakers.toMapList(), totalVolume)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, activeSpeaker speakerUid: String) {
        callback(RtcEngineEvents.ActiveSpeaker, speakerUid)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, firstLocalAudioFrame elapsed: Int) {
        callback(RtcEngineEvents.FirstLocalAudioFrame, elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, firstLocalVideoFrameWith size: CGSize, elapsed: Int) {
        callback(RtcEngineEvents.FirstLocalVideoFrame, Int(size.width), Int(size.height), elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didVideoMuted muted: Bool, byUid uid: String) {
        callback(RtcEngineEvents.UserMuteVideo, uid, muted)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, videoSizeChangedOfUid uid: String, size: CGSize, rotation: Int) {
        callback(RtcEngineEvents.VideoSizeChanged, uid, Int(size.width), Int(size.height), rotation)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, remoteVideoStateChangedOfUid uid: String, state: ARVideoRemoteState, reason: ARVideoRemoteStateReason, elapsed: Int) {
        callback(RtcEngineEvents.RemoteVideoStateChanged, uid, state.rawValue, reason.rawValue, elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, localVideoStateChange state: ARLocalVideoStreamState, error: ARLocalVideoStreamError) {
        callback(RtcEngineEvents.LocalVideoStateChanged, state.rawValue, error.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, remoteAudioStateChangedOfUid uid: String, state: ARAudioRemoteState, reason: ARAudioRemoteStateReason, elapsed: Int) {
        callback(RtcEngineEvents.RemoteAudioStateChanged, uid, state.rawValue, reason.rawValue, elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, localAudioStateChange state: ARAudioLocalState, error: ARAudioLocalError) {
        callback(RtcEngineEvents.LocalAudioStateChanged, state.rawValue, error.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didRemoteSubscribeFallbackToAudioOnly isFallbackOrRecover: Bool, byUid uid: String) {
        callback(RtcEngineEvents.RemoteSubscribeFallbackToAudioOnly, uid, isFallbackOrRecover)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didAudioRouteChanged routing: ARAudioOutputRouting) {
        callback(RtcEngineEvents.AudioRouteChanged, routing.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, facePositionDidChangeWidth width: Int32, previewHeight height: Int32, faces: [ARFacePositionInfo]?) {
        callback(RtcEngineEvents.FacePositionChanged, width, height, faces?.toMapList())
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, reportRtcStats stats: ARChannelStats) {
        callback(RtcEngineEvents.RtcStats, stats.toMap())
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, networkQuality uid: String, txQuality: ARNetworkQuality, rxQuality: ARNetworkQuality) {
        callback(RtcEngineEvents.NetworkQuality, uid, txQuality.rawValue, rxQuality.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, localVideoStats stats: ARtcLocalVideoStats) {
        callback(RtcEngineEvents.LocalVideoStats, stats.toMap())
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, localAudioStats stats: ARtcLocalAudioStats) {
        callback(RtcEngineEvents.LocalAudioStats, stats.toMap())
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, remoteVideoStats stats: ARtcRemoteVideoStats) {
        callback(RtcEngineEvents.RemoteVideoStats, stats.toMap())
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, remoteAudioStats stats: ARtcRemoteAudioStats) {
        callback(RtcEngineEvents.RemoteAudioStats, stats.toMap())
    }
    
    func rtcEngineLocalAudioMixingDidFinish(_ engine: ARtcEngineKit) {
        callback(RtcEngineEvents.AudioMixingFinished)
    }
    
    func rtcEngineDidAudioEffectFinish(_ engine: ARtcEngineKit, soundId: Int) {
        callback(RtcEngineEvents.AudioEffectFinished, soundId)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, streamInjectedStatusOfUrl url: String, uid: String, status: ARInjectStreamStatus) {
        callback(RtcEngineEvents.StreamInjectedStatus, url, uid, status.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, channelMediaRelayStateDidChange state: ARChannelMediaRelayState, error: ARChannelMediaRelayError) {
        callback(RtcEngineEvents.ChannelMediaRelayStateChanged, state.rawValue, error.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didReceive event: ARChannelMediaRelayEvent) {
        callback(RtcEngineEvents.ChannelMediaRelayEvent, event.rawValue)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, firstRemoteVideoFrameOfUid uid: String, size: CGSize, elapsed: Int) {
        callback(RtcEngineEvents.FirstRemoteVideoFrame, uid, Int(size.width), Int(size.height), elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, firstRemoteAudioFrameOfUid uid: String, elapsed: Int) {
        callback(RtcEngineEvents.FirstRemoteAudioFrame, uid, elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, firstRemoteAudioFrameDecodedOfUid uid: String, elapsed: Int) {
        callback(RtcEngineEvents.FirstRemoteAudioDecoded, uid, elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didAudioMuted muted: Bool, byUid uid: String) {
        callback(RtcEngineEvents.UserMuteAudio, uid, muted)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, audioTransportStatsOfUid uid: String, delay: UInt, lost: UInt, rxKBitRate: UInt) {
        callback(RtcEngineEvents.RemoteAudioTransportStats, uid, delay, lost, rxKBitRate)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, videoTransportStatsOfUid uid: String, delay: UInt, lost: UInt, rxKBitRate: UInt) {
        callback(RtcEngineEvents.RemoteVideoTransportStats, uid, delay, lost, rxKBitRate)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didVideoEnabled enabled: Bool, byUid uid: String) {
        callback(RtcEngineEvents.UserEnableVideo, uid, enabled)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didLocalVideoEnabled enabled: Bool, byUid uid: String) {
        callback(RtcEngineEvents.UserEnableLocalVideo, uid, enabled)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, firstRemoteVideoDecodedOfUid uid: String, size: CGSize, elapsed: Int) {
        callback(RtcEngineEvents.FirstRemoteVideoDecoded, uid, Int(size.width), Int(size.height), elapsed)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, didMicrophoneEnabled enabled: Bool) {
        callback(RtcEngineEvents.MicrophoneEnabled, enabled)
    }
    
    func rtcEngineConnectionDidInterrupted(_ engine: ARtcEngineKit) {
        callback(RtcEngineEvents.ConnectionInterrupted)
    }
    
    func rtcEngineConnectionDidBanned(_ engine: ARtcEngineKit) {
        callback(RtcEngineEvents.ConnectionBanned)
    }
    
    func rtcEngine(_ engine: ARtcEngineKit, audioQualityOfUid uid: String, quality: ARNetworkQuality, delay: UInt, lost: UInt) {
        callback(RtcEngineEvents.AudioQuality, uid, quality.rawValue, delay, lost)
    }
    
    func rtcEngineCameraDidReady(_ engine: ARtcEngineKit) {
        callback(RtcEngineEvents.CameraReady)
    }
    
    func rtcEngineVideoDidStop(_ engine: ARtcEngineKit) {
        callback(RtcEngineEvents.VideoStopped)
    }
}

