package org.ar.rtc.base

import android.content.Context
import org.ar.rtc.*

class IRtcEngine {
    interface RtcEngineInterface : RtcUserInfoInterface, RtcAudioInterface, RtcVideoInterface,
            RtcAudioMixingInterface, RtcAudioEffectInterface, RtcVoiceChangerInterface,
            RtcVoicePositionInterface, RtcPublishStreamInterface, RtcMediaRelayInterface,
            RtcAudioRouteInterface, RtcEarMonitoringInterface, RtcDualStreamInterface,
            RtcFallbackInterface, RtcTestInterface, RtcMediaMetadataInterface,
            RtcWatermarkInterface, RtcEncryptionInterface, RtcAudioRecorderInterface,
            RtcInjectStreamInterface, RtcCameraInterface, RtcStreamMessageInterface {
        fun create(params: Map<String, *>, callback: Callback)

        fun destroy(callback: Callback)

        fun setChannelProfile(params: Map<String, *>, callback: Callback)

        fun setClientRole(params: Map<String, *>, callback: Callback)

        fun joinChannel(params: Map<String, *>, callback: Callback)

        fun switchChannel(params: Map<String, *>, callback: Callback)

        fun leaveChannel(callback: Callback)

        fun renewToken(params: Map<String, *>, callback: Callback)

        @Deprecated("")
        fun enableWebSdkInteroperability(params: Map<String, *>, callback: Callback)

        fun getConnectionState(callback: Callback)

        fun getCallId(callback: Callback)

        fun setLogFile(params: Map<String, *>, callback: Callback)

        fun setLogFilter(params: Map<String, *>, callback: Callback)

        fun setLogFileSize(params: Map<String, *>, callback: Callback)

        fun setParameters(params: Map<String, *>, callback: Callback)
    }

    interface RtcUserInfoInterface {
    }

    interface RtcAudioInterface {
        fun enableAudio(callback: Callback)

        fun disableAudio(callback: Callback)

        fun setAudioProfile(params: Map<String, *>, callback: Callback)

        fun adjustRecordingSignalVolume(params: Map<String, *>, callback: Callback)

        fun adjustUserPlaybackSignalVolume(params: Map<String, *>, callback: Callback)

        fun adjustPlaybackSignalVolume(params: Map<String, *>, callback: Callback)

        fun enableLocalAudio(params: Map<String, *>, callback: Callback)

        fun muteLocalAudioStream(params: Map<String, *>, callback: Callback)

        fun muteRemoteAudioStream(params: Map<String, *>, callback: Callback)

        fun muteAllRemoteAudioStreams(params: Map<String, *>, callback: Callback)

        fun setDefaultMuteAllRemoteAudioStreams(params: Map<String, *>, callback: Callback)

        fun enableAudioVolumeIndication(params: Map<String, *>, callback: Callback)
    }

    interface RtcVideoInterface {
        fun enableVideo(callback: Callback)

        fun disableVideo(callback: Callback)

        fun setVideoEncoderConfiguration(params: Map<String, *>, callback: Callback)

        fun startPreview(callback: Callback)

        fun stopPreview(callback: Callback)

        fun enableLocalVideo(params: Map<String, *>, callback: Callback)

        fun muteLocalVideoStream(params: Map<String, *>, callback: Callback)

        fun muteRemoteVideoStream(params: Map<String, *>, callback: Callback)

        fun muteAllRemoteVideoStreams(params: Map<String, *>, callback: Callback)

        fun setDefaultMuteAllRemoteVideoStreams(params: Map<String, *>, callback: Callback)

    }

    interface RtcAudioMixingInterface {
        fun startAudioMixing(params: Map<String, *>, callback: Callback)

        fun stopAudioMixing(callback: Callback)

        fun pauseAudioMixing(callback: Callback)

        fun resumeAudioMixing(callback: Callback)

        fun adjustAudioMixingVolume(params: Map<String, *>, callback: Callback)

        fun adjustAudioMixingPlayoutVolume(params: Map<String, *>, callback: Callback)

        fun adjustAudioMixingPublishVolume(params: Map<String, *>, callback: Callback)

        fun getAudioMixingPlayoutVolume(callback: Callback)

        fun getAudioMixingPublishVolume(callback: Callback)

    }

    interface RtcAudioEffectInterface {
        fun getEffectsVolume(callback: Callback)

        fun setEffectsVolume(params: Map<String, *>, callback: Callback)

        fun setVolumeOfEffect(params: Map<String, *>, callback: Callback)

        fun playEffect(params: Map<String, *>, callback: Callback)

