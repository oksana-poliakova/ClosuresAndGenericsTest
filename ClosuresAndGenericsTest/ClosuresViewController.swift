//
//  ViewController.swift
//  ClosuresAndGenericsTest
//
//  Created by Oksana Poliakova on 15.05.2022.
//

import UIKit

class ClosuresViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Example with present ViewController, using unowned self
        present(UIViewController(), animated: true, completion: { [weak self] in
            self?.someMethod()
        })
        
        firstCalculating()
        secondCalculating()
    }
    
    // MARK: - Closures
    
    /// Example 1 with methods in the closure
    
    func firstCalculating() {
        var calculate: ((_ first: Int, _ second: Int) -> Int)?
        
        calculate = { [weak self] first, second in
            self?.someMethod()
            return first + second
        }
    
        let result = calculate?(3, 5)
        print(result as Any)
        
    }
    
    /// some method
    func someMethod() {
        print("It's a method")
    }
    
    /// Example 2 with completion
    
    func secondCalculating() {
        func resultComp(first: Int, second: Int, completion: (Int) -> Void) {
            completion(first + second)
        }
        
        resultComp(first: 5, second: 9) { result in
            print(result)
        }
    }
    
    // MARK: - @escaping
    
    func functionWithEscapingClosure() {
        var blocks: [() -> String] = []
        
        func addBlocksToArray(name: String, completion: @escaping () -> String) {
            blocks.append(completion)
        }
    }
    
}

