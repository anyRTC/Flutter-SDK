package org.ar.rtc_engine

import android.content.Context
import android.view.View
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import org.ar.rtc.RtcChannel
import org.ar.rtc.RtcEngine
import org.ar.rtc.base.RtcTextureView
import kotlin.reflect.full.declaredMemberFunctions
import kotlin.reflect.jvm.javaMethod

class ArTextureViewFactory(
        private val messenger: BinaryMessenger,
        private val rtcEnginePlugin: ArRtcEnginePlugin,
        private val rtcChannelPlugin: ArRtcChannelPlugin
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return ARTextureView(context.applicationContext, messenger, viewId, args as? Map<*, *>, rtcEnginePlugin, rtcChannelPlugin)
    }
}

class ARTextureView(
        context: Context,
        messenger: BinaryMessenger,
        viewId: Int,
        args: Map<*, *>?,
        private val rtcEnginePlugin: ArRtcEnginePlugin,
        private val rtcChannelPlugin: ArRtcChannelPlugin
) : PlatformView, MethodChannel.MethodCallHandler {
    private val view = RtcTextureView(context)
    private val channel = MethodChannel(messenger, "ar_rtc_engine/texture_view_$viewId")

    init {
        args?.let { map ->
            (map["data"] as? Map<*, *>)?.let { setData(it) }
            (map["renderMode"] as? Number)?.let { setRenderMode(it.toInt()) }
            (map["mirrorMode"] as? Number)?.let { setMirrorMode(it.toInt()) }
        }
        channel.setMethodCallHandler(this)
    }

    override fun getView(): View {
        return view
    }

    override fun dispose() {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        this::class.declaredMemberFunctions.find { it.name == call.method }?.let { function ->
            function.javaMethod?.let { method ->
                val parameters = mutableListOf<Any?>()
                function.parameters.forEach { parameter ->
                    val map = call.arguments<Map<*, *>>()
                    if (map.containsKey(parameter.name)) {
                        parameters.add(map[parameter.name])
                    }
                }
                try {
                    method.invoke(this, *parameters.toTypedArray())
                    return@onMethodCall
                } catch (e: Exception) {
                    e.printStackTrace()
                }
            }
        }
        result.notImplemented()
    }

    private fun setData(data: Map<*, *>) {
        val channel = (data["channelId"] as? String)?.let { getChannel(it) }
        getEngine()?.let { view.setData(it, channel, data["uid"] as String) }
    }

    private fun setRenderMode(renderMode: Int) {
        getEngine()?.let { view.setRenderMode(it, renderMode) }
    }

    private fun setMirrorMode(mirrorMode: Int) {
        getEngine()?.let { view.setMirrorMode(it, mirrorMode) }
    }

    private fun getEngine(): RtcEngine? {
        return rtcEnginePlugin.engine()
    }

    private fun getChannel(channelId: String): RtcChannel? {
        return rtcChannelPlugin.channel(channelId)
    }
}
