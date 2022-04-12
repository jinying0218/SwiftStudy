//
//  ListNode.swift
//  AlgorithmSwift
//
//  Created by YY on 2022/4/10.
//

import Foundation

//MARK: - ListNode

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

extension ListNode : Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(ObjectIdentifier(self))
    }
}

//MARK: - LinkedList
class LinkedList {
    
    var size: Int = 0
    var head: ListNode?

    init() {
        
    }
    init(_ array:[Int]) {
        for i in array {
            addAtTail(i)
        }
        print("初始化链表")
        showHeadNode(head)
    }
    
    func get(_ index: Int) -> Int {
        guard index < size && index >= 0 && head != nil else {
            return -1
        }
        var i = 0
        var node = head
        while i < index {
            node = node?.next
            i += 1
        }
        return node!.val
    }
    
    func addAtHead(_ val: Int) {
        let newNode = ListNode.init(val)
        newNode.next = head
        head = newNode
        size += 1
    }
    
    func addAtTail(_ val: Int) {
        let newNode = ListNode.init(val)
        if head == nil {
            let newNode = ListNode.init(val)
            newNode.next = head
            head = newNode
        }else {
            var tail = getNode(size - 1)
            tail?.next = newNode
            tail = newNode
        }
        size += 1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        let newNode = ListNode.init(val)
        if index == 0 {
            let newNode = ListNode.init(val)
            newNode.next = head
            head = newNode
        }else {
            let prev = getNode(index - 1)
            newNode.next = prev?.next
            prev?.next = newNode
        }
        size += 1
    }
    
    func deleteAtIndex(_ index: Int) {
        if index < 0 || index >= size {
            print("index越界")
            return
        }
        if index == 0 {
            head = head?.next
        }else {
            let prev = getNode(index - 1)
            prev?.next = prev?.next?.next
        }
        size -= 1
    }
    
    func getNode(_ index: Int) -> ListNode? {
        guard index < size && index >= 0 else {
            return nil
        }
        var i = 0
        var node = head
        while i < index {
            node = node?.next
            i += 1
        }
        return node;
    }
    
    func clear() {
        self.size = 0
        self.head = nil
    }
    
    func showHeadNode(_ head: ListNode?) {
        if head == nil {
            print("🤬空链表")
            return
        }
        var node = head
        while node != nil {
            if node?.next != nil {
                print("\(String(describing: node?.val)) > ",terminator:"")
            }else {
                print("\(String(describing: node?.val)) pos：\(node?.next != nil)")
            }
            node = node?.next
        }
    }
    
    func showAllNode() {
        var i = 0
        var node = head
        while i < size {
            if i == size - 1 {
                print("\(String(describing: node?.val)) pos：\(node?.next != nil)")
            }else {
                print("\(String(describing: node?.val)) > ",terminator:"")
            }
            node = node?.next
            i += 1
        }
    }
}
