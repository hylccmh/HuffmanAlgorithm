//
//  BuildTree.swift
//  Learn
//
//  Created by huyunlong on 2019/1/26.
//  Copyright © 2019 huyunlong. All rights reserved.
//

import UIKit

class BuildTree: NSObject {

    var selectStart = 0 //已处理的节点数,每次都把两个节点合成一个（新增一个节点）,排序之后，又需要两个节点合成下一个节点，所以步长是 2
    
    ///构建霍夫曼树
    ///
    /// - Parameter nodes:叶子节点(我们把构造完成的霍夫曼树，叶子节点称为外部节点，非叶子节点称为内部节点)
    /// - Returns:处理过后的霍夫曼树
    func buildTree(nodes:Array<Node>)->Array<Node> {
        
        var left:Int?   //左节点索引
        var right:Int?  //右节点索引
        var parent:Int? //父母节点索引
        
        let n = nodes.count   //外部节点的数量
        let m = 2*n - 1  //内部节点 + 外部节点的总数量
        var HT:Array<Node> = []; //存储节点的对象
        
        //给所有的节点一个默认的权值为0
        for _ in 0..<m {
            
            let node = Node.init(weight: 0,parent:0)
            HT.append(node)
        }
        
        //把叶子节点的值赋值给 HT[0]~HT[n-1]（内部节点）
        for index in 0..<n {
            HT[index].data = nodes[index].data
            HT[index].weight = nodes[index].weight
        }
    
        
        //计算内部节点的值
        for index in n..<m {
            
            parent = index
            
            left = selectSubscript(HT: HT, rang: index, rank: 0) //取得HT数组中权值最小的节点对象的下标
            right = selectSubscript(HT: HT, rang: index, rank: 1) //取得HT数组中权值次小的节点对象的下标
            
            //index 节点为当前数组HT 中合成的节点(父节点) ，left 为左节点索引，right 为右节点索引 ，以下建立关联关系
            HT[index].left = left
            HT[index].right = right
            HT[index].weight = (HT[left!].weight)! + (HT[right!].weight)! //当前节点的值
            
            HT[left!].parent = parent
            HT[right!].parent = parent
            
            selectStart += 2
        }
        
        return HT
    }
    
    /// 返回权值排名为 rank 的节点对象在HT中的下标(权值从小到大排序)
    ///
    /// - Parameters:
    ///   - HT: 所有节点的对象
    ///   - rang: 处理的节点的范围
    ///   - rank: left / right
    func selectSubscript(HT:Array<Node> ,rang:Int , rank:Int)->Int{
        
        //将HT[0]~HT[range]拷贝到copyNodes中
        var  copyNodes:Array<Node> = []
        for index in 0..<rang {
            copyNodes.append(HT[index])
        }
        
        //对数组 copyNodes 进行从小到大的排序
        copyNodes = QuickSort().sort(nodes: copyNodes)
        
        //从未参与合成的节点 中取得最小的值/次最小值
        let targetNode = copyNodes[rank + selectStart]
        
        for index in 0..<HT.count {
            
            if targetNode == HT[index] {  //返回该结点对象在数组HT中的下标
                return index
            }
        }
        
        return -1
    }
}










































