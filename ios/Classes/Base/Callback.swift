//
//  Callback.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2020/10/29.
//

import Foundation
import ARtcKit

@objc
protocol Callback: class {
    func success(_ data: Any?)

    func failure(_ code: String, _ message: String)
}

extension Callback {
    func code(_ code: Int32?, _ runnable: ((Int32) -> Any?)? = nil) {
        if code == nil || code! < 0 {
            let newCode = abs(Int(code ?? Int32(ARErrorCode.notInitialized.rawValue)))
            failure(String(newCode), ARtcEngineKit.getErrorDescription(newCode) ?? "")
            return
        }

        let res = runnable?(code!)
        if res is Void {
            success(nil)
        } else {
            success(res)
        }
    }

    func resolve<T>(_ source: T?, _ runnable: (T) -> Any?) {
        guard let `source` = source else {
            let code = ARErrorCode.notInitialized.rawValue
            failure(String(code), ARtcEngineKit.getErrorDescription(code) ?? "")
            return
        }

        let res = runnable(source)
        if res is Void {
            success(nil)
        } else {
            success(res)
        }
    }
}
