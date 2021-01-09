import 'package:flutter/foundation.dart';

import 'package:flutter/widgets.dart';

/// Use SurfaceView in Android.
///
/// Use [UIView](https://developer.apple.com/documentation/uikit/uiview) in iOS.
class RtcMediaPlayerView extends StatefulWidget {

  RtcMediaPlayerView();

  @override
  State<StatefulWidget> createState() {
    return _RtcMediaPlayerViewState();
  }
}

class _RtcMediaPlayerViewState extends State<RtcMediaPlayerView> {

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {

    } else if (defaultTargetPlatform == TargetPlatform.iOS) {

      return UiKitView(
          viewType: "ArMediaPlayerView");
    }
    return Text('$defaultTargetPlatform is not yet supported by the plugin');
  }

}