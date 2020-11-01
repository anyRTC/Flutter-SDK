import 'dart:async';

import 'package:flutter/services.dart';

import 'classes.dart';
import 'enum_converter.dart';
import 'enums.dart';
import 'events.dart';
import 'rtc_engine.dart';

/// The RtcChannel class.
class RtcChannel with RtcChannelInterface {
  static const MethodChannel _methodChannel =
      MethodChannel('ar_rtc_channel');
  static const EventChannel _eventChannel =
      EventChannel('ar_rtc_channel/events');

  static StreamSubscription _subscription;

  static final Map<String, RtcChannel> _channels = {};

  /// The ID of RtcChannel
  final String channelId;

  RtcChannelEventHandler _handler;

  RtcChannel._(this.channelId);

  Future<T> _invokeMethod<T>(String method, [Map<String, dynamic> arguments]) {
    return _methodChannel.invokeMethod(
        method,
        arguments == null
            ? {'channelId': channelId}
            : {'channelId': channelId, ...arguments});
  }

  /// Creates and gets an [RtcChannel] instance.
  ///
  /// To join more than one channel, call this method multiple times to create as many [RtcChannel] instances as needed, and call the [RtcChannel.joinChannel] method of each created [RtcChannel] object.
  /// After joining multiple channels, you can simultaneously subscribe to streams of all the channels, but publish a stream in only one channel at one time.
  ///
  /// **Parameter** [channelId] The unique channel name for the AgoraRTC session in the string format. The string length must be less than 64 bytes. This parameter does not have a default value. You must set it. Do not set it as the empty string "". Otherwise, the SDK returns [ErrorCode.Refused]. Supported character scopes are:
  /// - All lowercase English letters: a to z.
  /// - All uppercase English letters: A to Z.
  /// - All numeric characters: 0 to 9.
  /// - The space character.
  /// - Punctuation characters and other symbols, including: "!", "#", "$", "%", "&", "(", ")", "+", "-", ":", ";", "<", "=", ".", ">", "?", "@", "[", "]", "^", "_", " {", "}", "|", "~", ",".
  static Future<RtcChannel> create(String channelId) async {
    if (_channels.containsKey(channelId)) return _channels[channelId];
    await _methodChannel.invokeMethod('create', {'channelId': channelId});
    _channels[channelId] = RtcChannel._(channelId);
    return _channels[channelId];
  }

  /// Destroys all [RtcChannel] instance.
  static void destroyAll() {
    _channels.forEach((key, value) async {
      await value.destroy();
    });
    _channels.clear();
  }

  @override
  Future<void> destroy() {
    _channels.remove(channelId);
    return _invokeMethod('destroy');
  }

  /// Sets the channel event handler.
  ///
  /// After setting the channel event handler, you can listen for channel events and receive the statistics of the corresponding [RtcChannel] instance.
  ///
  /// **Parameter** [handler] The event handler.
  void setEventHandler(RtcChannelEventHandler handler) {
    _handler = handler;
    _subscription ??= _eventChannel.receiveBroadcastStream().listen((event) {
      final eventMap = Map<dynamic, dynamic>.from(event);
      final channelId = eventMap['channelId'];
      final methodName = eventMap['methodName'] as String;
      final data = List<dynamic>.from(eventMap['data']);
      _channels[channelId]?._handler?.process(methodName, data);
    });
  }

  @override
  Future<void> setClientRole(ClientRole role) {
    return _invokeMethod(
        'setClientRole', {'role': ClientRoleConverter(role).value()});
  }

  @override
  Future<void> joinChannel(String token, String optionalUid,
      ChannelMediaOptions options) {
    return _invokeMethod('joinChannel', {
      'token': token,
      'optionalUid': optionalUid,
      'options': options.toJson()
    });
  }

  @override
  Future<void> leaveChannel() {
    return _invokeMethod('leaveChannel');
  }

  @override
  Future<void> renewToken(String token) {
    return _invokeMethod('renewToken', {'token': token});
  }

  @override
  Future<void> publish() {
    return _invokeMethod('publish');
  }

  @override
  Future<void> unpublish() {
    return _invokeMethod('unpublish');
  }

  @override
  Future<String> getCallId() {
    return _invokeMethod('getCallId');
  }

  @override
  Future<void> adjustUserPlaybackSignalVolume(String uid, int volume) {
    return _invokeMethod(
        'adjustUserPlaybackSignalVolume', {'uid': uid, 'volume': volume});
  }

  @override
  Future<void> muteAllRemoteAudioStreams(bool muted) {
    return _invokeMethod('muteAllRemoteAudioStreams', {'muted': muted});
  }

