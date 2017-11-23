//
//
//                        _____
//                       / ___/____  ____  ____ _
//                       \__ \/ __ \/ __ \/ __ `/
//                      ___/ / /_/ / / / / /_/ /
//                     /____/\____/_/ /_/\__, /
//                                      /____/
//
//                .-~~~~~~~~~-._       _.-~~~~~~~~~-.
//            __.'              ~.   .~              `.__
//          .'//                  \./                  \\`.
//        .'//                     |                     \\`.
//      .'// .-~"""""""~~~~-._     |     _,-~~~~"""""""~-. \\`.
//    .'//.-"                 `-.  |  .-'                 "-.\\`.
//  .'//______.============-..   \ | /   ..-============.______\\`.
//.'______________________________\|/______________________________`.
//
//
//  LifeCycleable.swift
//  DeeplinkNavigator
//
//  Created by song on 2017/7/15.
//  Copyright © 2017年 Hanguang. All rights reserved.
//

import UIKit

//MARK: - 内部使用加了生命周期 外界不用调用

public protocol LifeCycleable : class {
    
    var navigation:DeeplinkNavigation?{ get set }
    
    /*! 会在ViewController中调用super.viewDidLoad()时调用 */
    func navigationLoad(parameter: [String: Any]?,needRequest:Bool)
}

private var navigationKey: Void?

public extension LifeCycleable {
    
    public var navigation:DeeplinkNavigation?{
        get{
            return objc_getAssociatedObject(self, &navigationKey) as? DeeplinkNavigation
        }
        set(newValue){
            objc_setAssociatedObject(self, &navigationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

