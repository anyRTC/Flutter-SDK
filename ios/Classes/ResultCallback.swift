//
//  ResultCallback.swift
//  ar_rtc_engine
//
//  Created by 余生丶 on 2020/10/29.
//

import UIKit

class ResultCallback: NSObject, Callback {
    private var result: FlutterResult?

    init(_ result: FlutterResult?) {
        self.result = result
    }

    func success(_ data: Any?) {
        result?(data)
    }

    func failure(_ code: String, _ message: String) {
        result?(FlutterError.init(code: code, message: message, details: nil))
    }
}
