# usqcd-install
My installation scripts for the SCIDAC stack + FUEL

The script "do_all.sh" handles all of the work downloading the source, building, and installing using mpicc for all pieces but QLA, which is compiled currently using gcc. 

Disclaimer: Technically, I should stop being lazy and figure out how to use "qinstall". This works, though, in a clunky, lazy, but in my opinion easier way to understand.

The script takes three arguments:
1) The directory to put the src, build, and install directories.
2) A file that should be "source"'d before compiling. This may contain paths to an appropriate version of the binary for mpicc and gcc.
3) Optionally, a suffix to put after the build and install directories. Without a suffix, the build and install directories will quite literally be called "build" and "install". If the suffix "ex" is given, as an example, the build and install directories will be named "build_ex" and "install_ex", instead. This allows for concurrent installations.

Three demo source files are included for Fermilab: source_ds.sh, source_bc.sh, and source_pi.sh. 

Contact me at weinbe2@bu.edu with any questions or suggestions!
