//
//  ArMediaPlayerViewFactory.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2021/1/9.
//

import Foundation
import ARtcKit

class ArMediaPlayerViewFactory: NSObject, FlutterPlatformViewFactory {
    private final weak var messager: FlutterBinaryMessenger?
    private final weak var rtcMediaPlayerPlugin: ArRtcMediaPlayerPlugin?

    init(_ messager: FlutterBinaryMessenger, _ rtcMediaPlayerPlugin: ArRtcMediaPlayerPlugin) {
        self.messager = messager
        self.rtcMediaPlayerPlugin = rtcMediaPlayerPlugin
    }

    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        FlutterStandardMessageCodec.sharedInstance()
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return ArMediaPlayerView(messager!, frame, viewId, args as? Dictionary<String, Any?>, rtcMediaPlayerPlugin!)
    }
}

class ArMediaPlayerView: NSObject, FlutterPlatformView {
    private final weak var rtcMediaPlayerPlugin: ArRtcMediaPlayerPlugin?
    private let _view: RtcMediaPlayerView
    
    init(_ messager: FlutterBinaryMessenger, _ frame: CGRect, _ viewId: Int64, _ args: Dictionary<String, Any?>?, _ rtcMediaPlayerPlugin: ArRtcMediaPlayerPlugin) {
        self.rtcMediaPlayerPlugin = rtcMediaPlayerPlugin
        self._view = RtcMediaPlayerView(frame: frame)
        super.init()
        setView()
    }
    
    func setView() {
        if let `player` = player {
            _view.setView(player)
        }
    }
    
    func view() -> UIView {
        _view
    }
    
    deinit {
        _view.removeFromSuperview()
    }
    
    private var player: ARMediaPlayer? {
        return rtcMediaPlayerPlugin?.player
    }
}
