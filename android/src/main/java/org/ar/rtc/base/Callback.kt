package org.ar.rtc.base

import org.ar.rtc.Constants
import org.ar.rtc.RtcEngine
import kotlin.math.abs

abstract class Callback {
    fun code(code: Int?, runnable: ((Int) -> Any?)? = null) {
        if (code == null || code < 0) {
            val newCode = abs(code ?: Constants.ERR_NOT_INITIALIZED)
            failure(newCode.toString(), "msg")
            return
        }

        val res = if (runnable != null) runnable(code) else Unit
        if (res is Unit) {
            success(null)
        } else {
            success(res)
        }
    }

    fun <T> resolve(source: T?, runnable: (T) -> Any?) {
        if (source == null) {
            val code = Constants.ERR_NOT_INITIALIZED
            failure(code.toString(), "msg")
            return
        }

        val res = runnable(source)
        if (res is Unit) {
            success(null)
        } else {
            success(res)
        }
    }

    abstract fun success(data: Any?)

    abstract fun failure(code: String, message: String)
}
