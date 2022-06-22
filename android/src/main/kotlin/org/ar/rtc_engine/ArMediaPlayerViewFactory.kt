package org.ar.rtc_engine

import android.content.Context
import android.view.View
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import org.ar.rtc.base.RtcMediaPlayerView

class ArMediaPlayerViewFactory(private val playerPlugin: ArRtcMediaPlayerPlugin): PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return ArMediaPlayerView(context!!.applicationContext,playerPlugin)
    }
}

class ArMediaPlayerView(context: Context,mediaPlayerPlugin: ArRtcMediaPlayerPlugin):PlatformView{

    private val view = RtcMediaPlayerView(context)
    private val playerPlugin:ArRtcMediaPlayerPlugin = mediaPlayerPlugin

    init {
        playerPlugin.getPlayer()?.setView(view.getSurface())
    }

    override fun getView(): View {
       return view
    }

    override fun dispose() {
    }

}