  @override
  Future<void> muteRemoteAudioStream(String uid, bool muted) {
    return _invokeMethod('muteRemoteAudioStream', {'uid': uid, 'muted': muted});
  }

  @override
  Future<void> setDefaultMuteAllRemoteAudioStreams(bool muted) {
    return _invokeMethod(
        'setDefaultMuteAllRemoteAudioStreams', {'muted': muted});
  }

  @override
  Future<void> muteAllRemoteVideoStreams(bool muted) {
    return _invokeMethod('muteAllRemoteVideoStreams', {'muted': muted});
  }

  @override
  Future<void> muteRemoteVideoStream(String uid, bool muted) {
    return _invokeMethod('muteRemoteVideoStream', {'uid': uid, 'muted': muted});
  }

  @override
  Future<void> setDefaultMuteAllRemoteVideoStreams(bool muted) {
    return _invokeMethod(
        'setDefaultMuteAllRemoteVideoStreams', {'muted': muted});
  }

  @override
  Future<void> setRemoteDefaultVideoStreamType(VideoStreamType streamType) {
    return _invokeMethod('setRemoteDefaultVideoStreamType',
        {'streamType': VideoStreamTypeConverter(streamType).value()});
  }

  @override
  Future<void> setRemoteVideoStreamType(String uid, VideoStreamType streamType) {
    return _invokeMethod('setRemoteVideoStreamType', {
      'uid': uid,
      'streamType': VideoStreamTypeConverter(streamType).value()
    });
  }
}

mixin RtcChannelInterface
    implements
        RtcAudioInterface,
        RtcVideoInterface,
        RtcDualStreamInterface {
  /// Destroys the [RtcChannel] instance.
  Future<void> destroy();

  /// Sets the role of a user.
  ///
  /// This method sets the role of a user, such as a host or an audience. In a LiveBroadcasting channel, only a broadcaster can call the [RtcChannel.publish] method in the [RtcChannel] class.
  ///
  /// A successful call of this method triggers the following callbacks:
  /// - The local client: [RtcChannelEventHandler.clientRoleChanged].
  /// - The remote client: [RtcChannelEventHandler.userJoined] or [RtcChannelEventHandler.userOffline] ([UserOfflineReason.BecomeAudience]).
  ///
  /// **Parameter** [role] The role of the user. See [ClientRole].
  Future<void> setClientRole(ClientRole role);

  /// Joins the channel with a user ID.
  ///
  /// **Note**
  /// - If you are already in a channel, you cannot rejoin it with the same uid.
  /// - We recommend using different UIDs for different channels.
  /// - If you want to join the same channel from different devices, ensure that the UIDs in all devices are different.
  /// - Ensure that the app ID you use to generate the token is the same with the app ID used when creating the [RtcEngine] instance.
  ///
  /// **Parameter** [token] token
  /// 
  /// **Parameter** [optionalUid] The user ID.  This parameter must be unique. If uid is not assigned (or set as 0), the SDK assigns a uid and reports it in the onJoinChannelSuccess callback. The app must maintain this user ID.
  ///
  /// **Parameter** [options] The channel media options. See [ChannelMediaOptions].
  Future<void> joinChannel(String token, String optionalUid,
      ChannelMediaOptions options);

  /// Leaves the current channel.
  ///
  /// A successful leaveChannel method call triggers the following callbacks:
  /// - The local client: [RtcChannelEventHandler.leaveChannel].
  /// - The remote client: [RtcChannelEventHandler.userOffline], if the user leaving the channel is in a Communication channel, or is a broadcaster in a [ChannelProfile.LiveBroadcasting] channel .
  Future<void> leaveChannel();

  /// Renews the token when the current token expires.
  ///
  /// In the following situations, the SDK decides that the current token has expired:
  /// - The SDK triggers the [RtcChannelEventHandler.tokenPrivilegeWillExpire] callback, or
  /// - The [RtcChannelEventHandler.connectionStateChanged] callback reports the [ConnectionChangedReason.TokenExpired] error.
  /// You should get a new token from your server and call this method to renew it. Failure to do so results in the SDK disconnecting from the Agora server.
  /// **Parameter** [token] The new token.
  Future<void> renewToken(String token);

  /// Publishes the local stream to the channel.
  ///
  /// You must keep the following restrictions in mind when calling this method. Otherwise, the SDK returns [ErrorCode.Refused]：
  /// - This method publishes one stream only to the channel corresponding to the current [RtcChannel] instance.
  /// - In a LiveBroadcasting channel, only a broadcaster can call this method. To switch the client role, call [RtcChannel.setClientRole] of the current [RtcChannel] instance.
  /// - You can publish a stream to only one channel at a time. For details, see the advanced guide *Join Multiple Channels*.
  Future<void> publish();

  /// Stops publishing a stream to the channel.
  ///
  /// If you call this method in a channel where you are not publishing streams, the SDK returns [ErrorCode.Refused].
  Future<void> unpublish();
}

