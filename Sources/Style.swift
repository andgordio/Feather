//
//  SwiftUIView.swift
//  
//
//  Created by Andriy Gordiyenko on 4/30/23.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct Style: ViewModifier {
    var params: [StyleParam]
    func body (content: Content) -> some View {
        if params.count > 0 {
            var tempParams = params
            let first = tempParams.removeFirst()
            content.modifier(StyleModifier(param: first)).style(tempParams)
        } else {
            content
        }
    }
}

@available(iOS 13.0.0, *)
extension View {
    func style(_ params: StyleParam...) -> some View {
        self.modifier(Style(params: params))
    }
    func style(_ params: [StyleParam]) -> some View {
        self.modifier(Style(params: params))
    }
}

@available(iOS 13.0.0, *)
struct StyleModifier: ViewModifier {
    let param: StyleParam
    func body (content: Content) -> some View {
        switch param {
        case .w(let i): content.frame(width: i)
        case .wFull: content.frame(maxWidth: .infinity)
        case .h(let i): content.frame(height: i)
        case .hFull: content.frame(maxHeight: .infinity)
        case .p(let i): content.padding(i)
        case .ph(let i): content.padding(.horizontal, i)
        case .pv(let i): content.padding(.vertical, i)
        case .pt(let i): content.padding(.top, i)
        case .pb(let i): content.padding(.bottom, i)
        case .pl(let i): content.padding(.leading, i)
        case .ptr(let i): content.padding(.trailing, i)
        case .bg(let c): content.background(c)
        case .fg(let c): content.foregroundColor(c)
        case .font(let s): content.font(.system(size: s))
        case .rounded(let r): content.cornerRadius(r)
        }
    }
}

@available(iOS 13.0.0, *)
enum StyleParam {
    // Frame
    case w(CGFloat)
    case wFull
    case h(CGFloat)
    case hFull
    // Paddings
    case p(CGFloat = 20)
    case ph(CGFloat = 20)
    case pv(CGFloat = 20)
    case pt(CGFloat = 20)
    case pb(CGFloat = 20)
    case pl(CGFloat = 20)
    case ptr(CGFloat = 20)
    // Colors
    case bg(Color = .blue)
    case fg(Color = .red)
    // Text
    case font(CGFloat = 15)
    // Other
    case rounded(CGFloat = 10)
    // case stroke(CGFloat)
}
