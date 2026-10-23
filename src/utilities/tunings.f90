!! tunings  M2.1
!! @brief   An equal-tempered, octave-repeating, microtonal scale compiler.
!!
!! Based on Tunings.c from
!! Winsor, P. and DeLisa, G. (1991) Computer Music in C.
!!
!! @author Den Drown
!! @copyright 2026 Creative Commons Zero (CC0) v1.0 Universal license.

subroutine tunings(tones, freq1, oct_div, num_tones)
    implicit none

    integer, dimension(num_tones), intent(out)  :: tones
    real, intent(in)                            :: freq1
    integer, intent(in)                         :: oct_div
    integer, intent(in)                         :: num_tones

    real, parameter :: base = 2.0

    real    :: t9, coeff
    integer :: i
    t9    = 1.0 / oct_div
    coeff = base ** t9

    tones(1) = nint(freq1)
    do i = 2, num_tones
        tones(i) = nint(tones(i-1) * coeff)
    end do
end subroutine tunings


program main
    implicit none

    integer, parameter              :: num_tones    = 84
    integer, parameter              :: oct_div      = 19        !< 19-EDO
    real, parameter                 :: freq1        = 61.735    !< start scale on B1

    integer, dimension(num_tones)   :: tones
    integer                         :: i

    call tunings(tones, freq1, oct_div, num_tones)
    do i = 1, num_tones
        write (*,"(1x,i4,a)",advance="no") tones(i), &
                                           merge(new_line('a'), ' ', (mod(i,10).EQ.0))
    end do

    write (*,*) new_line('a')
end program main
