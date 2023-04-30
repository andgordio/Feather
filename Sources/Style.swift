//
//  SwiftUIView.swift
//  
//
//  Created by Andriy Gordiyenko on 4/30/23.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct Style: ViewModifier {
    var params: [StyleParam]
    public func body (content: Content) -> some View {
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
public extension View {
    func style(_ params: StyleParam...) -> some View {
        self.modifier(Style(params: params))
    }
    func style(_ params: [StyleParam]) -> some View {
        self.modifier(Style(params: params))
    }
}

@available(iOS 13.0.0, *)
public struct StyleModifier: ViewModifier {
    let param: StyleParam
    public func body (content: Content) -> some View {
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
            
        case .width(let i): content.frame(width: i)
        case .widthInfinity: content.frame(maxWidth: .infinity)
        case .height(let i): content.frame(height: i)
        case .heightInfinity: content.frame(maxHeight: .infinity)
        case .padding(let i): content.padding(i)
        case .paddingHorizontal(let i): content.padding(.horizontal, i)
        case .paddingVertical(let i): content.padding(.vertical, i)
        case .paddingTop(let i): content.padding(.top, i)
        case .paddingBottom(let i): content.padding(.bottom, i)
        case .paddingLeading(let i): content.padding(.leading, i)
        case .paddingTrailing(let i): content.padding(.trailing, i)
        case .backgroundColor(let c): content.background(c)
        case .foregroundColor(let c): content.foregroundColor(c)
        case .fontSize(let s): content.font(.system(size: s))
        case .cornerRadius(let r): content.cornerRadius(r)
        }
    }
}

@available(iOS 13.0.0, *)
public enum StyleParam {
    
    /*
     OPTION A
     Short names
     */
    
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
    
    /*
     OPTION B
     Aligned with SwiftUI names
     */
    
    // Frame
    case width(CGFloat)
    case widthInfinity
    case height(CGFloat)
    case heightInfinity
    
    // Paddings
    case padding(CGFloat = 20)
    case paddingHorizontal(CGFloat = 20)
    case paddingVertical(CGFloat = 20)
    case paddingTop(CGFloat = 20)
    case paddingBottom(CGFloat = 20)
    case paddingLeading(CGFloat = 20)
    case paddingTrailing(CGFloat = 20)
    
    // Colors
    case backgroundColor(Color = .blue)
    case foregroundColor(Color = .red)
    
    // Text
    case fontSize(CGFloat = 15)
    
    // Other
    case cornerRadius(CGFloat = 10)
}
