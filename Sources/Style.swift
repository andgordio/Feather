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
            
//        case .p(let i): content.padding(i)
//        case .ph(let i): content.padding(.horizontal, i)
//        case .pv(let i): content.padding(.vertical, i)
//        case .pt(let i): content.padding(.top, i)
//        case .pb(let i): content.padding(.bottom, i)
//        case .pl(let i): content.padding(.leading, i)
//        case .ptr(let i): content.padding(.trailing, i)
            
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
            
        case .p: content.padding(20)
        case .ph: content.padding(.horizontal, 20)
        case .pv: content.padding(.vertical, 20)
        case .pt: content.padding(.top, 20)
        case .pb: content.padding(.bottom, 20)
        case .pl: content.padding(.leading, 20)
        case .ptr: content.padding(.trailing, 20)
            
        case .p2: content.padding(4)
        case .ph2: content.padding(.horizontal, 4)
        case .pv2: content.padding(.vertical, 4)
        case .pt2: content.padding(.top, 4)
        case .pb2: content.padding(.bottom, 4)
        case .pl2: content.padding(.leading, 4)
        case .ptr2: content.padding(.trailing, 4)
            
        case .p4: content.padding(8)
        case .ph4: content.padding(.horizontal, 8)
        case .pv4: content.padding(.vertical, 8)
        case .pt4: content.padding(.top, 8)
        case .pb4: content.padding(.bottom, 8)
        case .pl4: content.padding(.leading, 8)
        case .ptr4: content.padding(.trailing, 8)
            
        case .p6: content.padding(12)
        case .ph6: content.padding(.horizontal, 12)
        case .pv6: content.padding(.vertical, 12)
        case .pt6: content.padding(.top, 12)
        case .pb6: content.padding(.bottom, 12)
        case .pl6: content.padding(.leading, 12)
        case .ptr6: content.padding(.trailing, 12)
            
        case .p8: content.padding(16)
        case .ph8: content.padding(.horizontal, 16)
        case .pv8: content.padding(.vertical, 16)
        case .pt8: content.padding(.top, 16)
        case .pb8: content.padding(.bottom, 16)
        case .pl8: content.padding(.leading, 16)
        case .ptr8: content.padding(.trailing, 16)
            
        case .p10: content.padding(20)
        case .ph10: content.padding(.horizontal, 20)
        case .pv10: content.padding(.vertical, 20)
        case .pt10: content.padding(.top, 20)
        case .pb10: content.padding(.bottom, 20)
        case .pl10: content.padding(.leading, 20)
        case .ptr10: content.padding(.trailing, 20)
            
        case .p12: content.padding(24)
        case .ph12: content.padding(.horizontal, 24)
        case .pv12: content.padding(.vertical, 24)
        case .pt12: content.padding(.top, 24)
        case .pb12: content.padding(.bottom, 24)
        case .pl12: content.padding(.leading, 24)
        case .ptr12: content.padding(.trailing, 24)
            
        case .p16: content.padding(32)
        case .ph16: content.padding(.horizontal, 32)
        case .pv16: content.padding(.vertical, 32)
        case .pt16: content.padding(.top, 32)
        case .pb16: content.padding(.bottom, 32)
        case .pl16: content.padding(.leading, 32)
        case .ptr16: content.padding(.trailing, 32)
            
        case .p20: content.padding(40)
        case .ph20: content.padding(.horizontal, 40)
        case .pv20: content.padding(.vertical, 40)
        case .pt20: content.padding(.top, 40)
        case .pb20: content.padding(.bottom, 40)
        case .pl20: content.padding(.leading, 40)
        case .ptr20: content.padding(.trailing, 40)
        }
    }
}

@available(iOS 13.0.0, *)
public enum StyleParam {
    
    // MARK: - OPTION A: Short names
    
    // Frame
    case w(CGFloat)
    case wFull
    case h(CGFloat)
    case hFull
    
    // Paddings
//    case p(CGFloat = 20)
//    case ph(CGFloat = 20)
//    case pv(CGFloat = 20)
//    case pt(CGFloat = 20)
//    case pb(CGFloat = 20)
//    case pl(CGFloat = 20)
//    case ptr(CGFloat = 20)
    
    // Colors
    case bg(Color = .blue)
    case fg(Color = .red)
    
    // Text
    case font(CGFloat = 15)
    
    // Other
    case rounded(CGFloat = 10)
    
    
    // MARK: - OPTION B: Aligned with SwiftUI names
    
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
    
    
    // MARK: - OPTION C: Built-in values
    
    case p
    case ph
    case pv
    case pt
    case pb
    case pl
    case ptr
    
    case p2
    case ph2
    case pv2
    case pt2
    case pb2
    case pl2
    case ptr2
    
    case p4
    case ph4
    case pv4
    case pt4
    case pb4
    case pl4
    case ptr4
    
    case p6
    case ph6
    case pv6
    case pt6
    case pb6
    case pl6
    case ptr6
    
    case p8
    case ph8
    case pv8
    case pt8
    case pb8
    case pl8
    case ptr8
    
    case p10
    case ph10
    case pv10
    case pt10
    case pb10
    case pl10
    case ptr10
    
    case p12
    case ph12
    case pv12
    case pt12
    case pb12
    case pl12
    case ptr12
    
