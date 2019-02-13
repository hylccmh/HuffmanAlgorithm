//
//  QuickSort.swift
//  Learn
//
//  Created by huyunlong on 2019/1/26.
//  Copyright © 2019 huyunlong. All rights reserved.
//

import UIKit

class QuickSort: NSObject {

    var sortNodes:Array<Node> = []
    
    //快速排序
    func sort(nodes:Array<Node>)->Array<Node>{
    
        //由于swift 语言特性，不能保留传入的参数的变量属性,这里添加一个变量保存，排序的node数组
        sortNodes = nodes
        sortUnit(low: 0, high: nodes.count - 1)
        return sortNodes
    }
    
    func sortUnit(low:Int , high:Int){
        
        if low >= high {
            return
        }
        
        var first = low
        var last = high
        let keyNode = sortNodes[first]
        
        while (first < last) {
            
            //从右向左
            while(first < last && (sortNodes[last].weight)! >= keyNode.weight!){
                last -= 1
            }
            sortNodes[first] = sortNodes[last]  //将比第一个小的权值移到低端
            
            //从左向右
            while(first < last && (sortNodes[first].weight)! <= keyNode.weight!) {
                first += 1
            }
            sortNodes[last] = sortNodes[first]  //将比第一个大的权值移动到高端
        }
        
//        sortNodes[first].weight = key
//        sortNodes[first].data = data
        
        sortNodes[first] = keyNode  //这里一定要以整体的对象赋值，不可直接给内部对象赋值（如上代码），否者会发生意想不到的问题
        
        sortUnit( low: low, high: first - 1)
        sortUnit( low: first + 1, high: high)
    }
    
}

