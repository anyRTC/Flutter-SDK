package org.ar.rtc.base

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Color
import android.view.Gravity
import android.view.TextureView
import android.widget.FrameLayout
import android.widget.RelativeLayout
import org.ar.rtc.Constants
import org.ar.rtc.RtcChannel
import org.ar.rtc.RtcEngine
import org.ar.rtc.video.VideoCanvas
import org.webrtc.EglRenderer
import org.webrtc.TextureViewRenderer
import java.lang.ref.WeakReference
import java.util.logging.Handler

class RtcTextureView(
        context: Context
) : RelativeLayout(context) {
    private var texture: TextureView
    private var canvas: VideoCanvas
    private var channel: WeakReference<RtcChannel>? = null
    private var engine: RtcEngine? = null

    init {
        try {
            texture = RtcEngine.CreateRendererView(context)
        } catch (e: UnsatisfiedLinkError) {
            throw RuntimeException("Please init RtcEngine first!")
        }
        canvas = VideoCanvas(texture)
        setBackgroundColor(Color.BLACK)
//        addView(texture)
        addView(texture,LayoutParams(LayoutParams.WRAP_CONTENT,LayoutParams.WRAP_CONTENT).apply {
            gravity = Gravity.CENTER
        })

    }


    fun setData(engine: RtcEngine, channel: RtcChannel?, uid: String?) {
        this.engine=engine
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
        texture.layout(0, 0, width, height)
        super.onMeasure(widthMeasureSpec, heightMeasureSpec)
    }
}
