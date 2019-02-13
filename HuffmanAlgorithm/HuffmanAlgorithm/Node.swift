//
//  Node.swift
//  Learn
//
//  Created by huyunlong on 2019/1/26.
//  Copyright © 2019 huyunlong. All rights reserved.
//

import UIKit

class Node: NSObject {

    var data:Character? //存放字符
    var weight:Int?     //权值
    var left:Int?       //左链(指向左孩子节点)
    var right:Int?      //右链(指向右孩子节点)
    var parent:Int?     //父链(父母节点)
    
    init(data:Character , weight:Int) {
        super.init()
        self.data = data
        self.weight = weight
    }
    
    init(weight:Int ,parent:Int) {
        super.init()
        self.weight = weight
        self.parent = parent
        self.left = 0
        self.right = 0
    }
}


