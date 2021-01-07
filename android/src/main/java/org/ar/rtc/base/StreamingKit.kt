package org.ar.rtc.base

import android.content.Context
import org.ar.rtc.RtcEngine
import org.ar.rtc.rtmp.StreamingKit
import org.ar.rtc.rtmp.internal.PushMode
import org.ar.rtc.rtmp.jni.ISteamingEventHandler

class IStreamingKit{
    interface StreamingKitInterface{
        fun createInstance(params: Map<String, *>,callback: Callback)

        fun release(callback: Callback)

        fun pushStream(params: Map<String, *>, callback: Callback)

        fun unPushStream(callback: Callback)

        fun setMode(params: Map<String, *>, callback: Callback)

        fun setLiveTranscoding(params: Map<String, *>, callback: Callback)
    }
}


class StreamingKitManager:IStreamingKit.StreamingKitInterface{

    var streamingKit: StreamingKit? =null

    override fun createInstance(params: Map<String, *>,callback: Callback) {
        callback.resolve(params["engine"] as RtcEngine) { e ->
            streamingKit = StreamingKit.createInstance()
            streamingKit?.setRtcEngine(e)
            Unit
        }
    }

    override fun release(callback: Callback) {
        streamingKit?.release()
        callback.code(0)
    }

    override fun pushStream(params: Map<String, *>, callback: Callback) {
        callback.code(streamingKit?.pushStream(params["url"] as String))

    }

    override fun unPushStream(callback: Callback) {
        callback.code(streamingKit?.unPushStream())
    }

    override fun setMode(params: Map<String, *>, callback: Callback) {
        var mode = (params["mode"] as Number).toInt();
        callback.code(streamingKit?.setMode(PushMode.values()[mode]))
    }

    override fun setLiveTranscoding(params: Map<String, *>, callback: Callback) {
        callback.code(streamingKit?.setLiveTranscoding(mapToLiveTranscoding(params["transcoding"] as Map<*, *>)))
    }

}

