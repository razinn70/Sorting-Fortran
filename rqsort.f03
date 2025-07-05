module recursiveQuicksort
    use intIO
    implicit none
contains
    recursive subroutine rqsort(arr, left, right)
        implicit none
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: left, right
        integer :: pivot, i, j, temp

        if (left >= right) return

        pivot = arr((left + right) / 2)
        i = left
        j = right

        do
            do while (arr(i) < pivot)
                i = i + 1
            end do
            do while (arr(j) > pivot)
                j = j - 1
            end do
            if (i <= j) then
                temp = arr(i)
                arr(i) = arr(j)
                arr(j) = temp
                i = i + 1
                j = j - 1
            end if
            if (i > j) exit
        end do

        if (left < j) call rqsort(arr, left, j)
        if (i < right) call rqsort(arr, i, right)
    end subroutine rqsort
end module recursiveQuicksort
program testRecursiveQSort
    use recursiveQuicksort   ! Import the recursive quicksort module
    use intIO                ! Use the I/O module
    implicit none
    integer, allocatable :: arr(:)
    integer :: n
    character(len=100) :: filename

    print *, "Enter the name of the input file:"
    read *, filename

    call readUnsorted(trim(filename), arr, n)

    if (n > 0) then
        call rqsort(arr, 1, n)
        call writeSorted(arr, n)
    else
        print *, "Error: No data to sort."
    end if

    deallocate(arr)
end program testRecursiveQSort