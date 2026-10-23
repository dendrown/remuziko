!! tunings  M2.1
!! @brief   An equal-tempered, octave-repeating, microtonal scale compiler.
!!
!! Based on Tunings.c from
!! Winsor, P. and DeLisa, G. (1991) Computer Music in C.
!!
!! @author Den Drown
!! @copyright 2026 Creative Commons Zero (CC0) v1.0 Universal license.

subroutine tunings(tones, freq1, oct_div, num_tones)
    integer, dimension(num_tones), intent(out)  :: tones
    real, intent(in)                            :: freq1
    integer, intent(in)                         :: oct_div
    integer, intent(in)                         :: num_tones

    real, parameter :: base = 2.0

    real    :: t9, coeff
    integer :: i
    t9    = 1.0 / oct_div
    coeff = fpower(base, t9)

    tones(1) = freq1 + 0.5
    do i = 2, num_tones
        tones(i) = tones(i-1) * coeff + 0.5
    end do
end subroutine tunings


function fpower(val, to_the)
    real                :: fpower
    real, intent(in)    :: val
    real, intent(in)    :: to_the

    ! FIXME: We shouldn't need to invert the value on negative "to_the" power,
    ! Just invoke exp() with the negative exponent...same thing, right?
    fpower = exp(log(val) * abs(to_the))
    if (to_the.LT.0.0) then
        fpower = 1.0 / fpower
    end if
end function fpower


program main
    implicit none

    integer, parameter              :: num_tones    = 84
    integer, parameter              :: oct_div      = 19
    real, parameter                 :: freq1        = 61.735    !< start scale

    integer, dimension(num_tones)   :: tones
    integer                         :: octive, i

    call tunings(tones, freq1, oct_div, num_tones)
    do i = 1, num_tones
        write (*,"(1x,i4,a)",advance="no") tones(i), &
                                           merge(new_line('a'), ' ', (mod(i,10).EQ.0))
    end do

    write (*,*) new_line('a')
end program main
