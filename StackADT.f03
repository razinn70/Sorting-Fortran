module StackADT
    implicit none
    integer, parameter :: maxSize = 1000  ! Increased stack size to prevent overflow
    integer, allocatable :: stack(:,:)    ! Dynamically allocated stack
    integer :: top = 0                    ! Stack pointer (initialized to empty)

contains

    ! Initialize stack memory dynamically
    subroutine initStack()
        implicit none
        allocate(stack(maxSize, 2))
        top = 0
    end subroutine initStack

    ! Push a new partitioning request onto the stack
    subroutine push(l, r)
        implicit none
        integer, intent(in) :: l, r

        if (top >= maxSize) then
            print *, "Stack Overflow! Too many partitions."
            stop 1
        end if

        top = top + 1
        stack(top, 1) = l
        stack(top, 2) = r
    end subroutine push

    ! Pop a partitioning request from the stack
    subroutine pop(l, r)
        implicit none
        integer, intent(out) :: l, r

        if (top == 0) then
            print *, "Stack Underflow! No more partitions."
            stop 1
        end if

        l = stack(top, 1)
        r = stack(top, 2)
        top = top - 1
    end subroutine pop

    ! Check if the stack is empty
    function isEmpty() result(empty)
        implicit none
        logical :: empty
        empty = (top == 0)
    end function isEmpty

    ! Clear the stack (reset pointer)
    subroutine clear()
        implicit none
        top = 0
    end subroutine clear

end module StackADT