    case p16
    case ph16
    case pv16
    case pt16
    case pb16
    case pl16
    case ptr16
    
    case p20
    case ph20
    case pv20
    case pt20
    case pb20
    case pl20
    case ptr20
}

@available(iOS 13.0.0, *) public let p: StyleParam = .p
@available(iOS 13.0.0, *) public let pv: StyleParam = .pv
@available(iOS 13.0.0, *) public let ph: StyleParam = .ph
@available(iOS 13.0.0, *) public let pt: StyleParam = .pt
@available(iOS 13.0.0, *) public let pb: StyleParam = .pb
@available(iOS 13.0.0, *) public let pl: StyleParam = .pl
@available(iOS 13.0.0, *) public let ptr: StyleParam = .ptr

@available(iOS 13.0.0, *) public let p2: StyleParam = .p2
@available(iOS 13.0.0, *) public let pv2: StyleParam = .pv2
@available(iOS 13.0.0, *) public let ph2: StyleParam = .ph2
@available(iOS 13.0.0, *) public let pt2: StyleParam = .pt2
@available(iOS 13.0.0, *) public let pb2: StyleParam = .pb2
@available(iOS 13.0.0, *) public let pl2: StyleParam = .pl2
@available(iOS 13.0.0, *) public let ptr2: StyleParam = .ptr2

@available(iOS 13.0.0, *) public let p4: StyleParam = .p4
@available(iOS 13.0.0, *) public let pv4: StyleParam = .pv4
@available(iOS 13.0.0, *) public let ph4: StyleParam = .ph4
@available(iOS 13.0.0, *) public let pt4: StyleParam = .pt4
@available(iOS 13.0.0, *) public let pb4: StyleParam = .pb4
@available(iOS 13.0.0, *) public let pl4: StyleParam = .pl4
@available(iOS 13.0.0, *) public let ptr4: StyleParam = .ptr4

@available(iOS 13.0.0, *) public let p6: StyleParam = .p6
@available(iOS 13.0.0, *) public let pv6: StyleParam = .pv6
@available(iOS 13.0.0, *) public let ph6: StyleParam = .ph6
@available(iOS 13.0.0, *) public let pt6: StyleParam = .pt6
@available(iOS 13.0.0, *) public let pb6: StyleParam = .pb6
@available(iOS 13.0.0, *) public let pl6: StyleParam = .pl6
@available(iOS 13.0.0, *) public let ptr6: StyleParam = .ptr6

@available(iOS 13.0.0, *) public let p8: StyleParam = .p8
@available(iOS 13.0.0, *) public let pv8: StyleParam = .pv8
@available(iOS 13.0.0, *) public let ph8: StyleParam = .ph8
@available(iOS 13.0.0, *) public let pt8: StyleParam = .pt8
@available(iOS 13.0.0, *) public let pb8: StyleParam = .pb8
@available(iOS 13.0.0, *) public let pl8: StyleParam = .pl8
@available(iOS 13.0.0, *) public let ptr8: StyleParam = .ptr8

@available(iOS 13.0.0, *) public let p10: StyleParam = .p10
@available(iOS 13.0.0, *) public let pv10: StyleParam = .pv10
@available(iOS 13.0.0, *) public let ph10: StyleParam = .ph10
@available(iOS 13.0.0, *) public let pt10: StyleParam = .pt10
@available(iOS 13.0.0, *) public let pb10: StyleParam = .pb10
@available(iOS 13.0.0, *) public let pl10: StyleParam = .pl10
@available(iOS 13.0.0, *) public let ptr10: StyleParam = .ptr10

@available(iOS 13.0.0, *) public let p12: StyleParam = .p12
@available(iOS 13.0.0, *) public let pv12: StyleParam = .pv12
@available(iOS 13.0.0, *) public let ph12: StyleParam = .ph12
@available(iOS 13.0.0, *) public let pt12: StyleParam = .pt12
@available(iOS 13.0.0, *) public let pb12: StyleParam = .pb12
@available(iOS 13.0.0, *) public let pl12: StyleParam = .pl12
@available(iOS 13.0.0, *) public let ptr12: StyleParam = .ptr12

@available(iOS 13.0.0, *) public let p16: StyleParam = .p16
@available(iOS 13.0.0, *) public let pv16: StyleParam = .pv16
@available(iOS 13.0.0, *) public let ph16: StyleParam = .ph16
@available(iOS 13.0.0, *) public let pt16: StyleParam = .pt16
@available(iOS 13.0.0, *) public let pb16: StyleParam = .pb16
@available(iOS 13.0.0, *) public let pl16: StyleParam = .pl16
@available(iOS 13.0.0, *) public let ptr16: StyleParam = .ptr16

@available(iOS 13.0.0, *) public let p20: StyleParam = .p20
@available(iOS 13.0.0, *) public let pv20: StyleParam = .pv20
@available(iOS 13.0.0, *) public let ph20: StyleParam = .ph20
@available(iOS 13.0.0, *) public let pt20: StyleParam = .pt20
@available(iOS 13.0.0, *) public let pb20: StyleParam = .pb20
@available(iOS 13.0.0, *) public let pl20: StyleParam = .pl20
@available(iOS 13.0.0, *) public let ptr20: StyleParam = .ptr20
