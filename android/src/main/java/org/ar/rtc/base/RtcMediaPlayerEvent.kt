package org.ar.rtc.base

import org.ar.rtc.mediaplayer.MediaPlayerObserver
import org.ar.rtc.mediaplayer.PlayerConstans

class RtcMediaPlayerEvent {
    companion object{
        const val PlayerStateChanged ="PlayerStateChanged"
        const val PositionChanged = "PositionChanged"
        const val PlayerEvent ="PlayerEvent"
        const val MetaData="MetaData"
    }
}

class RtcMediaPlayerEventHandler(private val emitter: (methodName: String, data: Map<String, Any?>?) -> Unit): MediaPlayerObserver {

    private fun callback(methodName: String, vararg data: Any?) {
        emitter(methodName, hashMapOf("data" to data.toList()))
    }

    override fun onPlayerStateChanged(var1: PlayerConstans.MediaPlayerState?, var2: PlayerConstans.MediaPlayerError?) {
        callback(RtcMediaPlayerEvent.PlayerStateChanged,PlayerConstans.MediaPlayerState.getValue(var1),PlayerConstans.MediaPlayerError.getValue(var2))
    }

    override fun onPositionChanged(var1: Long) {
        callback(RtcMediaPlayerEvent.PositionChanged,var1)

    }

    override fun onPlayerEvent(var1: PlayerConstans.MediaPlayerEvent?) {
        callback(RtcMediaPlayerEvent.PlayerEvent,PlayerConstans.MediaPlayerEvent.getValue(var1))
    }

    override fun onMetaData(var1: PlayerConstans.MediaPlayerMetadataType?, var2: ByteArray?) {
        callback(RtcMediaPlayerEvent.MetaData,PlayerConstans.MediaPlayerMetadataType.getValue(var1))
    }


}