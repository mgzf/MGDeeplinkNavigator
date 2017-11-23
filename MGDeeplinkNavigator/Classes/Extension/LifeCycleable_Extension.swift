//
//  LifeCycleable_Extension.swift
//  MogoRenter
//
//  Created by song on 2017/8/28.
//  Copyright © 2017年 MogoRoom. All rights reserved.
//

import Foundation

//MARK: - Init方法初始化 InitLifeCycleable可以接在ViewController的头上

public protocol InitLifeCycleable : LifeCycleable, InitNavigable{
    
}

//MARK: - Xib方法初始化 XibLifeCycleable可以接在ViewController的头上 如果使用默认初始化必须保证Identifier为类名

public protocol XibLifeCycleable : LifeCycleable, XibNavigable{
    
}

//MARK: - Storyboard方法初始化 StoryboardLifeCycleable可以接在ViewController的头上

public protocol StoryboardLifeCycleable : LifeCycleable, StoryboardNavigable{
    
    static func viewControllerFromStoryBoard(navigation: DeeplinkNavigation) -> UIViewController?
}

extension InitLifeCycleable  where Self : UIViewController {
    
    public init?(navigation: DeeplinkNavigation) {
        self.init()
        self.navigation = navigation
    }
}

extension XibLifeCycleable  where Self : UIViewController {
    
    public static func viewControllerFromXib(navigation: DeeplinkNavigation) -> UIViewController?{
        let vc = self.init(nibName: String(describing: self), bundle: nil)
        vc.navigation = navigation
        return  vc
    }
}

