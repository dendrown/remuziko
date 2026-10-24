!> @brief   An equal-tempered, octave-repeating, microtonal scale compiler.
!!
!! Based on Tunings.c from
!! Winsor, P. and DeLisa, G. (1991) Computer Music in C.
!!
!! @author Den Drown
!! @copyright 2026 Creative Commons Zero (CC0) v1.0 Universal license.

module tunings_mod
    implicit none
    private
    public :: tunings
contains
    !> @brief Compile an equal-tempered, octave-repeating scale into a frequency table.
    !!
    !! [Utilities MIC 2.1]
    !!
    !! Each step is a fixed frequency ratio of 2**(1/oct_div) above the previous one,
    !! so oct_div steps span exactly one octave (a doubling of frequency).
    !!
    !! @parameter[out]  tones   Scale frequencies in whole Hz, lowest to highest;
    !!                          size sets the number of steps
    !! @parameter[in]   freq1   Frequency in Hz of the scale's first note (tonic)
    !! @parameter[in]   oct_div Equal steps per octave: 12 = standard tuning,
    !!                          19 = 19-EDO (each step is 1200/oct_div cents)
    subroutine tunings(tones, freq1, oct_div)
        integer, intent(out)    :: tones(:)
        real, intent(in)        :: freq1
        integer, intent(in)     :: oct_div

        real, parameter :: base = 2.0

        real    :: t9, coeff
        integer :: i
        t9    = 1.0 / oct_div
        coeff = base ** t9

        ! NOTE: Rounding accumulates. Each entry is computed from the previous already-rounded integer,
        ! so rounding errors carry forward. It’s probably invisible at this size, but we can verify
        ! by comparing against the closed form: freq1 * 2.0**(real(i-1)/oct_div)
        tones(1) = nint(freq1)
        do i = 2, size(tones)
            tones(i) = nint(tones(i-1) * coeff)
        end do
    end subroutine tunings
end module tunings_mod


program main
    use tunings_mod
    implicit none

    integer, parameter              :: num_tones    = 84        !< Total scale steps (84/19 = about 4.4 octaves)
    integer, parameter              :: oct_div      = 19        !< 19-EDO: about 63.2 cents per step
    real, parameter                 :: freq1        = 61.735    !< start scale on B1 (A4 = 440 Hz tuning)

    integer, dimension(num_tones)   :: tones

    call tunings(tones, freq1, oct_div)
    write (*,"(10(1x,i4))") tones
end program main
