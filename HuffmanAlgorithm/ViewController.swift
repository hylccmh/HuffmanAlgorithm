//
//  ViewController.swift
//  HuffmanAlgorithm
//
//  Created by huyunlong on 2019/1/31.
//  Copyright © 2019 huyunlong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        test()
    }


}

extension ViewController {
    
    func test(){
        
        var nodes:Array<Node> = []
        
        let node1 = Node.init(data:"A", weight: 4)
        let node2 = Node.init(data:"B", weight: 6)
        let node3 = Node.init(data:"C", weight: 7)
        let node4 = Node.init(data:"D", weight: 9)
        let node5 = Node.init(data:"E", weight: 2)
        
        nodes.append(node1)
        nodes.append(node2)
        nodes.append(node3)
        nodes.append(node4)
        nodes.append(node5)
        
        //构建哈夫曼树
        print("构建霍夫曼树")
        let buildTree = BuildTree()
        let HT = buildTree.buildTree(nodes:nodes)
        for index  in 0..<HT.count {
            
            let node = HT[index]
            print("Node -",index,": data = ","\(String(describing: node.data))"," weight = ","\((node.weight)!)")
        }
        
        //霍夫曼编码
        print("霍夫曼编码")
        let huffmanCode = HuffmanEncode()
        for index  in 0..<huffmanCode.encode(nodes:nodes).count {
            
            let code = huffmanCode.encode(nodes:nodes)[index]
            print("encode -",index,": data = ","\((code.data)!)"," bit = ","\((code.bit)!)")
        }
        
        //解码
        print("译码")
        let decode = huffmanCode.decode(nodes:nodes , code:"00101111000011" )
        print("decode - 00101111000011  译码后的字符为: ",decode)
    }
    
}

