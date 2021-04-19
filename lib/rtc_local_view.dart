import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import './src/enums.dart';
import './src/rtc_render_view.dart';

/// SurfaceView.
class SurfaceView extends RtcSurfaceView {
  /// Constructs a [SurfaceView]
  SurfaceView({
    Key? key,
    String? channelId,
    renderMode = VideoRenderMode.Hidden,
    mirrorMode = VideoMirrorMode.Auto,
    PlatformViewCreatedCallback? onPlatformViewCreated,
    Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers,
  }) : super(
          key: key,

          channelId: channelId,
          renderMode: renderMode,
          mirrorMode: mirrorMode,
       
          onPlatformViewCreated: onPlatformViewCreated,
          gestureRecognizers: gestureRecognizers,
          uid: "0"
        );
}