        fun stopEffect(params: Map<String, *>, callback: Callback)

        fun stopAllEffects(callback: Callback)

        fun preloadEffect(params: Map<String, *>, callback: Callback)

        fun unloadEffect(params: Map<String, *>, callback: Callback)

        fun pauseEffect(params: Map<String, *>, callback: Callback)

        fun pauseAllEffects(callback: Callback)

        fun resumeEffect(params: Map<String, *>, callback: Callback)

        fun resumeAllEffects(callback: Callback)

        fun setAudioSessionOperationRestriction(params: Map<String, *>, callback: Callback)
    }

    interface RtcVoiceChangerInterface {
    }

    interface RtcVoicePositionInterface {
    }

    interface RtcPublishStreamInterface {
        fun setLiveTranscoding(params: Map<String, *>, callback: Callback)

        fun addPublishStreamUrl(params: Map<String, *>, callback: Callback)

        fun removePublishStreamUrl(params: Map<String, *>, callback: Callback)
    }

    interface RtcMediaRelayInterface {
        fun startChannelMediaRelay(params: Map<String, *>, callback: Callback)

        fun updateChannelMediaRelay(params: Map<String, *>, callback: Callback)

        fun stopChannelMediaRelay(callback: Callback)
    }

    interface RtcAudioRouteInterface {
        fun setDefaultAudioRoutetoSpeakerphone(params: Map<String, *>, callback: Callback)

        fun setEnableSpeakerphone(params: Map<String, *>, callback: Callback)

        fun isSpeakerphoneEnabled(callback: Callback)
    }

    interface RtcEarMonitoringInterface {
        fun enableInEarMonitoring(params: Map<String, *>, callback: Callback)

        fun setInEarMonitoringVolume(params: Map<String, *>, callback: Callback)
    }

    interface RtcDualStreamInterface {
        fun enableDualStreamMode(params: Map<String, *>, callback: Callback)

        fun setRemoteVideoStreamType(params: Map<String, *>, callback: Callback)

        fun setRemoteDefaultVideoStreamType(params: Map<String, *>, callback: Callback)
    }

    interface RtcFallbackInterface {
        fun setLocalPublishFallbackOption(params: Map<String, *>, callback: Callback)

        fun setRemoteSubscribeFallbackOption(params: Map<String, *>, callback: Callback)

        fun setRemoteUserPriority(params: Map<String, *>, callback: Callback)
    }

    interface RtcTestInterface {
        fun startEchoTest(params: Map<String, *>, callback: Callback)

        fun stopEchoTest(callback: Callback)

        fun enableLastmileTest(callback: Callback)

        fun disableLastmileTest(callback: Callback)

        fun startLastmileProbeTest(params: Map<String, *>, callback: Callback)

        fun stopLastmileProbeTest(callback: Callback)
    }

    interface RtcMediaMetadataInterface {

    }

    interface RtcWatermarkInterface {
    }

    interface RtcEncryptionInterface {
    }

    interface RtcAudioRecorderInterface {
        fun startAudioRecording(params: Map<String, *>, callback: Callback)

        fun stopAudioRecording(callback: Callback)
    }

    interface RtcInjectStreamInterface {
        fun addInjectStreamUrl(params: Map<String, *>, callback: Callback)

        fun removeInjectStreamUrl(params: Map<String, *>, callback: Callback)
    }

    interface RtcCameraInterface {
        fun switchCamera(callback: Callback)

        fun isCameraZoomSupported(callback: Callback)

        fun isCameraTorchSupported(callback: Callback)

        fun isCameraFocusSupported(callback: Callback)

        fun isCameraExposurePositionSupported(callback: Callback)

        fun isCameraAutoFocusFaceModeSupported(callback: Callback)

        fun setCameraZoomFactor(params: Map<String, *>, callback: Callback)

        fun getCameraMaxZoomFactor(callback: Callback)

        fun setCameraFocusPositionInPreview(params: Map<String, *>, callback: Callback)

        fun setCameraExposurePosition(params: Map<String, *>, callback: Callback)

        fun enableFaceDetection(params: Map<String, *>, callback: Callback)

        fun setCameraTorchOn(params: Map<String, *>, callback: Callback)

        fun setCameraAutoFocusFaceModeEnabled(params: Map<String, *>, callback: Callback)

    }

    interface RtcStreamMessageInterface {
    }

    interface RtcStreamingKitInterface{

    }
}

