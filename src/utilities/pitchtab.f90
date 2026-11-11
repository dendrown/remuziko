!> @brief   Initializes a pitch data table corresponding to integer values 1..N.
!!
!! Based on Pitchtab.c from
!! Winsor, P. and DeLisa, G. (1991) Computer Music in C.
!!
!! @author Den Drown
!! @copyright 2026 Creative Commons Zero (CC0) v1.0 Universal license.

module pitchtab_mod
    implicit none
    private
    public :: pitchtab, display_pitches

    !> Characters per pitch name: letter, optional sharp, octave digit (blank-padded).
    integer, parameter :: pitch_name_len = 3

    !> Chromatic pitch names C0..C7 (85 entries, 12 per octave).
    !! Octave numbers follow the book's labelling.
    character(len=pitch_name_len), parameter :: pitches(*) = [                      &
        'C0 ','C#0','D0 ','D#0','E0 ','F0 ','F#0','G0 ','G#0','A0 ','A#0','B0 ',    &
        'C1 ','C#1','D1 ','D#1','E1 ','F1 ','F#1','G1 ','G#1','A1 ','A#1','B1 ',    &
        'C2 ','C#2','D2 ','D#2','E2 ','F2 ','F#2','G2 ','G#2','A2 ','A#2','B2 ',    &
        'C3 ','C#3','D3 ','D#3','E3 ','F3 ','F#3','G3 ','G#3','A3 ','A#3','B3 ',    &
        'C4 ','C#4','D4 ','D#4','E4 ','F4 ','F#4','G4 ','G#4','A4 ','A#4','B4 ',    &
        'C5 ','C#5','D5 ','D#5','E5 ','F5 ','F#5','G5 ','G#5','A5 ','A#5','B5 ',    &
        'C6 ','C#6','D6 ','D#6','E6 ','F6 ','F#6','G6 ','G#6','A6 ','A#6','B6 ',    &
        'C7 ']

contains
    !> @brief Return the chromatic pitch-name table, one name per semitone.
    !!
    !! [Utilities MIC 2.3]
    !!
    !! Index 1 is C0; each following index is one semitone higher, so names(i) 
    !! labels the i-th note of the table.
    !!
    !! @return  Pitch names, lowest to highest, blank-padded to pitch_name_len
    pure function pitchtab() result(names)
        character(len=pitch_name_len)   :: names(size(pitches))
        names = pitches
    end function pitchtab


    !> @brief Print the pitch-name table to standard output, one octave per line.
    !!
    !! The book prints 15 names per line; 12 keeps each octave's C in the same column.
    subroutine display_pitches()
        write (*,"(12(2x,a))") pitchtab()
    end subroutine display_pitches
end module pitchtab_mod


program main
    use pitchtab_mod
    implicit none

    call display_pitches()
end program main
