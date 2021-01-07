import 'dart:async';
import 'package:ar_rtc_engine/src/enum_converter.dart';
import 'package:flutter/services.dart';
import 'classes.dart';
import 'enums.dart';

class StreamKit with RtcStreamKitInterface{

  static const MethodChannel _methodChannel = MethodChannel('ar_rtc_stream_kit');
  static StreamKit _streamKit;

  static Future<StreamKit> create() async {
    if(_streamKit ==null){
      await _methodChannel.invokeMethod("createInstance",{'name': "stream"});
      _streamKit = StreamKit();
    }
    return _streamKit;
  }

  @override
  Future<void> pushStream(String url) {
    return _methodChannel.invokeMethod('pushStream', {
      'url': url
    });
  }

  @override
  Future<void> release() {
   _streamKit = null;
   return _methodChannel.invokeMethod("release");
  }

  @override
  Future<void> setLiveTranscoding(LiveTranscoding transcoding) {
    return _methodChannel.invokeMethod(
        'setLiveTranscoding', {'transcoding': transcoding.toJson()});
  }

  @override
  Future<void> setMode(StreamPushMode mode) {
    return _methodChannel.invokeMethod("setMode",{"mode":StreamPushModeConverter(mode).value()});
  }

  @override
  Future<void> unPushStream() {
    return _methodChannel.invokeMethod("unPushStream");
  }
}

mixin RtcStreamKitInterface {
  Future<void> release();
  Future<void> pushStream(String url);
  Future<void> unPushStream();
  Future<void> setMode(StreamPushMode mode);
  Future<void> setLiveTranscoding(LiveTranscoding transcoding);
}

