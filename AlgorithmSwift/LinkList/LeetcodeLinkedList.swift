//
//  LeetcodeLinkedList.swift
//  AlgorithmSwift
//
//  Created by JYY on 2022/4/11.
//

import Foundation

func LinkedListOperate() {
    
    print("链表操作")
    
//MARK: - 21.合并两个有序链表
//    print("21.合并两个有序链表")
//    let link1 = LinkedList.init([1,2,4])
//    let link2 = LinkedList.init([1,3,4])
    
//    let link1 = LinkedList.init([])
//    let link2 = LinkedList.init([1])
//
//    let newLink = Solution21().mergeTwoLists(link1.head, link2.head)
//    LinkedList().showHeadNode(newLink)

    
// MARK: - 206.反转链表
    //let _206 = Solution206()
    //_206.linkList.head = _206.reverseList1(_206.linkList.head)
    //_206.linkList.showAllNode()
    
//    let link = LinkedList.init([1,2,3,4,5])
//    let newHead = Solution206().reverseList2(link.head)
//    LinkedList.showHeadNode(newHead)
    
// MARK: 反转前N个节点
    
//    let list = LinkedList.init([1,2,3,4,5,6])
//    let list = LinkedList.init([5])

//    let newHead = Solution206().reverseN(list.head,3)
    
//    let newHead = Solution206().reverseBetween( list.head, 1, 1)
//    LinkedList.showHeadNode(newHead)
// MARK: - 203.移除链表元素
    //let _203 = Solution203()
    /// 用例1
    //let linkList = LinkedList.init([1,2,6,3,4,5,6])
    //_203.linkList = linkList
    //_203.linkList?.showAllNode()
    //_203.removeElements(_203.linkList?.head, 6)
    //_203.linkList?.showAllNode()

    /// 用例2
    //let linkList = LinkedList.init([1])
    //_203.linkList = linkList
    //_203.linkList?.showAllNode()
    //_203.removeElements(_203.linkList?.head, 2)
    //_203.linkList?.showAllNode()

//MARK: - 234. 回文链表
    let linkedList = LinkedList.init([1,2,3,2,1])
//    let linkedList = LinkedList.init([1,2,3,3,2,1])
    print(Solution234().isPalindrome(linkedList.head))


// MARK: - 83.删除排序链表中的重复元素
    //let linkList = LinkedList.init([1,1,2])
    //let linkList = LinkedList.init([1,1,2,3,3])
    //let linkList = LinkedList.init([0,0,0,0,0])
    //let linkList = LinkedList.init()
    //let linkList = LinkedList.init([0,0,0,0,3])

    //let _83 = Solution83()
    //_83.linkList = linkList
    //_83.linkList?.showHeadNode(linkList.head)
    //let newHead = _83.deleteDuplicates(linkList.head)
    //_83.linkList?.showHeadNode(newHead)

// MARK: - 876.链表的中间结点
    //let linkList = LinkedList.init([1,2,3,4,5])
    //let linkList = LinkedList.init([1,2,3,4,5,6])
    //
    //let _876 = Solution876()
    //_876.linkList = linkList
    //_876.linkList?.showHeadNode(linkList.head)
    //let newHead = _876.middleNode(linkList.head)
    //_876.linkList?.showHeadNode(newHead)

// MARK: - 141.环形链表

    //let _141 = Solution141()
    //_141.linkList.showAllNode()
    //print(_141.hasCycle(_141.linkList.head))


// MARK: - 142.环形链表 II

    //let linkList = LinkedList.init([3,2,0,4])
    //let node0 = linkList.getNode(1)
    //let node1 = linkList.getNode(3)
    //node1?.next = node0
    //
    //let _142 = Solution142()
    //_142.linkList = linkList
    ////linkList.showHeadNode(linkList.head)
    //linkList.showAllNode()
    //print (_142.detectCycle(linkList.head)?.val)


// MARK: 2095.删除链表的中间节点
    //let linkList = LinkedList.init([1,2,3,4,5])
    //let linkList = LinkedList.init([1,3,4,7,1,2,6])
//    let linkList = LinkedList.init([2,1])
//
//    let _876 = Solution876()
//    _876.linkList = linkList
//    _876.linkList?.showHeadNode(linkList.head)
//    let newHead = _876.deleteMiddle(linkList.head)
//    _876.linkList?.showHeadNode(newHead)
    
//MARK: 19.删除链表的倒数第 N 个结点
//    print("19.删除链表的倒数第 N 个结点")
//    let linkList = LinkedList.init([1,2,3,4,5])
//    let linkList = LinkedList.init([1])
//    let linkList = LinkedList.init([1,2])
//    let _19 = Solution19()
//    _19.linkList = linkList
//    let newHead = _19.removeNthFromEnd(linkList.head, 1)
//    print(newHead?.val)
//    linkList.showHeadNode(newHead)
//    let newHeadVal = _19.kthToLast(linkList.head, 2)
//    print(newHeadVal)
    
    //MARK: - 328. 奇偶链表
//    print("328. 奇偶链表")
    
//    let linkList = LinkedList.init([1,2,3,4,5])
//    let newHead = Solution328().oddEvenList(linkList.head)
//    LinkedList.showHeadNode(newHead)
}


