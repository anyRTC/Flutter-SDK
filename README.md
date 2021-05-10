# ar_rtc_engine

## 此 Flutter 插件 是对 anyRTC 音视频 SDK 的封装。

您可以集成此 SDK 以便在您自己的应用程序中快速实现实时通信。


## 快速开始
参阅 example 目录，这是一个一对一视频聊天的示例。

## 设备权限
SDK 需要 摄像头 和 麦克风 权限来开始视频通话。

Android
打开 AndroidManifest.xml 文件并且添加必备的权限到此文件中.

```
<manifest>
    ...
    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

    <!-- The SDK requires Bluetooth permissions in case users are using Bluetooth devices.-->
    <uses-permission android:name="android.permission.BLUETOOTH" />
    ...
</manifest>
```
