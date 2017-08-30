//
//  ViewController.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/7.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    let detail = DetailViewController()
    var interactiveTransition :KJInteractivityTransition?
    
    var array : Array<Double> = Array<Double>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        for _ in 0 ..< 10 {
            array.append(Double(arc4random() % UInt32(128) + UInt32(1)))
        }
        
//        self.bubbleSort()
        self.insertionSort()
        self.printArray()
        
        
//        interactiveTransition = KJInteractivityTransition.init(gestureType: .pan, controlAnimationType: .Slider, viewController: self)
//        interactiveTransition?.pushViewController = detail
//        self.setKj_RightGesture(kj_rightGesture: false)
        
        let button1 = UIButton(type:.custom)
        button1.setTitle("全屏渐变", for: .normal)
        button1.setTitleColor(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), for: .normal)
        button1.addTarget(self, action: #selector(bubbleSort), for: .touchUpInside)
        view.addSubview(button1)
        button1.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.bottom.equalTo(view).offset(-100)
        }
        
        
//        let arr :[Double] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//        let a = arr.sorted { (_, _) -> Bool in
//            arc4random() < arc4random()
//        }
//        self.printArray(tempArray: a)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        self.navigationController?.delegate = interactiveTransition
    }
/*
     冒泡排序算法的运作如下：
     比较相邻的元素。如果第一个比第二个大，就交换他们两个。
     对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
     针对所有的元素重复以上的步骤，除了最后一个。
     持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
 **/
//MARK: - 冒泡排序
    func bubbleSort() {
        for i in 0 ..< Int(array.count) {
            for j in 0 ..< array.count-i-1 {
                let temp = array[j]
                if temp > array[j+1] {
                    array[j] = array[j+1]
                    array[j+1] = temp
                }
            }
        }
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    
/*
     一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：
     从第一个元素开始，该元素可以认为已经被排序
     取出下一个元素，在已经排序的元素序列中从后向前扫描
     如果该元素（已排序）大于新元素，将该元素移到下一位置
     重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
     将新元素插入到该位置后
     重复步骤2~5
     如果比较操作的代价比交换操作大的话，可以采用二分查找法来减少比较操作的数目。该算法可以认为是插入排序的一个变种，称为二分查找插入排序。
 **/
//MARK: - 插入排序
    func insertionSort() {
        for i in 0 ..< array.count-1 {
            
            for j in (1 ... i+1).reversed() {
                if array[j-1] > array[j] {
                    let temp = array[j]
                    array[j] = array[j-1]
                    array[j-1] = temp
                    
                }
            }
//            array[j+1] = temp
        }
    }
    
    
    
    
    
    
    func printArray( tempArray:Array<Double>) {
        for i in 0 ..< Int(tempArray.count) {
            print("\(tempArray[i])\n")
        }
    }
    
    func printArray() {
        for i in 0 ..< Int(array.count) {
            print("\(array[i])\n")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

