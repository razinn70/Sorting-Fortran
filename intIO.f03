module intIO
    implicit none
contains

    ! Read integers from a file into a dynamically allocated array
    subroutine readUnsorted(filename, arr, n)
        implicit none
        character(len=*), intent(in) :: filename
        integer, allocatable, intent(out) :: arr(:)
        integer, intent(out) :: n
        integer :: i, ios, unit, temp
       
        unit = 10
        open(unit, file=filename, status='old', action='read', iostat=ios)
        if (ios /= 0) then
            print *, "Error: File ", trim(filename), " does not exist or cannot be opened."
            stop 1
        end if

        ! Count numbers
        n = 0
        do
            read(unit, *, iostat=ios) temp
            if (ios /= 0) exit
            n = n + 1
        end do

        if (n == 0) then
           print *, "Error: No valid numbers found in the input file."
            close(unit)
            stop 1
        end if

        ! Rewind and allocate memory
        rewind(unit)
        allocate(arr(n))

        ! Read the numbers into the array
        do i = 1, n
            read(unit, *) arr(i)
        end do

        close(unit)
    end subroutine readUnsorted

    ! Write sorted integers to "sortedNUM.txt"
    subroutine writeSorted(arr, n)
        implicit none
        integer, intent(in) :: arr(:)
        integer, intent(in) :: n
        integer :: unit, ios, i
        character(len=20) :: filename

        filename = "sortedNUM.txt"
        unit = 20

        ! Open file for writing
        open(unit, file=filename, status='replace', action='write', iostat=ios)
        if (ios /= 0) then
            print *, "Error: Cannot open file ", trim(filename), " for writing."
            stop 1
        end if

        ! Write numbers one per line
        do i = 1, n
            write(unit, '(I10)') arr(i)
        end do

        close(unit)
        print *, "Sorted numbers saved to: ", trim(filename)
    end subroutine writeSorted

end module intIO