# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

list = ListNode.new(1)
list.next = ListNode.new(2)

def remove_nth_from_end(head, n)
    change_next = head
    tail = head
    n.times do
        if tail.next.nil?
          return change_next.next
        end
        tail = tail.next
    end
    until tail.next.nil?
        change_next = change_next.next
        tail = tail.next
    end
    change_next.next = change_next.next.next
    return head
end

puts remove_nth_from_end(list, 1).val
