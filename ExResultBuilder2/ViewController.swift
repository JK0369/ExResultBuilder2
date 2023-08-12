//
//  ViewController.swift
//  ExResultBuilder2
//
//  Created by 김종권 on 2023/08/12.
//

import UIKit

@resultBuilder
enum Builder<T> {
    static func buildBlock(_ component: T) -> T { component }
    static func buildEither(first component: T) -> T { component }
    static func buildEither(second component: T) -> T { component }
}

func builder<T>(@Builder<T> _ closure: () -> T) -> T { closure() }

class ViewController: UIViewController {
    var datas = [1, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = buildLabel {
            if datas.count == 0 {
                UILabel()
            } else {
                UILabel()
            }
        }
        
        let value1 = {
            if self.datas.count == 0 {
                return 1
            } else {
                return 2
            }
        }()
        
        let value2 = builder {
            if datas.count == 0 {
                1
            } else {
                2
            }
        }

        let value3 = builder {
            if datas.count == 0 {
                UILabel()
            } else {
                UILabel()
            }
        }
    }
    
    func buildLabel(@Builder<UILabel> _ closure: () -> UILabel) -> UILabel {
        closure()
    }
}
