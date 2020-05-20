import UIKit
/// 使用数组实现栈
struct StackByArray<T>{
    var array = [T]()
    
    mutating func push(value:T){
        array.append(value)
    }
    @discardableResult
    mutating func pop()->T?{
        if array.count > 0{
            let last = array.last
            array.removeLast()
            return last
        }
        return nil
    }
}
/// 使用数组实现队列
struct QueueByArray<T>{
    var array = [T]()
    
    mutating func push(value:T){
        array.append(value)
    }
    @discardableResult
    mutating func pop()->T?{
        if array.count > 0{
            let first = array.first
            array.removeFirst()
            return first
        }
        return nil
    }
}
var stack = StackByArray<Int>()
stack.push(value: 1)
stack.push(value: 2)
stack.push(value: 3)
stack.push(value: 4)
stack.push(value: 5)
print(stack.pop())
print(stack.pop())
print(stack.pop())
print(stack.pop())
print(stack.pop())

print("======")

var queue = QueueByArray<Int>()
queue.push(value: 1)
queue.push(value: 2)
queue.push(value: 3)
queue.push(value: 4)
queue.push(value: 5)
print(queue.pop())
print(queue.pop())
print(queue.pop())
print(queue.pop())
print(queue.pop())

print("======")

/// 节点
class Node<T>{
    var next:Node?
    var value:T
    init(value:T) {
        self.value = value
    }
}
/// 链表
class List<T>{
    var head:Node<T>?
    var tail:Node<T>?{
        return nodeAt(index: count - 1)
    }
    var count:Int = 0
    func append(value:T){
        let node = Node(value: value)
        if let _ = self.head{
            tail?.next = node
        }else{
            head = node
        }
        count = count + 1
    }
    func removeLast(){
        if count >= 2{
            let node = nodeAt(index: count - 2)
            node?.next = nil
        }else{
            head?.next = nil
        }
        count = max(count - 1, 0)
    }
    func removeFirst(){
        head = head?.next
        count = max(count - 1, 0)
    }
    func removeAll(){
        head = nil
        count = 0
    }
    func nodeAt(index:Int)->Node<T>?{
        var start = 0
        var node = head
        while node?.next != nil,start < index {
            node = node?.next
            start = start+1
        }
        return node
    }
    func descripetion(){
        var node = head
        print(node?.value)
        while node?.next != nil{
            node = node?.next
            print("descripetion",node?.value)
        }
    }
}
/// 使用数组实现栈
struct StackByList<T>{
    var list = List<T>()
    
    mutating func push(value:T){
        list.append(value: value)
    }
    @discardableResult
    mutating func pop()->T?{
        let value = list.tail?.value
        list.removeLast()
        return value
    }
}

/// 使用数组实现队列
struct QueueByList<T>{
    var list = List<T>()
    
    mutating func push(value:T){
        list.append(value: value)
    }
    @discardableResult
    mutating func pop()->T?{
        let value = list.head?.value
        list.removeFirst()
        return value
    }
}

var stackByList = StackByList<Int>()
stackByList.push(value: 1)
stackByList.push(value: 2)
stackByList.push(value: 3)
stackByList.push(value: 4)
stackByList.push(value: 5)

print(stackByList.pop())
print(stackByList.pop())
print(stackByList.pop())
print(stackByList.pop())
print(stackByList.pop())

print("======")

var queueByList = QueueByList<Int>()
queueByList.push(value: 1)
queueByList.push(value: 2)
queueByList.push(value: 3)
queueByList.push(value: 4)
queueByList.push(value: 5)
print(queueByList.pop())
print(queueByList.pop())
print(queueByList.pop())
print(queueByList.pop())
print(queueByList.pop())
