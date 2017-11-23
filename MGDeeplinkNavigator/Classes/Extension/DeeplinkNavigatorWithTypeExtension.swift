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
//  DeeplinkNavigatorWithTypeExtension.swift
//  DeeplinkNavigator
//
//  Created by song on 2017/7/26.
//  Copyright © 2017年 Hanguang. All rights reserved.
//

import UIKit

public extension DeeplinkNavigator {
    @discardableResult
    public func pushOrPopTo(
        _ navigable: DeeplinkNavigable.Type,
        context: NavigationContext? = nil,
        from: DeeplinkPushable? = nil,
        animated: Bool = true
        ) -> UIViewController? {
        if let url = url(navigable) {
            return pushOrPopTo(url, context: context, from: from, animated: animated)
        }
        return nil
    }
    
    
    @discardableResult
    public func push(
        _ navigable: DeeplinkNavigable.Type,
        context: NavigationContext? = nil,
        from: DeeplinkPushable? = nil,
        animated: Bool = true
        ) -> UIViewController? {
        if let url = url(navigable) {
            return push(url, context: context, from: from, animated: animated)
        }
        return nil
    }
    
    
    @discardableResult
    public func popTo(
        _ navigable: DeeplinkNavigable.Type,
        context: NavigationContext? = nil,
        from: DeeplinkPushable? = nil,
        animated: Bool = true
        ) -> UIViewController?{
        if let url = url(navigable) {
            return popTo(url, context: context, from: from, animated: animated)
        }
        return nil
    }
    
    @discardableResult
    public func reloadTo(
        _ navigable: DeeplinkNavigable.Type,
        context: NavigationContext? = nil,
        from: DeeplinkPushable? = nil
        ) -> UIViewController? {
        if let url = url(navigable) {
            return reloadTo(url, context: context, from: from)
        }
        return nil
    }
    
    
    @discardableResult
    public func present(
        _ navigable: DeeplinkNavigable.Type,
        context: NavigationContext? = nil,
        wrap: Bool = false,
        from: DeeplinkPresentable? = nil,
        animated: Bool = true,
        completion: (() -> Void)? = nil
        ) -> UIViewController? {
        if let url = url(navigable) {
            return present(url, context: context, wrap: wrap, from: from, animated: animated, completion: completion)
        }
        return nil
    }
    
    public func url(_ navigable:DeeplinkNavigable.Type) -> String?{
        let dict = self.urlMap.first{ $1.navigable == navigable }
        return dict?.key
    }
    
}
