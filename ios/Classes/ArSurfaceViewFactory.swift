//
//  ArSurfaceViewFactory.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2020/10/29.
//

import UIKit
import ARtcKit

class ArSurfaceViewFactory: NSObject, FlutterPlatformViewFactory {
    private final weak var messager: FlutterBinaryMessenger?
    private final weak var rtcEnginePlugin: SwiftArRtcEnginePlugin?
    private final weak var rtcChannelPlugin: ArRtcChannelPlugin?

    init(_ messager: FlutterBinaryMessenger, _ rtcEnginePlugin: SwiftArRtcEnginePlugin, _ rtcChannelPlugin: ArRtcChannelPlugin) {
        self.messager = messager
        self.rtcEnginePlugin = rtcEnginePlugin
        self.rtcChannelPlugin = rtcChannelPlugin
    }

    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        FlutterStandardMessageCodec.sharedInstance()
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return ArSurfaceView(messager!, frame, viewId, args as? Dictionary<String, Any?>, rtcEnginePlugin!, rtcChannelPlugin!)
    }
}

class ArSurfaceView: NSObject, FlutterPlatformView {
    private final weak var rtcEnginePlugin: SwiftArRtcEnginePlugin?
    private final weak var rtcChannelPlugin: ArRtcChannelPlugin?
    private let _view: RtcSurfaceView
    private let channel: FlutterMethodChannel

    init(_ messager: FlutterBinaryMessenger, _ frame: CGRect, _ viewId: Int64, _ args: Dictionary<String, Any?>?, _ rtcEnginePlugin: SwiftArRtcEnginePlugin, _ rtcChannelPlugin: ArRtcChannelPlugin) {
        self.rtcEnginePlugin = rtcEnginePlugin
        self.rtcChannelPlugin = rtcChannelPlugin
        self._view = RtcSurfaceView(frame: frame)
        self.channel = FlutterMethodChannel(name: "ar_rtc_engine/surface_view_\(viewId)", binaryMessenger: messager)
        super.init()
        if let map = args {
            setData(map["data"] as! NSDictionary)
            setRenderMode(map["renderMode"] as! Int)
            setMirrorMode(map["mirrorMode"] as! Int)
        }
        channel.setMethodCallHandler { [weak self] (call, result) in
            var args = [String: Any?]()
            if let arguments = call.arguments {
                args = arguments as! Dictionary<String, Any?>
            }
            switch call.method {
            case "setData":
                self?.setData(args["data"] as! NSDictionary)
            case "setRenderMode":
                self?.setRenderMode(args["renderMode"] as! Int)
            case "setMirrorMode":
                self?.setMirrorMode(args["mirrorMode"] as! Int)
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }

    func view() -> UIView {
        return _view
    }

    deinit {
        channel.setMethodCallHandler(nil)
    }

    func setData(_ data: NSDictionary) {
        var channel: ARtcChannel? = nil
        if let channelId = data["channelId"] as? String {
            channel = getChannel(channelId)
        }
        if let `engine` = engine {
            _view.setData(engine, channel, data["uid"] as! String)
        }
    }

    func setRenderMode(_ renderMode: Int) {
        if let `engine` = engine {
            _view.setRenderMode(engine, renderMode)
        }
    }

    func setMirrorMode(_ mirrorMode: Int) {
        if let `engine` = engine {
            _view.setMirrorMode(engine, mirrorMode)
        }
    }

    private var engine: ARtcEngineKit? {
        return rtcEnginePlugin?.engine
    }

    private func getChannel(_ channelId: String?) -> ARtcChannel? {
        guard let `channelId` = channelId else {
            return nil
        }
        return rtcChannelPlugin?.channel(channelId)
    }
}

