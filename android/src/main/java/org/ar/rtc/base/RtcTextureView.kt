package org.ar.rtc.base

import android.content.Context
import android.graphics.Color
import android.view.Gravity
import android.view.TextureView
import android.widget.FrameLayout
import android.widget.RelativeLayout
import org.ar.rtc.RtcChannel
import org.ar.rtc.RtcEngine
import org.ar.rtc.mediaio.ARTextureView
import org.ar.rtc.mediaio.MediaIO
import org.ar.rtc.video.VideoCanvas
import org.ar.rtc_engine.ArRtcEnginePlugin
import org.webrtc.TextureViewRenderer
import java.lang.ref.WeakReference

//class RtcTextureView(
//        context: Context
//) : RelativeLayout(context) {
//    private lateinit var texture: TextureView
//    private lateinit var canvas: VideoCanvas
//    private lateinit var localView:ARTextureView
//    private var channel: WeakReference<RtcChannel>? = null
//    private var engine: RtcEngine? = null
//    private var uid:String? = null
//
//    init {
//
//
//    }
//
//
//    fun setData(engine: RtcEngine, channel: RtcChannel?, uid: String?) {
//       this.uid = uid
//        if (uid == "0"){
//            localView = ARTextureView(context)
//            localView.init(null)
//            localView.setBufferType(MediaIO.BufferType.BYTE_ARRAY)
//            localView.setPixelFormat(MediaIO.PixelFormat.I420)
//            localView.setMirror(true)
//            addView(localView,LayoutParams(LayoutParams.WRAP_CONTENT,LayoutParams.WRAP_CONTENT).apply {
//                gravity = Gravity.CENTER
//            })
//        }else{
//            try {
//                texture = RtcEngine.CreateRendererView(context)
//                canvas = VideoCanvas(texture)
//                canvas.channelId = this.channel?.get()?.channelId()
//                canvas.uid = uid
//                addView(texture,LayoutParams(LayoutParams.WRAP_CONTENT,LayoutParams.WRAP_CONTENT).apply {
//                    gravity = Gravity.CENTER
//                })
//            } catch (e: UnsatisfiedLinkError) {
//                throw RuntimeException("Please init RtcEngine first!")
//            }
//        }
//        setBackgroundColor(Color.BLACK)
//        this.engine=engine
//        this.channel = if (channel != null) WeakReference(channel) else null
//
//        setupVideoCanvas(engine)
//
//    }
//
//    fun resetVideoCanvas(engine: RtcEngine) {
////        val canvas = VideoCanvas(null, canvas.renderMode, canvas.channelId, canvas.uid, canvas.mirrorMode)
////        if (canvas.uid == "0") {
////            engine.setupLocalVideo(canvas)
////        } else {
////            engine.setupRemoteVideo(canvas)
////        }
//    }
//
//    private fun setupVideoCanvas(engine: RtcEngine) {
////
////            if (canvas.uid == "0") {
////                android.os.Handler().postDelayed({
////                engine.setupLocalVideo(canvas)
////                    Log.d("1111设置本地视图","1111")
////                },500)
////            } else {
////                engine.setupRemoteVideo(canvas)
////            }
//        if (uid == "0") {
//            engine.setLocalVideoRenderer(localView)
////            engine.setupLocalVideo(canvas)
//        } else {
//            engine.setupRemoteVideo(canvas)
//        }
//
//    }
//
//    fun setRenderMode(engine: RtcEngine, @Annotations.ArVideoRenderMode renderMode: Int) {
//        if (uid=="0"){
//        }else {
//            canvas.renderMode = renderMode
//            setupRenderMode(engine)
//        }
//
//    }
//
//    fun setMirrorMode(engine: RtcEngine, @Annotations.ArVideoMirrorMode mirrorMode: Int) {
//        if (uid == "0"){
//            localView.setMirror(mirrorMode==1)
//        }else {
//            canvas.mirrorMode = mirrorMode
//            setupRenderMode(engine)
//        }
//    }
//
//    private fun setupRenderMode(engine: RtcEngine) {
//        if (uid=="0"){}else {
//            if (canvas.uid == "0") {
//                engine.setLocalRenderMode(canvas.renderMode, canvas.mirrorMode)
//            } else {
//                channel?.get()?.let {
//                    it.setRemoteRenderMode(canvas.uid, canvas.renderMode, canvas.mirrorMode)
//                    return@setupRenderMode
//                }
//                engine.setRemoteRenderMode(canvas.uid, canvas.renderMode, canvas.mirrorMode)
//            }
//        }
//    }
//
//    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
//        val width: Int = MeasureSpec.getSize(widthMeasureSpec)
//        val height: Int = MeasureSpec.getSize(heightMeasureSpec)
//        if (uid=="0") {
//            localView.layout(0, 0, width, height)
//        }else{
//            texture.layout(0, 0, width, height)
//        }
//        super.onMeasure(widthMeasureSpec, heightMeasureSpec)
//    }
//}
class RtcTextureView(
        context: Context
) : RelativeLayout(context) {
    private var texture: TextureView? = null
    private var canvas: VideoCanvas = VideoCanvas(texture)
    private var channel: WeakReference<RtcChannel>? = null


    fun setData(engine: RtcEngine, channel: RtcChannel?, uid: String) {
        this.channel = if (channel != null) WeakReference(channel) else null
        canvas.channelId = this.channel?.get()?.channelId()
        canvas.uid = uid
        setupVideoCanvas(engine)
    }

    fun resetVideoCanvas(engine: RtcEngine) {
        val canvas = VideoCanvas(null, canvas.renderMode, canvas.channelId, canvas.uid, canvas.mirrorMode)
        if (canvas.uid == "0") {
            engine.setupLocalVideo(canvas)
        } else {
            engine.setupRemoteVideo(canvas)
        }
    }

    private fun setupVideoCanvas(engine: RtcEngine) {
        removeAllViews()
        LocalViewManager.videoViewArray.find { it.uid == canvas.uid }?.let {
            it.getView().release()
            LocalViewManager.videoViewArray.remove(it)
        }
        texture = RtcEngine.CreateRendererView(context.applicationContext)
        addView(texture, LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT).apply {
            addRule(CENTER_IN_PARENT)
        })
        setBackgroundColor(Color.BLACK)
        canvas.view = texture
        LocalViewManager.videoViewArray.add(canvas)
        if (canvas.uid == "0") {
            engine.setupLocalVideo(canvas)
        } else {
            engine.setupRemoteVideo(canvas)
        }
    }

    fun setRenderMode(engine: RtcEngine, @Annotations.ArVideoRenderMode renderMode: Int) {
        canvas.renderMode = renderMode
        setupRenderMode(engine)
    }

    fun setMirrorMode(engine: RtcEngine, @Annotations.ArVideoMirrorMode mirrorMode: Int) {
        canvas.mirrorMode = mirrorMode
        setupRenderMode(engine)
    }

    private fun setupRenderMode(engine: RtcEngine) {
        if (canvas.uid == "0") {
            engine.setLocalRenderMode(canvas.renderMode, canvas.mirrorMode)
        } else {
            channel?.get()?.let {
                it.setRemoteRenderMode(canvas.uid, canvas.renderMode, canvas.mirrorMode)
                return@setupRenderMode
            }
            engine.setRemoteRenderMode(canvas.uid, canvas.renderMode, canvas.mirrorMode)
        }
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val width: Int = MeasureSpec.getSize(widthMeasureSpec)
        val height: Int = MeasureSpec.getSize(heightMeasureSpec)
        texture?.layout(0, 0, width, height)
        super.onMeasure(widthMeasureSpec, heightMeasureSpec)
    }
}
