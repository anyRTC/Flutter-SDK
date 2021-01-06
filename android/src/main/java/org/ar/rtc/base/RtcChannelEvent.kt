package org.ar.rtc.base

import androidx.annotation.IntRange
import org.ar.rtc.IRtcChannelEventHandler
import org.ar.rtc.IRtcEngineEventHandler
import org.ar.rtc.RtcChannel

class RtcChannelEvents {
    companion object {
        const val Warning = "Warning"
        const val Error = "Error"
        const val JoinChannelSuccess = "JoinChannelSuccess"
        const val RejoinChannelSuccess = "RejoinChannelSuccess"
        const val LeaveChannel = "LeaveChannel"
        const val ClientRoleChanged = "ClientRoleChanged"
        const val UserJoined = "UserJoined"
        const val UserOffline = "UserOffline"
        const val ConnectionStateChanged = "ConnectionStateChanged"
        const val ConnectionLost = "ConnectionLost"
        const val TokenPrivilegeWillExpire = "TokenPrivilegeWillExpire"
        const val RequestToken = "RequestToken"
        const val ActiveSpeaker = "ActiveSpeaker"
        const val VideoSizeChanged = "VideoSizeChanged"
        const val RemoteVideoStateChanged = "RemoteVideoStateChanged"
        const val RemoteAudioStateChanged = "RemoteAudioStateChanged"
        const val LocalPublishFallbackToAudioOnly = "LocalPublishFallbackToAudioOnly"
        const val RemoteSubscribeFallbackToAudioOnly = "RemoteSubscribeFallbackToAudioOnly"
        const val RtcStats = "RtcStats"
        const val NetworkQuality = "NetworkQuality"
        const val RemoteVideoStats = "RemoteVideoStats"
        const val RemoteAudioStats = "RemoteAudioStats"
        const val RtmpStreamingStateChanged = "RtmpStreamingStateChanged"
        const val TranscodingUpdated = "TranscodingUpdated"
        const val StreamInjectedStatus = "StreamInjectedStatus"
        const val StreamMessage = "StreamMessage"
        const val StreamMessageError = "StreamMessageError"
        const val ChannelMediaRelayStateChanged = "ChannelMediaRelayStateChanged"
        const val ChannelMediaRelayEvent = "ChannelMediaRelayEvent"
        const val MetadataReceived = "MetadataReceived"
        const val AudioPublishStateChanged = "AudioPublishStateChanged"
        const val VideoPublishStateChanged = "VideoPublishStateChanged"
        const val AudioSubscribeStateChanged = "AudioSubscribeStateChanged"
        const val VideoSubscribeStateChanged = "VideoSubscribeStateChanged"
        const val RtmpStreamingEvent = "RtmpStreamingEvent"

        fun toMap(): Map<String, String> {
            return hashMapOf(
                    "Warning" to Warning,
                    "Error" to Error,
                    "JoinChannelSuccess" to JoinChannelSuccess,
                    "RejoinChannelSuccess" to RejoinChannelSuccess,
                    "LeaveChannel" to LeaveChannel,
                    "ClientRoleChanged" to ClientRoleChanged,
                    "UserJoined" to UserJoined,
                    "UserOffline" to UserOffline,
                    "ConnectionStateChanged" to ConnectionStateChanged,
                    "ConnectionLost" to ConnectionLost,
                    "TokenPrivilegeWillExpire" to TokenPrivilegeWillExpire,
                    "RequestToken" to RequestToken,
                    "ActiveSpeaker" to ActiveSpeaker,
                    "VideoSizeChanged" to VideoSizeChanged,
                    "RemoteVideoStateChanged" to RemoteVideoStateChanged,
                    "RemoteAudioStateChanged" to RemoteAudioStateChanged,
                    "LocalPublishFallbackToAudioOnly" to LocalPublishFallbackToAudioOnly,
                    "RemoteSubscribeFallbackToAudioOnly" to RemoteSubscribeFallbackToAudioOnly,
                    "RtcStats" to RtcStats,
                    "NetworkQuality" to NetworkQuality,
                    "RemoteVideoStats" to RemoteVideoStats,
                    "RemoteAudioStats" to RemoteAudioStats,
                    "RtmpStreamingStateChanged" to RtmpStreamingStateChanged,
                    "TranscodingUpdated" to TranscodingUpdated,
                    "StreamInjectedStatus" to StreamInjectedStatus,
                    "StreamMessage" to StreamMessage,
                    "StreamMessageError" to StreamMessageError,
                    "ChannelMediaRelayStateChanged" to ChannelMediaRelayStateChanged,
                    "ChannelMediaRelayEvent" to ChannelMediaRelayEvent,
                    "MetadataReceived" to MetadataReceived,
                    "AudioPublishStateChanged" to AudioPublishStateChanged,
                    "VideoPublishStateChanged" to VideoPublishStateChanged,
                    "AudioSubscribeStateChanged" to AudioSubscribeStateChanged,
                    "VideoSubscribeStateChanged" to VideoSubscribeStateChanged,
                    "RtmpStreamingEvent" to RtmpStreamingEvent
            )
        }
    }
}

