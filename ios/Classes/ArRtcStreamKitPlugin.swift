//
//  ArRtcStreamKitPlugin.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2021/1/7.
//

import Foundation
import ARtcKit

public class ArRtcStreamKitPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
    private final weak var rtcEnginePlugin: SwiftArRtcEnginePlugin?
    private var methodChannel: FlutterMethodChannel?
    private var eventChannel: FlutterEventChannel?
    private var eventSink: FlutterEventSink? = nil
    private lazy var manager: StreamingKitManager = {
        return StreamingKitManager() { [weak self] methodName, data in
            self?.emit(methodName, data)
        }
    }()
    
    init(_ rtcEnginePlugin: SwiftArRtcEnginePlugin) {
        self.rtcEnginePlugin = rtcEnginePlugin
    }

    public static func register(with registrar: FlutterPluginRegistrar) {

    }

    public func initPlugin(_ registrar: FlutterPluginRegistrar) {
        methodChannel = FlutterMethodChannel(name: "ar_rtc_stream_kit", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(self, channel: methodChannel!)
        eventChannel?.setStreamHandler(self)
    }

    public func detachFromEngine(for registrar: FlutterPluginRegistrar) {
        methodChannel?.setMethodCallHandler(nil)
        eventChannel?.setStreamHandler(nil)
        manager.Release()
    }

    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        return nil
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }

    private func emit(_ methodName: String, _ data: Dictionary<String, Any?>?) {
        var event: Dictionary<String, Any?> = ["methodName": methodName]
        if let `data` = data {
            event.merge(data) { (current, _) in
                current
            }
        }
        eventSink?(event)
    }

    private weak var engine: ARtcEngineKit? {
        return rtcEnginePlugin?.engine
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let params = call.arguments as? NSDictionary {
            let selector = NSSelectorFromString(call.method + "::")
            if manager.responds(to: selector) {
                if call.method == "createInstance" {
                    params.setValue(engine, forKey: "engine")
                }
                manager.perform(selector, with: params, with: ResultCallback(result))
                return
            }
        } else {
            let selector = NSSelectorFromString(call.method + ":")
            if manager.responds(to: selector) {
                manager.perform(selector, with: ResultCallback(result))
                return
            }
        }
        result(FlutterMethodNotImplemented)
    }
}
