import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import './src/enums.dart';
import './src/rtc_render_view.dart';

/// SurfaceView.
class SurfaceView extends RtcSurfaceView {
  /// Constructs a [SurfaceView]
  SurfaceView({
    Key? key,
    required String? uid,
    String? channelId,
    renderMode = VideoRenderMode.Hidden,
    mirrorMode = VideoMirrorMode.Auto,

    PlatformViewCreatedCallback? onPlatformViewCreated,
    Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers,
  })  : assert(uid != "0"),
        super(
          key: key,
          uid: uid,
          channelId: channelId,
          renderMode: renderMode,
          mirrorMode: mirrorMode,
          onPlatformViewCreated: onPlatformViewCreated,
          gestureRecognizers: gestureRecognizers,
        );
}

