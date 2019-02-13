//
//  HuffmanCode.swift
//  Learn
//
//  Created by huyunlong on 2019/1/26.
//  Copyright © 2019 huyunlong. All rights reserved.
//

import UIKit

class HuffmanCode: NSObject {

    var data:Character? //存放字符
    var bit:String?      //存放编码后的字符串
    
    init(data:Character? ,bit:String) {
        super.init()
        self.data = data
        self.bit = bit
    }
}
