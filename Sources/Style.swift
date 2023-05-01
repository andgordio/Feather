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
            
            
        case .bgBlue: content.background(Color.blue)
        case .bgGreen: content.background(Color.green)
        case .bgRed: content.background(Color.red)
        case .bgPink: content.background(Color.pink)
        case .bgYellow: content.background(Color.yellow)
        case .bgClear: content.background(Color.clear)
        case .bgOrange: content.background(Color.orange)
        case .bgPrimary: content.background(Color.primary)
        case .bgSecondary: content.background(Color.secondary)
        case .bgWhite: content.background(Color.white)
        case .bgBlack: content.background(Color.black)
        case .bgGray: content.background(Color.gray)
        case .bgAccent: content.background(Color.accentColor)
        case .bgPurple: content.background(Color.purple)
            
        
        case .fgBlue: content.foregroundColor(Color.blue)
        case .fgGreen: content.foregroundColor(Color.green)
        case .fgRed: content.foregroundColor(Color.red)
        case .fgPink: content.foregroundColor(Color.pink)
        case .fgYellow: content.foregroundColor(Color.yellow)
        case .fgClear: content.foregroundColor(Color.clear)
        case .fgOrange: content.foregroundColor(Color.orange)
        case .fgPrimary: content.foregroundColor(Color.primary)
        case .fgSecondary: content.foregroundColor(Color.secondary)
        case .fgWhite: content.foregroundColor(Color.white)
        case .fgBlack: content.foregroundColor(Color.black)
        case .fgGray: content.foregroundColor(Color.gray)
        case .fgAccent: content.foregroundColor(Color.accentColor)
        case .fgPurple: content.foregroundColor(Color.purple)
            
        case .font3XS: content.font(.system(size: 9))
        case .font2XS: content.font(.system(size: 11))
        case .fontXS: content.font(.system(size: 13))
        case .fontS: content.font(.system(size: 15))
        case .fontM: content.font(.system(size: 17))
        case .fontL: content.font(.system(size: 21))
        case .fontXL: content.font(.system(size: 25))
        case .font2XL: content.font(.system(size: 32))
        case .font3XL: content.font(.system(size: 40))
            
        case .roundedXS: content.cornerRadius(4)
        case .roundedS: content.cornerRadius(8)
        case .roundedM: content.cornerRadius(12)
        case .roundedL: content.cornerRadius(16)
        case .roundedXL: content.cornerRadius(20)
        case .roundedFull: content.cornerRadius(9999)
            
            
        }
    }
}

@available(iOS 13.0.0, *)
public enum StyleParam {
    
    case w(CGFloat)
    case wFull
    case h(CGFloat)
    case hFull
    
    case p(CGFloat = 20)
    case ph(CGFloat = 20)
    case pv(CGFloat = 20)
    case pt(CGFloat = 20)
    case pb(CGFloat = 20)
    case pl(CGFloat = 20)
    case ptr(CGFloat = 20)
    
    case bg(Color = .blue)
    case fg(Color = .red)
    
    case font(CGFloat = 15)
    
    case rounded(CGFloat = 10)
    

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
    
    
    case bgBlue
    case bgGreen
    case bgRed
    case bgPink
    case bgYellow
    case bgClear
    case bgOrange
    case bgPrimary
    case bgSecondary
    case bgWhite
    case bgBlack
    case bgGray
    case bgAccent
    case bgPurple
    
    case fgBlue
    case fgGreen
    case fgRed
    case fgPink
    case fgYellow
    case fgClear
    case fgOrange
    case fgPrimary
    case fgSecondary
    case fgWhite
    case fgBlack
    case fgGray
    case fgAccent
    case fgPurple
    
    case font3XS
    case font2XS
    case fontXS
    case fontS
    case fontM
    case fontL
    case fontXL
    case font2XL
    case font3XL
    
    case roundedXS
    case roundedS
    case roundedM
    case roundedL
    case roundedXL
    case roundedFull
    
}

