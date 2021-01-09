//
//  RtcMediaPlayerView.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2021/1/9.
//

import Foundation
import ARtcKit

class RtcMediaPlayerView: UIView {
    func setView(_ player: ARMediaPlayer) {
        player.setView(self)
    }
}


