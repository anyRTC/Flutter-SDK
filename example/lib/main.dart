import 'dart:async';
import 'package:ar_rtc_engine/rtc_engine.dart';
//import 'package:ar_rtc_engine/rtc_stream_kit.dart';
//import 'package:ar_rtc_engine/rtc_media_player.dart';
import 'package:ar_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:ar_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:ar_rtc_engine/rtc_player_view.dart' as RtcMediaPlayerView;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _joined = false;
  String _remoteUid = "";
  bool _switch = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await [Permission.camera, Permission.microphone, Permission.storage]
        .request();
    ///* AppID * anyRTC 为 App 开发者签发的 App ID。每个项目都应该有一个独一无二的 App ID。如果你的开发包里没有 App ID，请从anyRTC官网(https://www.anyrtc.io)申请一个新的 App ID
    var engine = await RtcEngine.create('YOU_APP_ID');
    //var streamKit = await StreamKit.create();
    engine.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, String uid, int elapsed) {
          print('joinChannelSuccess ${channel} ${uid}');
          setState(() {
            _joined = true;
          });
        }, userJoined: (String uid, int elapsed) {
      print('userJoined ${uid}');
      setState(() {
        _remoteUid = uid;
      });
    }, userOffline: (String uid, UserOfflineReason reason) {
      print('userOffline ${uid}');
      setState(() {
        _remoteUid = null;
      });
    }));
    await engine.enableVideo();
    await engine.joinChannel(null, '909090', "0");
    //streamKit.pushStream("rtmp://push.ali.teameeting.cn/anyrtc/123456789");
    // var player = await RtcMediaPlayer.create();
    // player.open("http://vfx.mtime.cn/Video/2019/03/19/mp4/190319222227698228.mp4",0);
    // player.play();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Stack(
          children: [
            Center(
              child: _switch ? _renderRemoteVideo() : _renderLocalPreview(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _switch = !_switch;
                    });
                  },
                  child: Center(
                    child:
                    _switch ? _renderLocalPreview() : _renderRemoteVideo(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderLocalPreview() {
    if (_joined) {
      return RtcLocalView.SurfaceView(renderMode: VideoRenderMode.Hidden);
    } else {
      return Text(
        'Please join channel first',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _renderRemoteVideo() {
    if (_remoteUid != "") {
      return RtcRemoteView.SurfaceView(uid: _remoteUid);
    } else {
      return Text(
        'Please wait remote user join',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _mediaPlayerVideo() {
      return RtcMediaPlayerView.MediaPlayerView();
  }
}
