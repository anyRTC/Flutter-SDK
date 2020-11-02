//
//  RtcEngine.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2020/10/29.
//

import Foundation
import ARtcKit

protocol RtcEngineInterface:
        RtcEngineAudioInterface,
        RtcEngineVideoInterface,
        RtcEngineAudioMixingInterface,
        RtcEngineAudioEffectInterface,
        RtcEngineMediaRelayInterface,
        RtcEngineAudioRouteInterface,
        RtcEngineEarMonitoringInterface,
        RtcEngineDualStreamInterface,
        RtcEngineFallbackInterface,
        RtcEngineAudioRecorderInterface,
        RtcEngineInjectStreamInterface,
        RtcEngineCameraInterface {
    
    func create(_ params: NSDictionary, _ callback: Callback)
    
    func destroy(_ callback: Callback)

    func setChannelProfile(_ params: NSDictionary, _ callback: Callback)

    func setClientRole(_ params: NSDictionary, _ callback: Callback)

    func joinChannel(_ params: NSDictionary, _ callback: Callback)

    func switchChannel(_ params: NSDictionary, _ callback: Callback)

    func leaveChannel(_ callback: Callback)

    func renewToken(_ params: NSDictionary, _ callback: Callback)
    
    func getConnectionState(_ callback: Callback)

    func getCallId(_ callback: Callback)

    func setLogFile(_ params: NSDictionary, _ callback: Callback)

    func setLogFilter(_ params: NSDictionary, _ callback: Callback)

    func setLogFileSize(_ params: NSDictionary, _ callback: Callback)

    func setParameters(_ params: NSDictionary, _ callback: Callback)
}

protocol RtcEngineAudioInterface {
    func enableAudio(_ callback: Callback)

    func disableAudio(_ callback: Callback)

    func setAudioProfile(_ params: NSDictionary, _ callback: Callback)

    func adjustRecordingSignalVolume(_ params: NSDictionary, _ callback: Callback)

    func adjustUserPlaybackSignalVolume(_ params: NSDictionary, _ callback: Callback)

    func adjustPlaybackSignalVolume(_ params: NSDictionary, _ callback: Callback)

    func enableLocalAudio(_ params: NSDictionary, _ callback: Callback)

    func muteLocalAudioStream(_ params: NSDictionary, _ callback: Callback)

    func muteRemoteAudioStream(_ params: NSDictionary, _ callback: Callback)

    func muteAllRemoteAudioStreams(_ params: NSDictionary, _ callback: Callback)

    func setDefaultMuteAllRemoteAudioStreams(_ params: NSDictionary, _ callback: Callback)

    func enableAudioVolumeIndication(_ params: NSDictionary, _ callback: Callback)
}

protocol RtcEngineVideoInterface {
    func enableVideo(_ callback: Callback)

    func disableVideo(_ callback: Callback)

    func setVideoEncoderConfiguration(_ params: NSDictionary, _ callback: Callback)

    func startPreview(_ callback: Callback)

    func stopPreview(_ callback: Callback)

    func enableLocalVideo(_ params: NSDictionary, _ callback: Callback)

    func muteLocalVideoStream(_ params: NSDictionary, _ callback: Callback)

    func muteRemoteVideoStream(_ params: NSDictionary, _ callback: Callback)

    func muteAllRemoteVideoStreams(_ params: NSDictionary, _ callback: Callback)

    func setDefaultMuteAllRemoteVideoStreams(_ params: NSDictionary, _ callback: Callback)
}

protocol RtcEngineAudioMixingInterface {
    func startAudioMixing(_ params: NSDictionary, _ callback: Callback)

    func stopAudioMixing(_ callback: Callback)

    func pauseAudioMixing(_ callback: Callback)

    func resumeAudioMixing(_ callback: Callback)

    func adjustAudioMixingVolume(_ params: NSDictionary, _ callback: Callback)

    func adjustAudioMixingPlayoutVolume(_ params: NSDictionary, _ callback: Callback)

    func adjustAudioMixingPublishVolume(_ params: NSDictionary, _ callback: Callback)

    func getAudioMixingPlayoutVolume(_ callback: Callback)

    func getAudioMixingPublishVolume(_ callback: Callback)
}

protocol RtcEngineAudioEffectInterface {
    func getEffectsVolume(_ callback: Callback)

