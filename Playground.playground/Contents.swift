//: Playground - noun: a place where people can play

import Foundation



let x = ""
let f = "，"

private let bBreak = "(?:\\r\\n|\\r|\\n)"

private let safeIn = "\\xFF0C\\x21\\x22\\x24-\\x2b\\x2d-\\x39\\x3b-\\x5a\\x5c\\x5e-\\x7a" + "\\x7c\\x7e\\x85\\xa0-\\ud7ff\\ue000-\\ufefe\\uff00\\ufffd" + "\\U00010000-\\U0010ffff"
// with flow indicators: `,`, `[`, `]`, `{`, `}`
private let safeOut = "\\x2c\\x5b\\x5d\\x7b\\x7d" + safeIn

private let plainInPattern = "([\(safeIn)]#|:(?![ \\t]|\(bBreak))|[\(safeIn)]|[ \\t]|\(bBreak))+"

let p = "^\(plainInPattern)"
let e = try! NSRegularExpression(pattern: "，", options: [])


func matchRange (_ string: String, regex: NSRegularExpression) -> NSRange {
    let sr = NSMakeRange(0, 1)
    print(sr)
    let pp = regex.firstMatch(in: f, options: [], range: sr)
    print(pp)
    return regex.rangeOfFirstMatch(in: string, options: [], range: sr)
}
let res = matchRange(f, regex: e).location != NSNoTopLevelContainersSpecifierError
print(res)
