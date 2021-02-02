import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import './src/enums.dart';
import './src/rtc_render_view.dart';

/// (Android only) SurfaceView.
///
/// Please use [UIView](https://developer.apple.com/documentation/uikit/uiview) for iOS.
class SurfaceView extends RtcSurfaceView {
  /// Constructs a [SurfaceView]
  SurfaceView({
    Key key,
    @required String uid,
    VideoRenderMode renderMode = VideoRenderMode.Hidden,
    String channelId,
    VideoMirrorMode mirrorMode = VideoMirrorMode.Auto,
    Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers,
    PlatformViewCreatedCallback onPlatformViewCreated,
  })  : assert(uid != "0"),
        super(
          key: key,
          uid: uid,
          renderMode: renderMode,
          channelId: channelId,
          mirrorMode: mirrorMode,
          gestureRecognizers: gestureRecognizers,
          onPlatformViewCreated: onPlatformViewCreated,
        );

}

