//
//  LinkListOperate.swift
//  AlgorithmSwift
//
//  Created by YY on 2022/4/10.
//

import Foundation

//MARK: - 找出链表的倒数第N个节点
//MARK: - 19.删除链表的倒数第N个节点
class Solution19 {
    
    var linkList = LinkedList()

    // 返回该节点的值
    func kthToLast(_ head: ListNode?, _ k: Int) -> Int {
        var slow = head
        var fast = head
        var count = 0
        while fast != nil {
            if count >= k {
                slow = slow?.next
            }
            fast = fast?.next
            count += 1
        }
        return slow!.val
    }
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {

        let dummy = ListNode.init()
        dummy.next = head
        var prev = dummy
        var fast = head
        var count = 0
        
        while fast != nil {
            if count >= n {
                prev = prev.next!
            }
            fast = fast?.next
            count += 1
        }
        
        prev.next = prev.next?.next
        
        return dummy.next
    }
}

//MARK: - 237. 删除链表中的节点 https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
class Solution237 {
    func deleteNode(_ node: ListNode?) {
        node?.val = node!.next!.val
        node?.next = node?.next?.next
    }
}


//MARK: - 206. 反转链表 https://leetcode-cn.com/problems/reverse-linked-list/
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

//MARK: - 141. 环形链表 https://leetcode-cn.com/problems/linked-list-cycle/
class Solution141 {
    
    var linkList = LinkedList()
    
    init() {
        linkList.addAtHead(3)
        linkList.addAtTail(2)
        linkList.addAtTail(0)
        linkList.addAtTail(-4)
//        linkList.addAtTail(5)
        
        let node3 = linkList.getNode(2)
        let node4 = linkList.getNode(3)
        node4?.next = node3
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
    func hasCycle1(_ head: ListNode?) -> Bool {
        
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
    func hasCycle(_ head: ListNode?) -> Bool {
        
        if head == nil || head?.next == nil {
            return false
        }
        let set = NSMutableSet.init()
        var temp = head
        while temp !=  nil {
            if set.contains(temp as Any) == true {
                return true
            }
            set.add(temp as Any)
            temp = temp?.next
        }
        return false
    }
}

//MARK: - 142. 环形链表 II https://leetcode-cn.com/problems/linked-list-cycle-ii/
class Solution142 {
    
    var linkList = LinkedList()

    func detectCycle0(_ head: ListNode?) -> ListNode? {
        
        if head == nil || head?.next == nil {
            return nil
        }
        
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
//                print ("相遇了！！！slow:\(slow!.val)")
                var croseNode = head
//                print("croseNode从头跑：\(croseNode!.val)  slow从相遇点跑：\(slow!.val)")
                while croseNode !== slow {
                    croseNode = croseNode?.next
                    slow = slow?.next
//                    print ("croseNode:\(croseNode!.val)  slow:\(slow!.val)")
                }
//                print ("入口：croseNode:\(croseNode!.val)  slow:\(slow!.val)")
                return slow
            }
        }
        
        return nil
    }
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return nil
        }
        
        var hashmap = Set<ListNode>()
        
        var prev = head
        while prev != nil {
            if !hashmap.insert(prev!).inserted {
                return prev!
            }
            hashmap.insert(prev!)
            prev = prev?.next
        }
        
        return nil
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

//MARK: - 203. 移除链表元素 https://leetcode-cn.com/problems/remove-linked-list-elements/

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

//MARK: - 83. 删除排序链表中的重复元素 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
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

//MARK: - 876. 链表的中间结点 https://leetcode-cn.com/problems/middle-of-the-linked-list/
//MARK: 2095. 删除链表的中间节点 https://leetcode-cn.com/problems/delete-the-middle-node-of-a-linked-list/
class Solution876 {
    
    var linkList: LinkedList?

//MARK: 找出中间节点
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
//MARK: 删除中间节点
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        if head==nil || head?.next==nil {
            var temp = head
            temp=temp?.next
            return temp
        }
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow=slow?.next
            fast=fast?.next?.next
        }
        if slow?.next != nil {
            slow?.val=(slow?.next!.val)!
            slow?.next=slow?.next?.next
        }else {
            head?.next=nil
            slow=slow?.next
        }
        
        return head
    }
}

//MARK: - 160. 相交链表 https://leetcode-cn.com/problems/intersection-of-two-linked-lists/

class Solution160 {
    
    var linkList: LinkedList?

    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var aLength = getLinkListLength(headA)
        var bLenght = getLinkListLength(headB)
        var tempA = headA
        var tempB = headB
        while aLength != bLenght {
            if aLength > bLenght {
                tempA = tempA?.next
                aLength -= 1
            }else {
                tempB = tempB?.next
                bLenght -= 1
            }
        }
        /// 比较两个节点是否相等，相等节点就是相交节点，如果没有，一直遍历到链表结束nil
        while tempA !== tempB {
            tempA = tempA?.next
            tempB = tempB?.next
        }
        return tempA
    }
    
    private func getLinkListLength(_ head: ListNode?) -> Int {
        var length = 0
        var temp = head
        while temp != nil {
            temp = temp?.next
            length += 1
        }
        return length
    }
    
    
}