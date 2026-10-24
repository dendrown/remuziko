# remuziko

Learn-as-you-go retro-MIDI toolkit. The name is Esperanto for "retro music" (*retroa muziko*).

Fortran ports of the exercises in *Computer Music in C*, written while learning MIDI and music theory
for retro computers. Code is grouped by book chapter under `src/`.

## Reference

Winsor, P. and DeLisa, G. (1991). *Computer Music in C*. Blue Ridge Summit, PA: Windcrest/McGraw-Hill.
ISBN 0-8306-3637-4. (Reprinted by UNT Press, 2001.)

A C library of algorithmic-composition routines for melody, harmony, rhythm and related musical parameters.

## Building

Requires `gfortran`, `autoconf` and `automake`.

```sh
./autogen.sh        # once after cloning (runs autoreconf --install)
./configure FCFLAGS="-std=f2023 -Wall -Wextra -fcheck=all -g"
make
./src/utilities/tunings
```

NOTE: `-std=f2023` needs GCC 13 or later; use `-std=f2018` on older versions.

## License

CC0 1.0 Universal. See `LICENSE`.
