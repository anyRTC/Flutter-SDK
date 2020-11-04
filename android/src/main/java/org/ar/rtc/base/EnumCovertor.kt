package org.ar.rtc.base

import org.ar.rtc.VideoEncoderConfiguration
import org.ar.rtc.live.LiveInjectStreamConfig


fun intToFrameRate(@Annotations.AgoraVideoFrameRate intValue: Int): VideoEncoderConfiguration.FRAME_RATE {
    for (value in VideoEncoderConfiguration.FRAME_RATE.values()) {
        if (value.value == intValue) {
            return value
        }
    }
    throw RuntimeException("VideoEncoderConfiguration.FRAME_RATE not contains $intValue")
}

fun intToOrientationMode(@Annotations.AgoraVideoOutputOrientationMode intValue: Int): VideoEncoderConfiguration.ORIENTATION_MODE {
    for (value in VideoEncoderConfiguration.ORIENTATION_MODE.values()) {
        if (value.value == intValue) {
            return value
        }
    }
    throw RuntimeException("VideoEncoderConfiguration.ORIENTATION_MODE not contains $intValue")
}

fun intToDegradationPreference(@Annotations.AgoraDegradationPreference intValue: Int): VideoEncoderConfiguration.DEGRADATION_PREFERENCE {
    for (value in VideoEncoderConfiguration.DEGRADATION_PREFERENCE.values()) {
        if (value.value == intValue) {
            return value
        }
    }
    throw RuntimeException("VideoEncoderConfiguration.DEGRADATION_PREFERENCE not contains $intValue")
}


fun intToLiveInjectStreamConfigAudioSampleRate(@Annotations.AgoraAudioSampleRateType intValue: Int): LiveInjectStreamConfig.AudioSampleRateType {
    for (value in LiveInjectStreamConfig.AudioSampleRateType.values()) {
        if (LiveInjectStreamConfig.AudioSampleRateType.getValue(value) == intValue) {
            return value
        }
    }
    throw RuntimeException("LiveInjectStreamConfig.AudioSampleRateType not contains $intValue")
}



