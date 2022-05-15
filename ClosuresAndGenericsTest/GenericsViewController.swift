//
//  GenericsViewController.swift
//  ClosuresAndGenericsTest
//
//  Created by Oksana Poliakova on 15.05.2022.
//

import UIKit

// MARK: - Generics in protocols. Associative types

protocol Event {
    associatedtype Parameter
    /// with restrictions for type and value, rowValue is only StringProtocol, can be used with Raw.Value == String
    associatedtype EventTypes: RawRepresentable where EventTypes.RawValue: StringProtocol
    
    var eventName: String { get }
    var eventParameters: Parameter { get }
    var eventTypes: EventTypes { get }
}

// MARK: - Generic model

struct Box<T: Equatable> {
    let objects: [T]
    
    func hasObject(_ object: T) -> Bool {
        return objects.contains(object)
    }
}

struct AutorizationEvent: Event {
    enum AutorizationTypes: String {
        case one
    }
    
    var eventTypes: AutorizationTypes
    var eventName: String
    var eventParameters: String
}



// MARK: - UIViewController

class GenericsViewController: UIViewController {

    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Generic function
    
    func genericFunction() {
        /// without generic
        func log(_ object: String) {
            print("Info: \(object)")
        }
        
        /// with generic
        func log<T>(_ object: T) {
            print("Info: \(object)")
        }
    }
    
}

// MARK: - Extensions

extension Box where T == String {

}

extension Box where T: Hashable {

}
