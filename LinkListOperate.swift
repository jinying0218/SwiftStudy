//
//  LinkListOperate.swift
//  AlgorithmSwift
//
//  Created by YY on 2022/4/10.
//

import Foundation




// 237. 删除链表中的节点 https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
class Solution237 {
    func deleteNode(_ node: ListNode?) {
        node?.val = node!.next!.val
        node?.next = node?.next?.next
    }
}


// 206. 反转链表 https://leetcode-cn.com/problems/reverse-linked-list/
class Solution206 {
    
    var linkList = LinkedList()
    
    init() {
        linkList.addAtHead(1)
        linkList.addAtTail(2)
        linkList.addAtTail(3)
        linkList.addAtTail(4)
        linkList.addAtTail(5)
    }

    /// 递归
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let newHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil

//        var node = newHead
//        print("\t")
//        while node != nil {
//            if node?.next == nil {
//                print("\(String(describing: node?.val))")
//            }else {
//                print("\(String(describing: node?.val)) > ",terminator:"")
//            }
//            node = node?.next
//        }
        return newHead
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
                
        var newHead: ListNode?
        
        var tempHead = head

        while tempHead != nil {
            let temp = tempHead?.next
            tempHead?.next = newHead
            newHead = tempHead!
            tempHead = temp
        }
        
        
        return newHead
    }
}

// 141. 环形链表 https://leetcode-cn.com/problems/linked-list-cycle/
class Solution141 {
    
    var linkList = LinkedList()
    
    init() {
        linkList.addAtHead(1)
        linkList.addAtTail(2)
        linkList.addAtTail(3)
        linkList.addAtTail(4)
        linkList.addAtTail(5)
        
//        let node3 = linkList.getNode(3)
//        let node4 = linkList.getNode(4)
//        node4?.next = node3
    }
    
    func hasCycle0(_ head: ListNode?) -> Bool {

        if head == nil || head?.next == nil {
            return false
        }

        var tempHead = head
        var slow = tempHead
        var fast = tempHead?.next

        while tempHead != nil {
            if slow === fast {
                return true
            }

            slow = slow?.next
            fast = fast?.next?.next

            tempHead = tempHead?.next
        }

        return false
    }
    /// 判断是否有环
    func hasCycle(_ head: ListNode?) -> Bool {
        
        if head == nil || head?.next == nil {
            return false
        }
        
        var slow = head
        var fast = head?.next
        
        while fast != nil && fast?.next != nil {
            if slow === fast {
                return true
            }

            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return false
    }
}

// 203. 移除链表元素 https://leetcode-cn.com/problems/remove-linked-list-elements/

class Solution203 {
    
    var linkList: LinkedList?
    
    init() {
    }
    
    func getNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        var target: ListNode?
        var tempHead = head
        while tempHead != nil {
            if tempHead?.val == val {
                target = tempHead
                break
            }
            tempHead = tempHead?.next ?? nil
        }
        return target
    }
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        let dummyNode = ListNode()
        dummyNode.next = head
        var prev = dummyNode
        var temp = dummyNode.next
        while temp != nil {
//            print("prev: \(prev.val) temp: \(temp?.val)")
            if temp?.val == val {
                prev.next = temp?.next
                temp = temp?.next
            }else {
                prev = temp!
                temp = temp?.next
            }
        }
        
        return dummyNode.next
    }
}

// 83. 删除排序链表中的重复元素 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
class Solution83 {
    
    var linkList: LinkedList?
    
    init() {
        
    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {

        let prev = head
        var temp = head

        while temp?.next != nil {
            if temp?.val == temp?.next?.val {
                temp?.next = temp?.next?.next
            }else {
                temp = temp?.next
            }
        }
        return prev
    }

}

// 876. 链表的中间结点 https://leetcode-cn.com/problems/middle-of-the-linked-list/
class Solution876 {
    
    var linkList: LinkedList?

    /// 遍历两次
//    func middleNode(_ head: ListNode?) -> ListNode? {
//
//        var temp = head
//        var count = 0
//        while temp != nil {
//            count += 1
//            temp = temp?.next
//        }
//        let index = count/2
//        print("中间索引index：\(index)")
//
//        var i = 0
//        temp = head
//        while i < index {
//            temp = temp?.next
//            i += 1
//        }
//
//        return temp
//    }
    /// 双指针
    func middleNode(_ head: ListNode?) -> ListNode? {
        
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
