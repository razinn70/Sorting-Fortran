module quicksort_module
    use StackADT
    use intIO
    implicit none
contains
    subroutine iterativeQSort(arr, n)
        implicit none
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: n
        integer :: i, j, l, r, x, w

        if (n <= 0) return

        call initStack()
        call push(1, n)
        do while (.not. isEmpty())
            call pop(l, r)
            do
                i = l
                j = r
                x = arr((l + r) / 2)
                do while (i <= j)
                    ! Prevent accessing out-of-bounds elements
                    if (i < 1) i = 1
                    if (i > n) exit  ! Exit if i exceeds array size
                    if (j < 1) exit  ! Exit if j goes below valid index
                    if (j > n) j = n

                    do while (arr(i) < x .and. i <= n)
                        i = i + 1
                    end do
                    do while (arr(j) > x .and. j >= 1)
                        j = j - 1
                    end do

                    if (i <= j) then
                        w = arr(i)
                        arr(i) = arr(j)
                        arr(j) = w
                        i = i + 1
                        j = j - 1
                    end if
                end do
                if ((j - l) < (r - i)) then
                    if (i < r) call push(i, r)
                    r = j
                else
                    if (l < j) call push(l, j)
                    l = i
                end if
                if (l >= r) exit
            end do
        end do
    end subroutine iterativeQSort
end module quicksort_module

program testIterativeQSort
    use quicksort_module
    use intIO
    implicit none
    integer, allocatable :: arr(:)
    integer :: n
    character(len=100) :: filename

    print *, "Enter the name of the input file:"
    read *, filename

    call readUnsorted(trim(filename), arr, n)

    if (n > 0) then
        call iterativeQSort(arr, n)
        call writeSorted(arr, n)
    else
        print *, "Error: No data to sort."
    end if

    deallocate(arr)
end program testIterativeQSort