    func setEffectsVolume(_ params: NSDictionary, _ callback: Callback)

    func setVolumeOfEffect(_ params: NSDictionary, _ callback: Callback)

    func playEffect(_ params: NSDictionary, _ callback: Callback)

    func stopEffect(_ params: NSDictionary, _ callback: Callback)

    func stopAllEffects(_ callback: Callback)

    func preloadEffect(_ params: NSDictionary, _ callback: Callback)

    func unloadEffect(_ params: NSDictionary, _ callback: Callback)

    func pauseEffect(_ params: NSDictionary, _ callback: Callback)

    func pauseAllEffects(_ callback: Callback)

    func resumeEffect(_ params: NSDictionary, _ callback: Callback)

    func resumeAllEffects(_ callback: Callback)
}

protocol RtcEngineMediaRelayInterface {
    func startChannelMediaRelay(_ params: NSDictionary, _ callback: Callback)

    func updateChannelMediaRelay(_ params: NSDictionary, _ callback: Callback)

    func stopChannelMediaRelay(_ callback: Callback)
}

protocol RtcEngineAudioRouteInterface {
    func setDefaultAudioRoutetoSpeakerphone(_ params: NSDictionary, _ callback: Callback)

    func setEnableSpeakerphone(_ params: NSDictionary, _ callback: Callback)

    func isSpeakerphoneEnabled(_ callback: Callback)
}

protocol RtcEngineEarMonitoringInterface {
    func enableInEarMonitoring(_ params: NSDictionary, _ callback: Callback)

    func setInEarMonitoringVolume(_ params: NSDictionary, _ callback: Callback)
}

protocol RtcEngineDualStreamInterface {
    func enableDualStreamMode(_ params: NSDictionary, _ callback: Callback)

    func setRemoteVideoStreamType(_ params: NSDictionary, _ callback: Callback)

    func setRemoteDefaultVideoStreamType(_ params: NSDictionary, _ callback: Callback)
}

protocol RtcEngineFallbackInterface {

    func setRemoteSubscribeFallbackOption(_ params: NSDictionary, _ callback: Callback)
}

protocol RtcEngineAudioRecorderInterface {
    func startAudioRecording(_ params: NSDictionary, _ callback: Callback)

    func stopAudioRecording(_ callback: Callback)
}

protocol RtcEngineInjectStreamInterface {
    func addInjectStreamUrl(_ params: NSDictionary, _ callback: Callback)

    func removeInjectStreamUrl(_ params: NSDictionary, _ callback: Callback)
}

protocol RtcEngineCameraInterface {
    func switchCamera(_ callback: Callback)

    func isCameraZoomSupported(_ callback: Callback)

    func isCameraTorchSupported(_ callback: Callback)

    func isCameraFocusSupported(_ callback: Callback)

    func isCameraExposurePositionSupported(_ callback: Callback)

    func isCameraAutoFocusFaceModeSupported(_ callback: Callback)

    func setCameraZoomFactor(_ params: NSDictionary, _ callback: Callback)

    func getCameraMaxZoomFactor(_ callback: Callback)

    func setCameraFocusPositionInPreview(_ params: NSDictionary, _ callback: Callback)

    func setCameraExposurePosition(_ params: NSDictionary, _ callback: Callback)

    func enableFaceDetection(_ params: NSDictionary, _ callback: Callback)

    func setCameraTorchOn(_ params: NSDictionary, _ callback: Callback)

    func setCameraAutoFocusFaceModeEnabled(_ params: NSDictionary, _ callback: Callback)

    func setCameraCapturerConfiguration(_ params: NSDictionary, _ callback: Callback)
}

@objc
class RtcEngineManager: NSObject, RtcEngineInterface {
    private var emitter: (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void
    private(set) var engine: ARtcEngineKit?
    private var delegate: RtcEngineEventHandler?

    init(_ emitter: @escaping (_ methodName: String, _ data: Dictionary<String, Any?>?) -> Void) {
        self.emitter = emitter
    }

    func Release() {
        ARtcEngineKit.destroy()
        engine = nil
        delegate = nil
    }

    @objc func create(_ params: NSDictionary, _ callback: Callback) {
        delegate = RtcEngineEventHandler() { [weak self] methodName, data in
            self?.emitter(methodName, data)
        }
        
        let appid: String? = params["appId"] as? String
        engine = ARtcEngineKit.sharedEngine(withAppId: appid!, delegate: delegate)
    }

    @objc func destroy(_ callback: Callback) {
        callback.resolve(engine) { [weak self] it in
            self?.Release()
        }
    }

    @objc func setChannelProfile(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setChannelProfile(ARChannelProfile(rawValue: UInt(params["profile"] as! Int))!))
    }

