package org.ar.rtc_engine

import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.ar.rtc.base.RtcMediaPlayerManager
import org.ar.rtc.base.StreamingKitManager
import org.ar.rtc.mediaplayer.ARMediaPlayer
import org.ar.rtc.mediaplayer.ARMediaPlayerKit
import java.lang.Exception
import kotlin.reflect.full.declaredMemberFunctions
import kotlin.reflect.jvm.javaMethod

class ArRtcMediaPlayerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, EventChannel.StreamHandler{

    private lateinit var methodChannel: MethodChannel
    private val manager = RtcMediaPlayerManager{methodName, data -> emit(methodName, data)}
    private lateinit var eventChannel: EventChannel
    private var eventSink: EventChannel.EventSink? = null
    private val handler = Handler(Looper.getMainLooper())
    fun initPlugin(binaryMessenger: BinaryMessenger) {
        methodChannel = MethodChannel(binaryMessenger, "ar_rtc_media_player")
        methodChannel.setMethodCallHandler(this)
        eventChannel = EventChannel(binaryMessenger, "ar_rtc_media_player/events")
        eventChannel.setStreamHandler(this)
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        initPlugin(binding.binaryMessenger)
    }

    fun getPlayer(): ARMediaPlayerKit? {
        return manager.player
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)
        eventChannel.setStreamHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        manager::class.declaredMemberFunctions.find { it.name == call.method }?.let { function ->
            function.javaMethod?.let { method ->
                try {
                    val parameters = mutableListOf<Any?>()
                    call.arguments<Map<*, *>>()?.toMutableMap()?.let {
                        if (call.method == "createInstance") {
                            it["engine"] = "engine"
                        }
                        parameters.add(it)
                    }
                    method.invoke(manager, *parameters.toTypedArray(), ResultCallback(result))
                    return@onMethodCall
                } catch (e: Exception) {
                    e.printStackTrace()
                }
            }
        }
        result.notImplemented()
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }

    private fun emit(methodName: String, data: Map<String, Any?>?) {
        handler.post {
            val event: MutableMap<String, Any?> = mutableMapOf("methodName" to methodName)
            data?.let { event.putAll(it) }
            eventSink?.success(event)
        }
    }
}