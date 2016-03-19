Generic Makefile
==================

A generic makefile to be used in your C projects.
It is reasonably small, but has some sweet features:

- Automatically detects changes in dependencies (eg header files)
- Detects system compiler / linker (via environment variable `CC` and `LD`)
- Ability to amend `CFLAGS`, `CPPFLAGS`, `LDFLAGS`, or `LDLIBS` via cli
- `install` and `clean` targets, the former also respects `PREFIX`
- Genereting gdb debug files
- Sane compiler defaults


Before use
==================

Change the `EXE` variable to your desired name and you're good to go.

You can also do the **optional** changes below if you desire:

- Change default `CFLAGS`, and `LDFLAGS`
- Change default compiler / linker (via `CC` and `LD` variables)


License
=======

BSD 2-clause

Copyright (c) 2016, Arvid Gerstmann
All rights reserved.