    @objc func setClientRole(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setClientRole(ARClientRole(rawValue: params["role"] as! Int)!))
    }

    @objc func joinChannel(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.joinChannel(byToken: params["appId"] as? String, channelId: params["channelName"] as! String, uid: params["optionalUid"] as? String))
    }

    @objc func switchChannel(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.switchChannel(byToken: params["token"] as? String, channelId: params["channelName"] as! String))
    }

    @objc func leaveChannel(_ callback: Callback) {
        callback.code(engine?.leaveChannel())
    }

    @objc func renewToken(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.renewToken(params["token"] as! String))
    }

    @objc func getConnectionState(_ callback: Callback) {
        callback.resolve(engine) { it in
            it.getConnectionState().rawValue
        }
    }

    @objc func getCallId(_ callback: Callback) {
        callback.resolve(engine) { it in
            it.getCallId()
        }
    }

    @objc func setLogFile(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setLogFile(params["filePath"] as! String))
    }

    @objc func setLogFilter(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setLogFilter(ARLogFilter(rawValue: params["filter"] as! UInt)!))
    }

    @objc func setLogFileSize(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setLogFileSize((params["fileSizeInKBytes"] as! UInt)))
    }

    @objc func setParameters(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setParameters(params["parameters"] as! String))
    }

    @objc func enableAudio(_ callback: Callback) {
        callback.code(engine?.enableAudio())
    }

    @objc func disableAudio(_ callback: Callback) {
        callback.code(engine?.disableAudio())
    }

    @objc func setAudioProfile(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setAudioProfile(ARAudioProfile(rawValue: params["profile"] as! Int)!, scenario: ARAudioScenario(rawValue: params["scenario"] as! Int)!))
    }

    @objc func adjustRecordingSignalVolume(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.adjustRecordingSignalVolume(params["volume"] as! Int))
    }

    @objc func adjustUserPlaybackSignalVolume(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.adjustUserPlaybackSignalVolume(params["uid"] as! String, volume: params["volume"] as! Int32))
    }

    @objc func adjustPlaybackSignalVolume(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.adjustPlaybackSignalVolume(params["volume"] as! Int))
    }

    @objc func enableLocalAudio(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.enableLocalAudio(params["enabled"] as! Bool))
    }

    @objc func muteLocalAudioStream(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.muteLocalAudioStream(params["muted"] as! Bool))
    }

    @objc func muteRemoteAudioStream(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.muteRemoteAudioStream(params["uid"] as! String, mute: params["muted"] as! Bool))
    }

    @objc func muteAllRemoteAudioStreams(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.muteAllRemoteAudioStreams(params["muted"] as! Bool))
    }

    @objc func setDefaultMuteAllRemoteAudioStreams(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setDefaultMuteAllRemoteAudioStreams(params["muted"] as! Bool))
    }

    @objc func enableAudioVolumeIndication(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.enableAudioVolumeIndication(params["interval"] as! Int, smooth: params["smooth"] as! Int, report_vad: params["report_vad"] as! Bool))
    }

    @objc func enableVideo(_ callback: Callback) {
        callback.code(engine?.enableVideo())
    }

    @objc func disableVideo(_ callback: Callback) {
        callback.code(engine?.disableVideo())
    }

    @objc func setVideoEncoderConfiguration(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setVideoEncoderConfiguration(mapToVideoEncoderConfiguration(params["config"] as! Dictionary)))
    }

    @objc func startPreview(_ callback: Callback) {
        callback.code(engine?.startPreview())
    }

    @objc func stopPreview(_ callback: Callback) {
        callback.code(engine?.stopPreview())
    }

    @objc func enableLocalVideo(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.enableLocalVideo(params["enabled"] as! Bool))
    }

    @objc func muteLocalVideoStream(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.muteLocalVideoStream(params["muted"] as! Bool))
    }

    @objc func muteRemoteVideoStream(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.muteRemoteVideoStream(params["uid"] as! String, mute: params["muted"] as! Bool))
    }

    @objc func muteAllRemoteVideoStreams(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.muteAllRemoteVideoStreams(params["muted"] as! Bool))
    }

    @objc func setDefaultMuteAllRemoteVideoStreams(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setDefaultMuteAllRemoteVideoStreams(params["muted"] as! Bool))
    }

    @objc func startAudioMixing(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.startAudioMixing(params["filePath"] as! String, loopback: params["loopback"] as! Bool, replace: params["replace"] as! Bool, cycle: params["cycle"] as! Int))
    }

    @objc func stopAudioMixing(_ callback: Callback) {
        callback.code(engine?.stopAudioMixing())
    }

    @objc func pauseAudioMixing(_ callback: Callback) {
        callback.code(engine?.pauseAudioMixing())
    }

    @objc func resumeAudioMixing(_ callback: Callback) {
        callback.code(engine?.resumeAudioMixing())
    }

    @objc func adjustAudioMixingVolume(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.adjustAudioMixingVolume(params["volume"] as! Int))
    }

    @objc func adjustAudioMixingPlayoutVolume(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.adjustAudioMixingPlayoutVolume(params["volume"] as! Int))
    }

    @objc func adjustAudioMixingPublishVolume(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.adjustAudioMixingPublishVolume(params["volume"] as! Int))
    }

    @objc func getAudioMixingPlayoutVolume(_ callback: Callback) {
        callback.code(engine?.getAudioMixingPlayoutVolume()) { it in
            it
        }
    }

    @objc func getAudioMixingPublishVolume(_ callback: Callback) {
        callback.code(engine?.getAudioMixingPublishVolume()) { it in
            it
        }
    }

    @objc func getEffectsVolume(_ callback: Callback) {
        callback.resolve(engine) { it in
            it.getEffectsVolume()
        }
    }

    @objc func setEffectsVolume(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setEffectsVolume(params["volume"] as! Double))
    }

    @objc func setVolumeOfEffect(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setVolumeOfEffect(params["soundId"] as! Int32, withVolume: params["volume"] as! Double))
    }

    @objc func playEffect(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.playEffect(params["soundId"] as! Int32, filePath: params["filePath"] as? String, loopCount: params["loopCount"] as! Int32, pitch: params["pitch"] as! Double, pan: params["pan"] as! Double, gain: params["gain"] as! Double, publish: params["publish"] as! Bool))
    }

    @objc func stopEffect(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.stopEffect(params["soundId"] as! Int32))
    }

    @objc func stopAllEffects(_ callback: Callback) {
        callback.code(engine?.stopAllEffects())
    }

    @objc func preloadEffect(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.preloadEffect(params["soundId"] as! Int32, filePath: params["filePath"] as? String))
    }

    @objc func unloadEffect(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.unloadEffect(params["soundId"] as! Int32))
    }

    @objc func pauseEffect(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.pauseEffect(params["soundId"] as! Int32))
    }

    @objc func pauseAllEffects(_ callback: Callback) {
        callback.code(engine?.pauseAllEffects())
    }

    @objc func resumeEffect(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.resumeEffect(params["soundId"] as! Int32))
    }

    @objc func resumeAllEffects(_ callback: Callback) {
        callback.code(engine?.resumeAllEffects())
    }

    @objc func startChannelMediaRelay(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.startChannelMediaRelay(mapToChannelMediaRelayConfiguration(params["channelMediaRelayConfiguration"] as! Dictionary)))
    }

    @objc func updateChannelMediaRelay(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.updateChannelMediaRelay(mapToChannelMediaRelayConfiguration(params["channelMediaRelayConfiguration"] as! Dictionary)))
    }

    @objc func stopChannelMediaRelay(_ callback: Callback) {
        callback.code(engine?.stopChannelMediaRelay())
    }

    @objc func setDefaultAudioRoutetoSpeakerphone(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setDefaultAudioRouteToSpeakerphone(params["defaultToSpeaker"] as! Bool))
    }

    @objc func setEnableSpeakerphone(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setEnableSpeakerphone(params["enabled"] as! Bool))
    }

    @objc func isSpeakerphoneEnabled(_ callback: Callback) {
        callback.resolve(engine) { it in
            it.isSpeakerphoneEnabled()
        }
    }

    @objc func enableInEarMonitoring(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.enable(inEarMonitoring: params["enabled"] as! Bool))
    }

    @objc func setInEarMonitoringVolume(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setInEarMonitoringVolume(params["volume"] as! Int))
    }

    @objc func enableDualStreamMode(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.enableDualStreamMode(params["enabled"] as! Bool))
    }

    @objc func setRemoteVideoStreamType(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setRemoteVideoStream(params["uid"] as! String, type: ARVideoStreamType(rawValue: params["streamType"] as! Int)!))
    }

    @objc func setRemoteDefaultVideoStreamType(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setRemoteDefaultVideoStreamType(ARVideoStreamType(rawValue: params["streamType"] as! Int)!))
    }

    @objc func setRemoteSubscribeFallbackOption(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setRemoteSubscribeFallbackOption(ARStreamFallbackOptions(rawValue: params["option"] as! Int)!))
    }

    @objc func startAudioRecording(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.startAudioRecording(params["filePath"] as! String, sampleRate: params["sampleRate"] as! Int, quality: ARAudioRecordingQuality(rawValue: params["quality"] as! Int)!))
    }

    @objc func stopAudioRecording(_ callback: Callback) {
        callback.code(engine?.stopAudioRecording())
    }

    @objc func addInjectStreamUrl(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.addInjectStreamUrl(params["url"] as! String, config: mapToLiveInjectStreamConfig(params["config"] as! Dictionary)))
    }

    @objc func removeInjectStreamUrl(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.removeInjectStreamUrl(params["url"] as! String))
    }

    @objc func switchCamera(_ callback: Callback) {
        callback.code(engine?.switchCamera())
    }

    @objc func isCameraZoomSupported(_ callback: Callback) {
        callback.resolve(engine) { it in
            it.isCameraZoomSupported()
        }
    }

    @objc func isCameraTorchSupported(_ callback: Callback) {
        callback.resolve(engine) { it in
            it.isCameraTorchSupported()
        }
    }

    @objc func isCameraFocusSupported(_ callback: Callback) {
        callback.code(-Int32(ARErrorCode.notSupported.rawValue))
    }

    @objc func isCameraExposurePositionSupported(_ callback: Callback) {
        callback.resolve(engine) { it in
            it.isCameraExposurePositionSupported()
        }
    }

    @objc func isCameraAutoFocusFaceModeSupported(_ callback: Callback) {
        callback.resolve(engine) { it in
            it.isCameraAutoFocusFaceModeSupported()
        }
    }

    @objc func setCameraZoomFactor(_ params: NSDictionary, _ callback: Callback) {
        callback.resolve(engine) { it in
            it.setCameraZoomFactor(CGFloat(params["factor"] as! Float))
            return nil
        }
    }

    @objc func getCameraMaxZoomFactor(_ callback: Callback) {
        callback.code(-Int32(ARErrorCode.notSupported.rawValue))
    }

    @objc func setCameraFocusPositionInPreview(_ params: NSDictionary, _ callback: Callback) {
        callback.resolve(engine) { it in
            engine?.setCameraFocusPositionInPreview(CGPoint(x: params["positionX"] as! Double, y: params["positionY"] as! Double))
            return nil
        }
    }

    @objc func setCameraExposurePosition(_ params: NSDictionary, _ callback: Callback) {
        callback.resolve(engine) { it in
            it.setCameraExposurePosition(CGPoint(x: params["positionXinView"] as! Double, y: params["positionYinView"] as! Double))
            return nil
        }
    }

    @objc func enableFaceDetection(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.enableFaceDetection(params["enable"] as! Bool))
    }

    @objc func setCameraTorchOn(_ params: NSDictionary, _ callback: Callback) {
        callback.resolve(engine) { it in
            it.setCameraTorchOn(params["isOn"] as! Bool)
            return nil
        }
    }

    @objc func setCameraAutoFocusFaceModeEnabled(_ params: NSDictionary, _ callback: Callback) {
        callback.resolve(engine) { it in
            it.setCameraAutoFocusFaceModeEnabled(params["enabled"] as! Bool)
        }
    }

    @objc func setCameraCapturerConfiguration(_ params: NSDictionary, _ callback: Callback) {
        callback.code(engine?.setCameraCapturerConfiguration(mapToCameraCapturerConfiguration(params["config"] as! Dictionary)))
    }
}
