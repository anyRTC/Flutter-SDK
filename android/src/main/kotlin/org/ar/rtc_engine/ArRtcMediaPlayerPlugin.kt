package org.ar.rtc_engine

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.ar.rtc.base.RtcMediaPlayerManager
import org.ar.rtc.base.StreamingKitManager
import java.lang.Exception
import kotlin.reflect.full.declaredMemberFunctions
import kotlin.reflect.jvm.javaMethod

class ArRtcMediaPlayerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler{

    private lateinit var methodChannel: MethodChannel
    private val manager = RtcMediaPlayerManager()

    fun initPlugin(binaryMessenger: BinaryMessenger) {
        methodChannel = MethodChannel(binaryMessenger, "ar_rtc_media_player")
        methodChannel.setMethodCallHandler(this)
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        initPlugin(binding.binaryMessenger)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)
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
}