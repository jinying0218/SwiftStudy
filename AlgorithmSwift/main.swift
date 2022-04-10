//
//  main.swift
//  AlgorithmSwift
//
//  Created by YY on 2022/4/8.
//

import Foundation

//var node = LinkNode(1, NSNull)
// MARK: -
// MARK: - 交换两个值

func swapeTwoValue<T>(_ a:inout T, _ b:inout T) {
    print("交换前：a:\(a) \t b:\(b)")
    let temp = a;
    a = b
    b = temp
    print("交换后：a:\(a) \t b:\(b)")
}
// MARK: - 交换两个字符串

func swapeStringValue<T>(_ stringA:inout T,_ stringB:inout T) {
    print("交换前：stringA:\(stringA) \t stringB:\(stringB)")
    let temp = stringA
    stringA=stringB
    stringB=temp
    print("交换后：stringA:\(stringA) \t stringB:\(stringB)")
}

/*
var a=10
var b=20

swapeTwoValue( &a, &b)

let count=10
while count < 10 {
    print("while循环 \(count)")
    
}
print("Hello, World!")

var astring = "Hello"
var bstring = "World"

swapeStringValue(&astring, &bstring)

 */

//let obj = MyLinkedList()

let mylist = MyLinkedList()
print("初始化链表")
// MARK: - 用例1
//mylist.addAtHead(1)
//mylist.addAtTail(3)
//mylist.addAtIndex(1, 2)
//let val = mylist.get(1)
//print("get:\(val)")
//mylist.deleteAtIndex(1)
//let val2 = mylist.get(1)
//print("get:\(val2)")

// MARK: - 用例2
//mylist.addAtHead(1)
//mylist.addAtTail(3)
//mylist.addAtIndex(1, 2)
//print("get:\(mylist.get(1))")
//mylist.deleteAtIndex(0)
//print("get:\(mylist.get(0))")

// MARK: - 用例3
//mylist.addAtIndex(0, 10)
//mylist.addAtIndex(0, 20)
//mylist.addAtIndex(1, 30)
//print("get:\(mylist.get(0))")

// MARK: - 用例4
//mylist.addAtHead(4)
//print("get:\(mylist.get(1))")
//mylist.addAtHead(1)
//mylist.addAtHead(5)


/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */

// MARK: - 206
//let _206 = Solution206()
//_206.linkList.head = _206.reverseList1(_206.linkList.head)
//_206.linkList.showAllNode()

//let _141 = Solution141()
//_141.linkList.showAllNode()

//print(_141.hasCycle(_141.linkList.head))

// MARK: - 203
let _203 = Solution203()
/// 用例1
//let linkList = LinkedList.init([1,2,6,3,4,5,6])
//_203.linkList = linkList
//_203.linkList?.showAllNode()
//_203.removeElements(_203.linkList?.head, 6)
//_203.linkList?.showAllNode()

/// 用例2
let linkList = LinkedList.init([1])
_203.linkList = linkList
_203.linkList?.showAllNode()
_203.removeElements(_203.linkList?.head, 2)
_203.linkList?.showAllNode()