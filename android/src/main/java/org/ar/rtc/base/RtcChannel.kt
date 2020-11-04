package org.ar.rtc.base

import org.ar.rtc.Constants
import org.ar.rtc.RtcChannel
import org.ar.rtc.RtcEngine
import java.util.*

class IRtcChannel {
    interface RtcChannelInterface : RtcAudioInterface, RtcVideoInterface, RtcVoicePositionInterface,
            RtcPublishStreamInterface, RtcMediaRelayInterface, RtcDualStreamInterface,
            RtcFallbackInterface, RtcMediaMetadataInterface, RtcEncryptionInterface,
            RtcInjectStreamInterface, RtcStreamMessageInterface {
        fun create(params: Map<String, *>, callback: Callback)

        fun destroy(params: Map<String, *>, callback: Callback)

        fun setClientRole(params: Map<String, *>, callback: Callback)

        fun joinChannel(params: Map<String, *>, callback: Callback)

        fun leaveChannel(params: Map<String, *>, callback: Callback)

        fun renewToken(params: Map<String, *>, callback: Callback)

        fun getConnectionState(params: Map<String, *>, callback: Callback)

        fun publish(params: Map<String, *>, callback: Callback)

        fun unpublish(params: Map<String, *>, callback: Callback)

        fun getCallId(params: Map<String, *>, callback: Callback)
    }

    interface RtcAudioInterface {
        fun adjustUserPlaybackSignalVolume(params: Map<String, *>, callback: Callback)

        fun muteRemoteAudioStream(params: Map<String, *>, callback: Callback)

        fun muteAllRemoteAudioStreams(params: Map<String, *>, callback: Callback)

        fun setDefaultMuteAllRemoteAudioStreams(params: Map<String, *>, callback: Callback)
    }

    interface RtcVideoInterface {
        fun muteRemoteVideoStream(params: Map<String, *>, callback: Callback)

        fun muteAllRemoteVideoStreams(params: Map<String, *>, callback: Callback)

        fun setDefaultMuteAllRemoteVideoStreams(params: Map<String, *>, callback: Callback)
    }

    interface RtcVoicePositionInterface {
    }

    interface RtcPublishStreamInterface {
    }

    interface RtcMediaRelayInterface {
    }

    interface RtcDualStreamInterface {
        fun setRemoteVideoStreamType(params: Map<String, *>, callback: Callback)

        fun setRemoteDefaultVideoStreamType(params: Map<String, *>, callback: Callback)
    }

    interface RtcFallbackInterface {
    }

    interface RtcMediaMetadataInterface {
    }

    interface RtcEncryptionInterface {
    }

    interface RtcInjectStreamInterface {
    }

    interface RtcStreamMessageInterface {
    }
}

class RtcChannelManager(
        private val emit: (methodName: String, data: Map<String, Any?>?) -> Unit
) : IRtcChannel.RtcChannelInterface {
    private val rtcChannelMap = Collections.synchronizedMap(mutableMapOf<String, RtcChannel>())

    fun release() {
        rtcChannelMap.forEach { it.value.destroy() }
        rtcChannelMap.clear()
    }

    operator fun get(channelId: String): RtcChannel? {
        return rtcChannelMap[channelId]
    }

    override fun create(params: Map<String, *>, callback: Callback) {
        callback.resolve(params["engine"] as RtcEngine) { e ->
            e.createRtcChannel(params["channelId"] as String)?.let {
                it.setRtcChannelEventHandler(RtcChannelEventHandler { methodName, data -> emit(methodName, data) })
                rtcChannelMap[it.channelId()] = it
            }
            Unit
        }
    }

    override fun destroy(params: Map<String, *>, callback: Callback) {
        var code: Int? = -Constants.ERR_NOT_INITIALIZED
        this[params["channelId"] as String]?.let {
            code = rtcChannelMap.remove(it.channelId())?.destroy()
        }
        callback.code(code)
    }

    override fun setClientRole(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.setClientRole((params["role"] as Number).toInt()))
    }

    override fun joinChannel(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.joinChannel(params["token"] as? String, params["optionalInfo"] as? String, (params["optionalUid"] as String).toString(), mapToChannelMediaOptions(params["options"] as Map<*, *>)))
    }


    override fun leaveChannel(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.leaveChannel())
    }

    override fun renewToken(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.renewToken(params["token"] as String))
    }

    override fun getConnectionState(params: Map<String, *>, callback: Callback) {
        callback.resolve(this[params["channelId"] as String]) { it.connectionState }
    }

    override fun publish(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.publish())
    }

    override fun unpublish(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.unpublish())
    }

    override fun getCallId(params: Map<String, *>, callback: Callback) {
        callback.resolve(this[params["channelId"] as String]) { it.callId }
    }

    override fun adjustUserPlaybackSignalVolume(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.adjustUserPlaybackSignalVolume((params["uid"] as String).toString(), (params["volume"] as Number).toInt()))
    }

    override fun muteRemoteAudioStream(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.muteRemoteAudioStream((params["uid"] as String).toString(), params["muted"] as Boolean))
    }

    override fun muteAllRemoteAudioStreams(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.muteAllRemoteAudioStreams(params["muted"] as Boolean))
    }

    override fun setDefaultMuteAllRemoteAudioStreams(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.setDefaultMuteAllRemoteAudioStreams(params["muted"] as Boolean))
    }

    override fun muteRemoteVideoStream(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.muteRemoteVideoStream((params["uid"] as String).toString(), params["muted"] as Boolean))
    }

    override fun muteAllRemoteVideoStreams(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.muteAllRemoteVideoStreams(params["muted"] as Boolean))
    }

    override fun setDefaultMuteAllRemoteVideoStreams(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.setDefaultMuteAllRemoteVideoStreams(params["muted"] as Boolean))
    }



    override fun setRemoteVideoStreamType(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.setRemoteVideoStreamType((params["uid"] as String).toString(), (params["streamType"] as Number).toInt()))
    }

    override fun setRemoteDefaultVideoStreamType(params: Map<String, *>, callback: Callback) {
        callback.code(this[params["channelId"] as String]?.setRemoteDefaultVideoStreamType((params["streamType"] as Number).toInt()))
    }








}
