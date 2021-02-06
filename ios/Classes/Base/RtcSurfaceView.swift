//
//  RtcSurfaceView.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2020/10/29.
//

import UIKit
import ARtcKit

class RtcSurfaceView: UIView {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private lazy var canvas: ARtcVideoCanvas = {
        var canvas = ARtcVideoCanvas()
        canvas.view = self
        canvas.view?.backgroundColor = UIColor.black
        return canvas
    }()
    private weak var channel: ARtcChannel?

    func setData(_ engine: ARtcEngineKit, _ channel: ARtcChannel?, _ uid: String) {
        self.channel = channel
        canvas.channelId = channel?.getId()
        canvas.uid = uid
        setupVideoCanvas(engine)
    }
    
    func resetVideoCanvas(_ engine: ARtcEngineKit) {
        let canvas = ARtcVideoCanvas()
        canvas.view = nil
        canvas.renderMode = self.canvas.renderMode
        canvas.channelId = self.canvas.channelId
        canvas.uid = self.canvas.uid
        canvas.mirrorMode = self.canvas.mirrorMode
        
        if canvas.uid == "0" {
            engine.setupLocalVideo(canvas)
        } else {
            engine.setupRemoteVideo(canvas)
        }
    }
    
    private func setupVideoCanvas(_ engine: ARtcEngineKit) {
        if canvas.uid == "0" {
            engine.setupLocalVideo(canvas)
        } else {
            engine.setupRemoteVideo(canvas)
        }
    }
    
    func setRenderMode(_ engine: ARtcEngineKit, _ renderMode: Int) {
        canvas.renderMode = ARVideoRenderMode(rawValue: UInt(renderMode))!
        setupRenderMode(engine)
    }

    func setMirrorMode(_ engine: ARtcEngineKit, _ mirrorMode: Int) {
        canvas.mirrorMode = ARVideoMirrorMode(rawValue: UInt(mirrorMode))!
        setupRenderMode(engine)
    }

    private func setupRenderMode(_ engine: ARtcEngineKit) {
        if canvas.uid == "0" {
            engine.setLocalRenderMode(canvas.renderMode, mirrorMode: canvas.mirrorMode)
        } else {
            if let `channel` = channel {
                channel.setRemoteRenderMode(canvas.uid, renderMode: canvas.renderMode, mirrorMode: canvas.mirrorMode)
            } else {
                engine.setRemoteRenderMode(canvas.uid, renderMode: canvas.renderMode, mirrorMode: canvas.mirrorMode)
            }
        }
    }
}

