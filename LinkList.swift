//
//  LinkList.swift
//  AlgorithmSwift
//
//  Created by YY on 2022/4/8.
//

import Foundation

// MARK: - 链表

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */

class MyLinkedList {
    
    class LinkNode {
        var value: Int?
        var next: LinkNode?
        
        init(_ value: Int) {
            self.value = value
            self.next = nil
        }
    }
    
    var size: Int = 0
    var head: LinkNode?

    init() {
        
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
        return node!.value ?? -1
    }
    
    func addAtHead(_ val: Int) {
        let newNode = LinkNode.init(val)
        newNode.next = head
        head = newNode
        size += 1
        showAllNode()
    }
    
    func addAtTail(_ val: Int) {
        let newNode = LinkNode.init(val)
        if head == nil {
            let newNode = LinkNode.init(val)
            newNode.next = head
            head = newNode
        }else {
            var tail = getNode(size - 1)
            tail?.next = newNode
            tail = newNode
        }
        size += 1
        showAllNode()
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        let newNode = LinkNode.init(val)
        if index == 0 {
            let newNode = LinkNode.init(val)
            newNode.next = head
            head = newNode
        }else {
            let prev = getNode(index - 1)
            newNode.next = prev?.next
            prev?.next = newNode
        }
        size += 1
        showAllNode()
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
        showAllNode()
    }
    
    private func getNode(_ index: Int) -> LinkNode? {
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
    
    func showAllNode() {
        var i = 0
        var node = head
        while i < size {
            if i == size - 1 {
                print("\(String(describing: node!.value))")
            }else {
                print("\(String(describing: node!.value)) > ",terminator:"")
            }
            node = node?.next
            i += 1
        }
    }
}

