//
//  LifeCycleable_Extension.swift
//  MogoRenter
//
//  Created by song on 2017/8/28.
//  Copyright © 2017年 MogoRoom. All rights reserved.
//

import Foundation

//MARK: - Init方法初始化 InitLifeCycleable可以接在ViewController的头上

public protocol MGInitLifeCycleable : MGLifeCycleable, InitNavigable{
    
}

//MARK: - Xib方法初始化 XibLifeCycleable可以接在ViewController的头上 如果使用默认初始化必须保证Identifier为类名

public protocol MGXibLifeCycleable : MGLifeCycleable, XibNavigable{
    
}

//MARK: - Storyboard方法初始化 StoryboardLifeCycleable可以接在ViewController的头上

public protocol MGStoryboardLifeCycleable : MGLifeCycleable, StoryboardNavigable{
    
    static func viewControllerFromStoryBoard(navigation: DeeplinkNavigation) -> UIViewController?
}

extension MGLifeCycleable  where Self : UIViewController {
    
    public init?(navigation: DeeplinkNavigation) {
        self.init()
        self.navigation = navigation
    }
}

extension MGXibLifeCycleable  where Self : UIViewController {
    //MARK: - 必须保证Xib在class的bundle或者在Resources名字的Budle里面 不然你就重写吧
    public static func viewControllerFromXib(navigation: DeeplinkNavigation) -> UIViewController?{
        var bundle: Bundle?
        if let pathBundle = Bundle(for: self.classForCoder())
            .path(forResource: "Resources", ofType: "bundle") {
            bundle = Bundle(path: pathBundle)
        }
        if bundle == nil {
            bundle = Bundle(for: self.classForCoder())
        }
        let vc = self.init(nibName: String(describing: self), bundle: bundle)
        vc.navigation = navigation
        return  vc
    }
}

