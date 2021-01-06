package org.ar.rtc.base

import android.graphics.Color
import org.ar.rtc.VideoEncoderConfiguration
import org.ar.rtc.internal.LastmileProbeConfig
import org.ar.rtc.live.LiveInjectStreamConfig
import org.ar.rtc.live.LiveTranscoding
import org.ar.rtc.models.ChannelMediaOptions
import org.ar.rtc.video.*

fun mapToVideoDimensions(map: Map<*, *>): VideoEncoderConfiguration.VideoDimensions {
    return VideoEncoderConfiguration.VideoDimensions().apply {
        (map["width"] as? Number)?.let { width = it.toInt() }
        (map["height"] as? Number)?.let { height = it.toInt() }
    }
}

fun mapToVideoEncoderConfiguration(map: Map<*, *>): VideoEncoderConfiguration {
    return VideoEncoderConfiguration().apply {
        (map["dimensions"] as? Map<*, *>)?.let { dimensions = mapToVideoDimensions(it) }
        (map["frameRate"] as? Number)?.let { frameRate = it.toInt() }
        (map["minFrameRate"] as? Number)?.let { minFrameRate = it.toInt() }
        (map["bitrate"] as? Number)?.let { bitrate = it.toInt() }
        (map["minBitrate"] as? Number)?.let { minBitrate = it.toInt() }
        (map["orientationMode"] as? Number)?.let { orientationMode = intToOrientationMode(it.toInt()) }
        (map["degradationPrefer"] as? Number)?.let { degradationPrefer = intToDegradationPreference(it.toInt()) }
        (map["mirrorMode"] as? Number)?.let { mirrorMode = it.toInt() }
    }
}
fun mapToARImage(map: Map<*, *>): LiveTranscoding.RtcImage {
    return LiveTranscoding.RtcImage().apply {
        (map["url"] as? String)?.let { url = it }
        (map["x"] as? Number)?.let { x = it.toInt() }
        (map["y"] as? Number)?.let { y = it.toInt() }
        (map["width"] as? Number)?.let { width = it.toInt() }
        (map["height"] as? Number)?.let { height = it.toInt() }
    }
}

fun mapToTranscodingUser(map: Map<*, *>): LiveTranscoding.TranscodingUser {
    return LiveTranscoding.TranscodingUser().apply {
        (map["uid"] as? Number)?.let { uid = it.toString() }
        (map["x"] as? Number)?.let { x = it.toInt() }
        (map["y"] as? Number)?.let { y = it.toInt() }
        (map["width"] as? Number)?.let { width = it.toInt() }
        (map["height"] as? Number)?.let { height = it.toInt() }
        (map["zOrder"] as? Number)?.let { zOrder = it.toInt() }
        (map["alpha"] as? Number)?.let { alpha = it.toFloat() }
        (map["audioChannel"] as? Number)?.let { audioChannel = it.toInt() }
    }
}

fun mapToLiveTranscoding(map: Map<*, *>): LiveTranscoding {
    return LiveTranscoding().apply {
        (map["width"] as? Number)?.let { width = it.toInt() }
        (map["height"] as? Number)?.let { height = it.toInt() }
        (map["videoBitrate"] as? Number)?.let { videoBitrate = it.toInt() }
        (map["videoFramerate"] as? Number)?.let { videoFramerate = it.toInt() }
        (map["lowLatency"] as? Boolean)?.let { lowLatency = it }
        (map["videoGop"] as? Number)?.let { videoGop = it.toInt() }
        (map["watermark"] as? Map<*, *>)?.let { watermark = mapToARImage(it) }
        (map["backgroundImage"] as? Map<*, *>)?.let { backgroundImage = mapToARImage(it) }
        (map["audioSampleRate"] as? Number)?.let { audioSampleRate = intToLiveTranscodingAudioSampleRate(it.toInt()).ordinal }
        (map["audioBitrate"] as? Number)?.let { audioBitrate = it.toInt() }
        (map["audioChannels"] as? Number)?.let { audioChannels = it.toInt() }
        (map["audioCodecProfile"] as? Number)?.let { audioCodecProfile = intToAudioCodecProfile(it.toInt()).ordinal }
        (map["videoCodecProfile"] as? Number)?.let { videoCodecProfile = intToVideoCodecProfile(it.toInt()).ordinal }
        (map["backgroundColor"] as? Map<*, *>)?.let { backgroundColor = mapToColor(it) }
        (map["transcodingExtraInfo"] as? String)?.let { transcodingExtraInfo = it }
        (map["transcodingUsers"] as? List<*>)?.let { list ->
            list.forEach { item ->
                (item as? Map<*, *>)?.let {
                    addUser(mapToTranscodingUser(it))
                }
            }
        }
    }
}


fun mapToColor(map: Map<*, *>): Int {
    return Color.rgb(
            (map["red"] as Number).toInt(),
            (map["green"] as Number).toInt(),
            (map["blue"] as Number).toInt()
    )
}


fun mapToChannelMediaInfo(map: Map<*, *>): ChannelMediaInfo {
    return ChannelMediaInfo(
            map["channelName"] as? String,
            map["token"] as? String,
            (map["uid"] as String).toString()
    )
}

fun mapToChannelMediaRelayConfiguration(map: Map<*, *>): ChannelMediaRelayConfiguration {
    return ChannelMediaRelayConfiguration().apply {
        (map["srcInfo"] as? Map<*, *>)?.let { setSrcChannelInfo(mapToChannelMediaInfo(it)) }
        (map["destInfos"] as? List<*>)?.let { list ->
            list.forEach { item ->
                (item as? Map<*, *>)?.let {
                    val info = mapToChannelMediaInfo(it)
                    setDestChannelInfo(info.channelName, info)
                }
            }
        }
    }
}

fun mapToLastmileProbeConfig(map: Map<*, *>): LastmileProbeConfig {
    return LastmileProbeConfig().apply {
        (map["probeUplink"] as? Boolean)?.let { probeUplink = it }
        (map["probeDownlink"] as? Boolean)?.let { probeDownlink = it }
        (map["expectedUplinkBitrate"] as? Number)?.let { expectedUplinkBitrate = it.toInt() }
        (map["expectedDownlinkBitrate"] as? Number)?.let { expectedUplinkBitrate = it.toInt() }
    }
}



fun mapToLiveInjectStreamConfig(map: Map<*, *>): LiveInjectStreamConfig {
    return LiveInjectStreamConfig().apply {
        (map["width"] as? Number)?.let { width = it.toInt() }
        (map["height"] as? Number)?.let { height = it.toInt() }
        (map["videoGop"] as? Number)?.let { videoGop = it.toInt() }
        (map["videoFramerate"] as? Number)?.let { videoFramerate = it.toInt() }
        (map["videoBitrate"] as? Number)?.let { videoBitrate = it.toInt() }
        (map["audioSampleRate"] as? Number)?.let { audioSampleRate = intToLiveInjectStreamConfigAudioSampleRate(it.toInt()) }
        (map["audioBitrate"] as? Number)?.let { audioBitrate = it.toInt() }
        (map["audioChannels"] as? Number)?.let { audioChannels = it.toInt() }
    }
}


fun mapToChannelMediaOptions(map: Map<*, *>): ChannelMediaOptions {
    return ChannelMediaOptions().apply {
        (map["autoSubscribeAudio"] as? Boolean)?.let { autoSubscribeAudio = it }
        (map["autoSubscribeVideo"] as? Boolean)?.let { autoSubscribeVideo = it }
    }
}