class RtcEngineManager(
        private val emit: (methodName: String, data: Map<String, Any?>?) -> Unit
) : IRtcEngine.RtcEngineInterface {
    var engine: RtcEngine? = null
        private set

    fun release() {
        RtcEngine.destroy()
        LocalViewManager.videoViewArray.clear()
        engine = null
    }

    override fun create(params: Map<String, *>, callback: Callback) {
        
        engine = RtcEngine.create(params["context"] as Context,params["appId"] as String,RtcEngineEventHandler { methodName, data ->
                emit(methodName, data)
            })
        LocalViewManager.videoViewArray.clear()
        callback.code(0)
    }

    override fun destroy(callback: Callback) {
        callback.resolve(engine) { release() }
    }

    override fun setChannelProfile(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setChannelProfile((params["profile"] as Number).toInt()))
    }

    override fun setClientRole(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setClientRole((params["role"] as Number).toInt()))
    }

    override fun joinChannel(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.joinChannel(params["token"] as? String, params["channelName"] as String, params["optionalInfo"] as? String, (params["optionalUid"] as String).toString()))
    }

    override fun switchChannel(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.switchChannel(params["token"] as? String, params["channelName"] as String))
    }

    override fun leaveChannel(callback: Callback) {
        callback.code(engine?.leaveChannel())
        LocalViewManager.videoViewArray.clear()
    }

    override fun renewToken(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.renewToken(params["token"] as String))
    }

    override fun enableWebSdkInteroperability(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.enableWebSdkInteroperability())
    }

    override fun getConnectionState(callback: Callback) {
        callback.resolve(engine) { it.connectionState }
    }


    override fun getCallId(callback: Callback) {
        callback.resolve(engine) { it.callId }
    }



    override fun setLogFile(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setLogFile(params["filePath"] as String))
    }

    override fun setLogFilter(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setLogFilter((params["filter"] as Number).toInt()))
    }

    override fun setLogFileSize(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setLogFileSize((params["fileSizeInKBytes"] as Number).toInt()))
    }

    override fun setParameters(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setParameters(params["parameters"] as String))
    }




    override fun enableAudio(callback: Callback) {
        callback.code(engine?.enableAudio())
    }

    override fun disableAudio(callback: Callback) {
        callback.code(engine?.disableAudio())
    }

    override fun setAudioProfile(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setAudioProfile((params["profile"] as Number).toInt(), (params["scenario"] as Number).toInt()))
    }

    override fun adjustRecordingSignalVolume(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.adjustRecordingSignalVolume((params["volume"] as Number).toInt()))
    }

    override fun adjustUserPlaybackSignalVolume(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.adjustUserPlaybackSignalVolume((params["uid"] as String).toString(), (params["volume"] as Number).toInt()))
    }

    override fun adjustPlaybackSignalVolume(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.adjustPlaybackSignalVolume((params["volume"] as Number).toInt()))
    }

    override fun enableLocalAudio(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.enableLocalAudio(params["enabled"] as Boolean))
    }

    override fun muteLocalAudioStream(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.muteLocalAudioStream(params["muted"] as Boolean))
    }

    override fun muteRemoteAudioStream(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.muteRemoteAudioStream((params["uid"] as String).toString(), params["muted"] as Boolean))
    }

    override fun muteAllRemoteAudioStreams(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.muteAllRemoteAudioStreams(params["muted"] as Boolean))
    }

    override fun setDefaultMuteAllRemoteAudioStreams(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setDefaultMuteAllRemoteAudioStreams(params["muted"] as Boolean))
    }

    override fun enableAudioVolumeIndication(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.enableAudioVolumeIndication((params["interval"] as Number).toInt(), (params["smooth"] as Number).toInt(), params["report_vad"] as Boolean))
    }

    override fun enableVideo(callback: Callback) {
        callback.code(engine?.enableVideo())
    }

    override fun disableVideo(callback: Callback) {
        callback.code(engine?.disableVideo())
    }

    override fun setVideoEncoderConfiguration(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setVideoEncoderConfiguration(mapToVideoEncoderConfiguration(params["config"] as Map<*, *>)))
    }

    override fun startPreview(callback: Callback) {
        callback.code(engine?.startPreview())
    }

    override fun stopPreview(callback: Callback) {
        callback.code(engine?.stopPreview())
    }

    override fun enableLocalVideo(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.enableLocalVideo(params["enabled"] as Boolean))
    }

    override fun muteLocalVideoStream(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.muteLocalVideoStream(params["muted"] as Boolean))
    }

    override fun muteRemoteVideoStream(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.muteRemoteVideoStream((params["uid"] as String).toString(), params["muted"] as Boolean))
    }

    override fun muteAllRemoteVideoStreams(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.muteAllRemoteVideoStreams(params["muted"] as Boolean))
    }

    override fun setDefaultMuteAllRemoteVideoStreams(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setDefaultMuteAllRemoteVideoStreams(params["muted"] as Boolean))
    }


    override fun startAudioMixing(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.startAudioMixing(params["filePath"] as String, params["loopback"] as Boolean, params["replace"] as Boolean, (params["cycle"] as Number).toInt()))
    }

    override fun stopAudioMixing(callback: Callback) {
        callback.code(engine?.stopAudioMixing())
    }

    override fun pauseAudioMixing(callback: Callback) {
        callback.code(engine?.pauseAudioMixing())
    }

    override fun resumeAudioMixing(callback: Callback) {
        callback.code(engine?.resumeAudioMixing())
    }

    override fun adjustAudioMixingVolume(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.adjustAudioMixingVolume((params["volume"] as Number).toInt()))
    }

    override fun adjustAudioMixingPlayoutVolume(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.adjustAudioMixingPlayoutVolume((params["volume"] as Number).toInt()))
    }

    override fun adjustAudioMixingPublishVolume(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.adjustAudioMixingPublishVolume((params["volume"] as Number).toInt()))
    }

    override fun getAudioMixingPlayoutVolume(callback: Callback) {
        callback.code(engine?.audioMixingPlayoutVolume) { it }
    }

    override fun getAudioMixingPublishVolume(callback: Callback) {
        callback.code(engine?.audioMixingPublishVolume) { it }
    }


    override fun getEffectsVolume(callback: Callback) {
        callback.resolve(engine) { it.audioEffectManager.effectsVolume }
    }

    override fun setEffectsVolume(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.audioEffectManager?.setEffectsVolume((params["volume"] as Number).toDouble()))
    }

    override fun setVolumeOfEffect(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.audioEffectManager?.setVolumeOfEffect((params["soundId"] as Number).toInt(), (params["volume"] as Number).toDouble()))
    }

    override fun playEffect(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.audioEffectManager?.playEffect((params["soundId"] as Number).toInt(), params["filePath"] as String, (params["loopCount"] as Number).toInt(), (params["pitch"] as Number).toDouble(), (params["pan"] as Number).toDouble(), (params["gain"] as Number).toDouble(), params["publish"] as Boolean))
    }

    override fun stopEffect(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.audioEffectManager?.stopEffect((params["soundId"] as Number).toInt()))
    }

    override fun stopAllEffects(callback: Callback) {
        callback.code(engine?.audioEffectManager?.stopAllEffects())
    }

    override fun preloadEffect(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.audioEffectManager?.preloadEffect((params["soundId"] as Number).toInt(), params["filePath"] as String))
    }

    override fun unloadEffect(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.audioEffectManager?.unloadEffect((params["soundId"] as Number).toInt()))
    }

    override fun pauseEffect(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.audioEffectManager?.pauseEffect((params["soundId"] as Number).toInt()))
    }

    override fun pauseAllEffects(callback: Callback) {
        callback.code(engine?.audioEffectManager?.pauseAllEffects())
    }

    override fun resumeEffect(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.audioEffectManager?.resumeEffect((params["soundId"] as Number).toInt()))
    }

    override fun resumeAllEffects(callback: Callback) {
        callback.code(engine?.audioEffectManager?.resumeAllEffects())
    }

    override fun setAudioSessionOperationRestriction(params: Map<String, *>, callback: Callback) {
        callback.code(-Constants.ERR_NOT_SUPPORTED)
    }




    override fun startChannelMediaRelay(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.startChannelMediaRelay(mapToChannelMediaRelayConfiguration(params["channelMediaRelayConfiguration"] as Map<*, *>)))
    }

    override fun updateChannelMediaRelay(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.updateChannelMediaRelay(mapToChannelMediaRelayConfiguration(params["channelMediaRelayConfiguration"] as Map<*, *>)))
    }

    override fun stopChannelMediaRelay(callback: Callback) {
        callback.code(engine?.stopChannelMediaRelay())
    }

    override fun setDefaultAudioRoutetoSpeakerphone(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setDefaultAudioRoutetoSpeakerphone(params["defaultToSpeaker"] as Boolean))
    }

    override fun setEnableSpeakerphone(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setEnableSpeakerphone(params["enabled"] as Boolean))
    }

    override fun isSpeakerphoneEnabled(callback: Callback) {
        callback.resolve(engine) { it.isSpeakerphoneEnabled }
    }

    override fun enableInEarMonitoring(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.enableInEarMonitoring(params["enabled"] as Boolean))
    }

    override fun setInEarMonitoringVolume(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setInEarMonitoringVolume((params["volume"] as Number).toInt()))
    }

    override fun enableDualStreamMode(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.enableDualStreamMode(params["enabled"] as Boolean))
    }

    override fun setRemoteVideoStreamType(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setRemoteVideoStreamType((params["uid"] as String).toString(), (params["streamType"] as Number).toInt()))
    }

    override fun setRemoteDefaultVideoStreamType(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setRemoteDefaultVideoStreamType((params["streamType"] as Number).toInt()))
    }

    override fun setLocalPublishFallbackOption(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setLocalPublishFallbackOption((params["option"] as Number).toInt()))
    }

    override fun setRemoteSubscribeFallbackOption(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setRemoteSubscribeFallbackOption((params["option"] as Number).toInt()))
    }

    override fun setRemoteUserPriority(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setRemoteUserPriority((params["uid"] as String).toString(), (params["userPriority"] as Number).toInt()))
    }

    override fun startEchoTest(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.startEchoTest((params["intervalInSeconds"] as Number).toInt()))
    }

    override fun stopEchoTest(callback: Callback) {
        callback.code(engine?.stopEchoTest())
    }

    override fun enableLastmileTest(callback: Callback) {
        callback.code(engine?.enableLastmileTest())
    }

    override fun disableLastmileTest(callback: Callback) {
        callback.code(engine?.disableLastmileTest())
    }

    override fun startLastmileProbeTest(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.startLastmileProbeTest(mapToLastmileProbeConfig(params["config"] as Map<*, *>)))
    }

    override fun stopLastmileProbeTest(callback: Callback) {
        callback.code(engine?.stopLastmileProbeTest())
    }










    override fun startAudioRecording(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.startAudioRecording(params["filePath"] as String, (params["sampleRate"] as Number).toInt(), (params["quality"] as Number).toInt()))
    }

    override fun stopAudioRecording(callback: Callback) {
        callback.code(engine?.stopAudioRecording())
    }

    override fun addInjectStreamUrl(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.addInjectStreamUrl(params["url"] as String, mapToLiveInjectStreamConfig(params["config"] as Map<*, *>)))
    }

    override fun removeInjectStreamUrl(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.removeInjectStreamUrl(params["url"] as String))
    }

    override fun switchCamera(callback: Callback) {
        callback.code(engine?.switchCamera())
    }

    override fun isCameraZoomSupported(callback: Callback) {
        callback.resolve(engine) { it.isCameraZoomSupported }
    }

    override fun isCameraTorchSupported(callback: Callback) {
        callback.resolve(engine) { it.isCameraTorchSupported }
    }

    override fun isCameraFocusSupported(callback: Callback) {
        callback.resolve(engine) { it.isCameraFocusSupported }
    }

    override fun isCameraExposurePositionSupported(callback: Callback) {
        callback.resolve(engine) { it.isCameraExposurePositionSupported }
    }

    override fun isCameraAutoFocusFaceModeSupported(callback: Callback) {
        callback.resolve(engine) { it.isCameraAutoFocusFaceModeSupported }
    }

    override fun setCameraZoomFactor(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setCameraZoomFactor((params["factor"] as Number).toFloat()))
    }

    override fun getCameraMaxZoomFactor(callback: Callback) {
        callback.resolve(engine) { it.cameraMaxZoomFactor }
    }

    override fun setCameraFocusPositionInPreview(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setCameraFocusPositionInPreview((params["positionX"] as Number).toFloat(), (params["positionY"] as Number).toFloat()))
    }

    override fun setCameraExposurePosition(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setCameraExposurePosition((params["positionXinView"] as Number).toFloat(), (params["positionYinView"] as Number).toFloat()))
    }

    override fun enableFaceDetection(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.enableFaceDetection(params["enable"] as Boolean))
    }

    override fun setCameraTorchOn(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setCameraTorchOn(params["isOn"] as Boolean))
    }

    override fun setCameraAutoFocusFaceModeEnabled(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setCameraAutoFocusFaceModeEnabled(params["enabled"] as Boolean))
    }

    override fun setLiveTranscoding(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.setLiveTranscoding(mapToLiveTranscoding(params["transcoding"] as Map<*, *>)))
    }

    override fun addPublishStreamUrl(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.addPublishStreamUrl(params["url"] as String, params["transcodingEnabled"] as Boolean))
    }

    override fun removePublishStreamUrl(params: Map<String, *>, callback: Callback) {
        callback.code(engine?.removePublishStreamUrl(params["url"] as String))
    }

}
