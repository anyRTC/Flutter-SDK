import 'dart:async';
import 'package:ar_rtc_engine/src/enum_converter.dart';
import 'package:flutter/services.dart';
import 'classes.dart';
import 'enums.dart';

class RtcMediaPlayer with RtcMediaPlayerInterface{
  static const MethodChannel _methodChannel = MethodChannel('ar_rtc_media_player');
  static RtcMediaPlayer _mediaPlayer;


  static Future<RtcMediaPlayer> create() async {
    if(_mediaPlayer ==null){
      await _methodChannel.invokeMethod("createInstance");
      _mediaPlayer = RtcMediaPlayer();
    }
    return _mediaPlayer;
  }

  @override
  Future<void> adjustPlayoutVolume(int vol) {
    return _methodChannel.invokeMethod('adjustPlayoutVolume', {
      'vol': vol
    });
  }

  @override
  Future<void> destroy() {
    _mediaPlayer = null;
    return _methodChannel.invokeMethod("destroy");
  }

  @override
  Future<int> getDuration() {
   return _methodChannel.invokeMethod("getDuration");
  }

  @override
  Future<int> getPlayPosition() {
    return _methodChannel.invokeMethod("getPlayPosition");
  }

  @override
  Future<int> getPlayoutVolume() {
    return _methodChannel.invokeMethod("getPlayoutVolume");
  }

  @override
  Future<int> getState() {
    return _methodChannel.invokeMethod("getState");
  }

  @override
  Future<int> getStreamByIndex() {
    return _methodChannel.invokeMethod("getStreamByIndex");
  }

  @override
  Future<int> getStreamCount() {
    return _methodChannel.invokeMethod("getStreamCount");
  }

  @override
  Future<bool> isMuted() {
    return _methodChannel.invokeMethod("isMuted");
  }

  @override
  Future<void> mute(bool mute) {
    return _methodChannel.invokeMethod("mute",{"mute":mute});
  }

  @override
  Future<void> open(String url, int startPos) {
    return _methodChannel.invokeMethod("open",{"url":url,"startPos":startPos});
  }

  @override
  Future<void> pause() {
    return _methodChannel.invokeMethod("pause");
  }

  @override
  Future<void> play() {
    return _methodChannel.invokeMethod("play");
  }

  @override
  Future<void> seek(int pos) {
    return _methodChannel.invokeMethod("seek",{"pos":pos});
  }

  @override
  Future<void> setRenderMode(VideoRenderMode mode) {
    return _methodChannel.invokeMethod("setRenderMode",{"mode":VideoRenderModeConverter(mode).value()});
  }

  @override
  Future<void> setView() {

  }

  @override
  Future<void> stop() {
    return _methodChannel.invokeMethod("stop");
  }

}


mixin RtcMediaPlayerInterface {
  Future<void> open(String url, int startPos);

  Future<void> play();

  Future<void> pause();

  Future<void> stop();

  Future<void> setView();

  Future<void> seek(int pos);

  Future<void> mute(bool mute);

  Future<bool> isMuted();

  Future<void> adjustPlayoutVolume(int vol);

  Future<int> getPlayoutVolume();

  Future<int> getPlayPosition();

  Future<int> getDuration();

  Future<int> getState();

  Future<void> setRenderMode(VideoRenderMode mode);

  Future<int> getStreamCount();

  Future<int> getStreamByIndex();

  Future<void> destroy();
}