mixin RtcAudioInterface {
  /// Adjusts the playback volume of a specified remote user.
  ///
  /// You can call this method as many times as necessary to adjust the playback volume of different remote users, or to repeatedly adjust the playback volume of the same remote user.
  ///
  /// **Note**
  /// - Call this method after joining a channel.
  /// - The playback volume here refers to the mixed volume of a specified remote user.
  /// - This method can only adjust the playback volume of one specified remote user at a time. To adjust the playback volume of different remote users, call the method as many times, once for each remote user.
  ///
  /// **Parameter** [uid] ID of the remote user.
  ///
  /// **Parameter** [volume] The playback volume of the specified remote user. The value ranges from 0 to 100:
  /// - 0: Mute.
  /// - 100: The original volume.
  Future<void> adjustUserPlaybackSignalVolume(String uid, int volume);

  /// Stops/Resumes receiving the audio stream of the specified user.
  ///
  /// **Parameter** [uid] ID of the remote user whose audio stream you want to mute.
  ///
  /// **Parameter** [muted] Determines whether to receive/stop receiving the audio stream of the specified user:
  /// - `true`: Stop receiving the audio stream of the user.
  /// - `false`: (Default) Receive the audio stream of the user.
  Future<void> muteRemoteAudioStream(String uid, bool muted);

  /// Stops/Resumes receiving all remote audio streams.
  ///
  /// **Parameter** [muted] Determines
  /// whether to receive/stop receiving all remote audio streams:
  /// - `true`: Stop receiving all remote audio streams.
  /// - `false`: (Default) Receive all remote audio streams.
  Future<void> muteAllRemoteAudioStreams(bool muted);

  /// Sets whether to receive all remote audio streams by default.
  ///
  /// **Parameter** [muted] Determines whether to receive/stop receiving all remote audio streams by default:
  /// - `true`: Stop receiving all remote audio streams by default.
  /// - `false`: (Default) Receive all remote audio streams by default.
  Future<void> setDefaultMuteAllRemoteAudioStreams(bool muted);
}

mixin RtcVideoInterface {
  /// Stops/Resumes receiving the video stream of the specified user.
  ///
  /// **Parameter** [uid] ID of the remote user whose video stream you want to mute.
  ///
  /// **Parameter** [muted] Determines whether to receive/stop receiving the video stream of the specified user:
  /// - `true`: Stop receiving the video stream of the user.
  /// - `false`: (Default) Receive the video stream of the user.
  Future<void> muteRemoteVideoStream(String uid, bool muted);

  /// Stops/Resumes receiving all remote video streams.
  ///
  /// **Parameter** [muted] Determines whether to receive/stop receiving all remote video streams:
  /// - `true`: Stop receiving all remote video streams.
  /// - `false`: (Default) Receive all remote video streams.
  Future<void> muteAllRemoteVideoStreams(bool muted);

  /// Sets whether to receive all remote video streams by default.
  ///
  /// **Parameter** [muted] Determines whether to receive/stop receiving all remote video streams by default:
  /// - `true`: Stop receiving all remote video streams by default.
  /// - `false`: (Default) Receive all remote video streams by default.
  Future<void> setDefaultMuteAllRemoteVideoStreams(bool muted);
}

mixin RtcDualStreamInterface {
  /// Sets the video stream type of the remote video stream when the remote user sends dual streams.
  ///
  /// This method allows the app to adjust the corresponding video-stream type based on the size of the video window to reduce the bandwidth and resources.
  /// - If the remote user enables the dual-stream mode by calling the [RtcEngine.enableDualStreamMode] method, the SDK receives the high-video stream by default. You can use this method to switch to the low-video stream.
  /// - If dual-stream mode is not enabled, the SDK receives the high-stream video by default.
  /// By default, the aspect ratio of the low-video stream is the same as the high-video stream. Once the resolution of the high-video stream is set, the system automatically sets the resolution, frame rate, and bitrate of the low-video stream.
  ///
  /// **Parameter** [uid] ID of the remote user sending the video stream.
  ///
  /// **Parameter** [streamType] Sets the video-stream type. See [VideoStreamType].
  Future<void> setRemoteVideoStreamType(String uid, VideoStreamType streamType);

  /// Sets the default video-stream type of the remote video stream when the remote user sends dual streams.
  /// **Parameter** [streamType] Sets the default video-stream type. See [VideoStreamType].
  Future<void> setRemoteDefaultVideoStreamType(VideoStreamType streamType);
}