package org.ar.rtc.base

import android.content.Context
import android.view.TextureView
import android.widget.RelativeLayout
import org.ar.rtc.RtcEngine

class RtcMediaPlayerView(context:Context):RelativeLayout(context){

    private var texture: TextureView

    init {
        try {
            texture = RtcEngine.CreateRendererView(context)
        } catch (e: UnsatisfiedLinkError) {
            throw RuntimeException("Please init RtcEngine first!")
        }

        addView(texture,LayoutParams(LayoutParams.WRAP_CONTENT,LayoutParams.WRAP_CONTENT).apply {
            addRule(CENTER_IN_PARENT)
        })
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val width: Int = MeasureSpec.getSize(widthMeasureSpec)
        val height: Int = MeasureSpec.getSize(heightMeasureSpec)
        texture.layout(0, 0, width, height)
        super.onMeasure(widthMeasureSpec, heightMeasureSpec)
    }

    fun getSurface():TextureView{
        return texture
    }

}