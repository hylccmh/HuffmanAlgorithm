//
//  HuffmanEncode.swift
//  Learn
//
//  Created by huyunlong on 2019/1/26.
//  Copyright © 2019 huyunlong. All rights reserved.
//

import UIKit

class HuffmanEncode: NSObject {
    
    
}

extension HuffmanEncode {
    
    ///编码
    ///
    /// - Parameter nodes: 叶子节点
    /// - Returns: 每个字符的编码 数组
    func encode(nodes:Array<Node>)->Array<HuffmanCode>{
        
        var HT = BuildTree().buildTree(nodes: nodes) //构造霍夫曼树
        let n = nodes.count
        var HC:Array<HuffmanCode> = []
        var bit:String = ""
        
        for leavesIndex in 0..<n { // 遍历各个叶子结点
            
            bit = ""
            
            // 从叶子结点上溯到根结点
            var nodeIndex = leavesIndex
            while (HT[nodeIndex].parent != 0) { //遍历结束的条件是 node 的父节点的值为 0 (根节点)
                let parentIndex = (HT[nodeIndex].parent)!
              
                if HT[parentIndex].left == nodeIndex { //左
                    
                    bit = "0\(bit)"
                } else {  //右
                    
                    bit = "1\(bit)"
                }
                
                // 开始下一个节点的循环
                nodeIndex = parentIndex
            }
            
            //将字符和对应的编码存储起来
            let code = HuffmanCode.init(data:HT[leavesIndex].data , bit: bit)
            HC.append(code)
        }
        
        return HC
    }
    
    /// 译码
    ///
    /// - Parameters:
    ///   - nodes: 叶子节点
    ///   - code: 编码
    /// - Returns: 译码后的字符
    func decode(nodes:Array<Node> , code:String)->String {
        
        var str = ""
        var HT = BuildTree().buildTree(nodes: nodes) //构造霍夫曼树
        var n = HT.count - 1
        
        //遍历字符串
        for c in code {
            
            if "\(c)" == "1"  {
                
                n = (HT[n].right)!
            } else {
                
                n = (HT[n].left)!
            }
            
            if (HT[n].left)! == 0 { //叶子节点为0 打印当前字符
                
                str += "\((HT[n].data)!)"
                n = HT.count - 1
            }
        }
        
        return str
    }
    
}



































