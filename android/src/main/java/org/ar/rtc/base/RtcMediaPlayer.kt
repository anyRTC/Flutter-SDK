package org.ar.rtc.base

import org.ar.rtc.mediaplayer.ARMediaPlayerKit
import org.ar.rtc.rtmp.StreamingKit

class IRtcMediaPlayer{
    interface RtcMediaPlayerInterface{
        fun createInstance(callback: Callback)
        fun destory(callback: Callback)
        fun open(params: Map<String, *>,callback: Callback)
        fun play(callback: Callback)
        fun setView(params: Map<String, *>,callback: Callback)
        fun pause(callback: Callback)
        fun stop(callback: Callback)
        fun seek(params: Map<String, *>,callback: Callback)
        fun mute(params: Map<String, *>,callback: Callback)
        fun isMute(callback: Callback)
        fun adjustPlayoutVolume(params: Map<String, *>,callback: Callback)
        fun getPlayoutVolume(callback: Callback)
        fun getPlayPosition(callback: Callback)
        fun getDuration(callback: Callback)
        fun getState(callback: Callback)
        fun setRenderMode(params: Map<String, *>,callback: Callback)
        fun getStreamCount(callback: Callback)
        fun getStreamByIndex(callback: Callback)
    }
}

class RtcMediaPlayerManager:IRtcMediaPlayer.RtcMediaPlayerInterface{
    var player: ARMediaPlayerKit? =null

    override fun createInstance(callback: Callback) {
        player = ARMediaPlayerKit()
        callback.code(0)
    }

    override fun destory(callback: Callback) {
        player?.destroy()
        callback.code(0)
    }

    override fun open(params: Map<String, *>, callback: Callback) {
        callback.code(player?.open(params["url"] as String,(params["startPos"] as Int).toLong()))
    }

    override fun play(callback: Callback) {
        callback.code(player?.play())
    }

    override fun setView(params: Map<String, *>, callback: Callback) {
    }

    override fun pause(callback: Callback) {
        callback.code(player?.pause())
    }

    override fun stop(callback: Callback) {
        callback.code(player?.stop())
    }

    override fun seek(params: Map<String, *>, callback: Callback) {
        callback.code(player?.seek(params["position"] as Long))
    }

    override fun mute(params: Map<String, *>, callback: Callback) {
        callback.code(player?.mute(params["mute"] as Boolean))
    }

    override fun isMute(callback: Callback) {
        callback.resolve(player) { it.isMuted }
    }

    override fun adjustPlayoutVolume(params: Map<String, *>, callback: Callback) {
        callback.code(player?.adjustPlayoutVolume(params["vol"] as Int))
    }

    override fun getPlayoutVolume(callback: Callback) {
        callback.resolve(player) { it.playoutVolume }
    }

    override fun getPlayPosition(callback: Callback) {
        callback.resolve(player) { it.playPosition }
    }

    override fun getDuration(callback: Callback) {
        callback.resolve(player) { it.duration }
    }

    override fun getState(callback: Callback) {
        callback.resolve(player) { it.state }
    }

    override fun setRenderMode(params: Map<String, *>, callback: Callback) {
        callback.code(player?.setRenderMode(params["mode"] as Int))
    }

    override fun getStreamCount(callback: Callback) {
        callback.resolve(player) { it.streamCount }
    }

    override fun getStreamByIndex(callback: Callback) {
        callback.resolve(player) { it.streamByIndex }
    }

}