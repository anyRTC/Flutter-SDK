import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import './src/enums.dart';
import './src/rtc_render_view.dart';

/// (Android only) SurfaceView.
///
/// Please use [UIView](https://developer.apple.com/documentation/uikit/uiview) for iOS.

/// (Android only) TextureView.
class TextureView extends RtcTextureView {
  /// Constructs a [TextureView]
  TextureView({
    Key key,
    VideoRenderMode renderMode = VideoRenderMode.Hidden,
    String channelId,
    VideoMirrorMode mirrorMode = VideoMirrorMode.Auto,
    Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers,
    PlatformViewCreatedCallback onPlatformViewCreated,
  }) : super(
            key: key,
            renderMode: renderMode,
            channelId: channelId,
            mirrorMode: mirrorMode,
            gestureRecognizers: gestureRecognizers,
            onPlatformViewCreated: onPlatformViewCreated,
            uid: "0");
}