class RtcChannelEventHandler(
        private val emitter: (methodName: String, data: Map<String, Any?>?) -> Unit
) : IRtcChannelEventHandler() {
    companion object {
        const val PREFIX = "org.ar.rtc."
    }

    private fun callback(methodName: String, channel: RtcChannel?, vararg data: Any?) {
        channel?.let {
            emitter(methodName, hashMapOf(
                    "channelId" to it.channelId(),
                    "data" to data.toList()
            ))
        }
    }

    override fun onChannelWarning(rtcChannel: RtcChannel?, @Annotations.ArWarningCode warn: Int) {
        callback(RtcChannelEvents.Warning, rtcChannel, warn)
    }

    override fun onChannelError(rtcChannel: RtcChannel?, @Annotations.ArErrorCode err: Int) {
        callback(RtcChannelEvents.Error, rtcChannel, err)
    }

    override fun onJoinChannelSuccess(rtcChannel: RtcChannel?, uid: String, elapsed: Int) {
        callback(RtcChannelEvents.JoinChannelSuccess, rtcChannel, rtcChannel?.channelId(), uid, elapsed)
    }

    override fun onRejoinChannelSuccess(rtcChannel: RtcChannel?, uid: String, elapsed: Int) {
        callback(RtcChannelEvents.RejoinChannelSuccess, rtcChannel, rtcChannel?.channelId(), uid, elapsed)
    }

    override fun onLeaveChannel(rtcChannel: RtcChannel?, stats: IRtcEngineEventHandler.RtcStats?) {
        callback(RtcChannelEvents.LeaveChannel, rtcChannel, stats?.toMap())
    }

    override fun onClientRoleChanged(rtcChannel: RtcChannel?, @Annotations.ArClientRole oldRole: Int, @Annotations.ArClientRole newRole: Int) {
        callback(RtcChannelEvents.ClientRoleChanged, rtcChannel, oldRole, newRole)
    }

    override fun onUserJoined(rtcChannel: RtcChannel?, uid: String, elapsed: Int) {
        callback(RtcChannelEvents.UserJoined, rtcChannel, uid, elapsed)
    }

    override fun onUserOffline(rtcChannel: RtcChannel?, uid: String, @Annotations.ArUserOfflineReason reason: Int) {
        callback(RtcChannelEvents.UserOffline, rtcChannel, uid, reason)
    }

    override fun onConnectionStateChanged(rtcChannel: RtcChannel?, @Annotations.ArConnectionStateType state: Int, @Annotations.ArConnectionChangedReason reason: Int) {
        callback(RtcChannelEvents.ConnectionStateChanged, rtcChannel, state, reason)
    }

    override fun onConnectionLost(rtcChannel: RtcChannel?) {
        callback(RtcChannelEvents.ConnectionLost, rtcChannel)
    }

    override fun onTokenPrivilegeWillExpire(rtcChannel: RtcChannel?, token: String?) {
        callback(RtcChannelEvents.TokenPrivilegeWillExpire, rtcChannel, token)
    }

    override fun onRequestToken(rtcChannel: RtcChannel?) {
        callback(RtcChannelEvents.RequestToken, rtcChannel)
    }

    override fun onActiveSpeaker(rtcChannel: RtcChannel?, uid: String) {
        callback(RtcChannelEvents.ActiveSpeaker, rtcChannel, uid)
    }

    override fun onVideoSizeChanged(rtcChannel: RtcChannel?, uid: String, width: Int, height: Int, @IntRange(from = 0, to = 360) rotation: Int) {
        callback(RtcChannelEvents.VideoSizeChanged, rtcChannel, uid, width, height, rotation)
    }

    override fun onRemoteVideoStateChanged(rtcChannel: RtcChannel?, uid: String, @Annotations.ArVideoRemoteState state: Int, @Annotations.ArVideoRemoteStateReason reason: Int, elapsed: Int) {
        callback(RtcChannelEvents.RemoteVideoStateChanged, rtcChannel, uid, state, reason, elapsed)
    }

    override fun onRemoteAudioStateChanged(rtcChannel: RtcChannel?, uid: String, @Annotations.ArAudioRemoteState state: Int, @Annotations.ArAudioRemoteStateReason reason: Int, elapsed: Int) {
        callback(RtcChannelEvents.RemoteAudioStateChanged, rtcChannel, uid, state, reason, elapsed)
    }


    override fun onRtcStats(rtcChannel: RtcChannel?, stats: IRtcEngineEventHandler.RtcStats?) {
        callback(RtcChannelEvents.RtcStats, rtcChannel, stats?.toMap())
    }

    override fun onNetworkQuality(rtcChannel: RtcChannel?, uid: String, @Annotations.ArNetworkQuality txQuality: Int, @Annotations.ArNetworkQuality rxQuality: Int) {
        callback(RtcChannelEvents.NetworkQuality, rtcChannel, uid, txQuality, rxQuality)
    }

    override fun onRemoteVideoStats(rtcChannel: RtcChannel?, stats: IRtcEngineEventHandler.RemoteVideoStats?) {
        callback(RtcChannelEvents.RemoteVideoStats, rtcChannel, stats?.toMap())
    }

    override fun onRemoteAudioStats(rtcChannel: RtcChannel?, stats: IRtcEngineEventHandler.RemoteAudioStats?) {
        callback(RtcChannelEvents.RemoteAudioStats, rtcChannel, stats?.toMap())
    }

}
