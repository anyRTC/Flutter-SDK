package org.ar.rtc.base

import org.ar.rtc.VideoEncoderConfiguration
import org.ar.rtc.live.LiveInjectStreamConfig
import org.ar.rtc.live.LiveTranscoding


fun intToFrameRate(@Annotations.ArVideoFrameRate intValue: Int): VideoEncoderConfiguration.FRAME_RATE {
    for (value in VideoEncoderConfiguration.FRAME_RATE.values()) {
        if (value.value == intValue) {
            return value
        }
    }
    throw RuntimeException("VideoEncoderConfiguration.FRAME_RATE not contains $intValue")
}

fun intToOrientationMode(@Annotations.ArVideoOutputOrientationMode intValue: Int): VideoEncoderConfiguration.ORIENTATION_MODE {
    for (value in VideoEncoderConfiguration.ORIENTATION_MODE.values()) {
        if (value.value == intValue) {
            return value
        }
    }
    throw RuntimeException("VideoEncoderConfiguration.ORIENTATION_MODE not contains $intValue")
}

fun intToDegradationPreference(@Annotations.ArDegradationPreference intValue: Int): VideoEncoderConfiguration.DEGRADATION_PREFERENCE {
    for (value in VideoEncoderConfiguration.DEGRADATION_PREFERENCE.values()) {
        if (value.value == intValue) {
            return value
        }
    }
    throw RuntimeException("VideoEncoderConfiguration.DEGRADATION_PREFERENCE not contains $intValue")
}


fun intToLiveInjectStreamConfigAudioSampleRate(@Annotations.ArAudioSampleRateType intValue: Int): LiveInjectStreamConfig.AudioSampleRateType {
    for (value in LiveInjectStreamConfig.AudioSampleRateType.values()) {
        if (LiveInjectStreamConfig.AudioSampleRateType.getValue(value) == intValue) {
            return value
        }
    }
    throw RuntimeException("LiveInjectStreamConfig.AudioSampleRateType not contains $intValue")
}

fun intToLiveTranscodingAudioSampleRate(@Annotations.ArAudioSampleRateType intValue: Int): LiveTranscoding.AudioSampleRateType {
    for (value in LiveTranscoding.AudioSampleRateType.values()) {
        if (LiveTranscoding.AudioSampleRateType.getValue(value) == intValue) {
            return value
        }
    }
    throw RuntimeException("LiveTranscoding.AudioSampleRateType not contains $intValue")
}

fun intToAudioCodecProfile(@Annotations.ArAudioCodecProfileType intValue: Int): LiveTranscoding.AudioCodecProfileType {
    for (value in LiveTranscoding.AudioCodecProfileType.values()) {
        if (LiveTranscoding.AudioCodecProfileType.getValue(value) == intValue) {
            return value
        }
    }
    throw RuntimeException("LiveTranscoding.AudioCodecProfileType not contains $intValue")
}

fun intToVideoCodecProfile(@Annotations.ArVideoCodecProfileType intValue: Int): LiveTranscoding.VideoCodecProfileType {
    for (value in LiveTranscoding.VideoCodecProfileType.values()) {
        if (LiveTranscoding.VideoCodecProfileType.getValue(value) == intValue) {
            return value
        }
    }
    throw RuntimeException("LiveTranscoding.VideoCodecProfileType not contains $intValue")
}



