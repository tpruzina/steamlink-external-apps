Various (crosscompiled) binaries that I've found useful to add to steamlink

BINARIES:

* htop-2.0.2 (https://hisham.hm/htop/)
* bash-4.4 (https://www.gnu.org/software/bash/)
* ethtool-4.8 (http://sourceforge.net/projects/gkernel/)
* "vim" wrapper for busybox

LIBRARIES: 
* libncursesw-5.9 (needed for htop, http://invisible-island.net/ncurses/)
* libtinfo-5.9 (needed for htop, https://www.gnu.org/software/ncurses/)


INSTALLATION INSTRUCTIONS:

Just copy files via scp:
``` scp -r etc usr root@<steamlink_ip:/```

You will need sshd access to your steamlink, feel free to follow guide on how to go about that here:
http://mcd1992.blogspot.cz/2015/10/alright-this-was-lot-easier-than-i.html

To get use bash automatically upon ssh login either copy ./home/steam/.profile or modify /etc/passwd .
If you get linking problems with external libraries please run ```ldconfig``` it your ssh shell.
If something else doesn't work, please file a issue report.

WARNING ABOUT LICENSING ISSUES:

Please note that this distro uses third-party compiled (debian, ubuntu or my own) software distributed in binary form.
For licensing, please refer to each package listed above. I haven't done any modifications to source code,
merely crosscompiled it (if that). Feel free to distrust this repository and choose not to use it in any way.
I could have provided build scripts that would build it from source from original repos, but I'm too lazy for that.
Hence don't use this for things other than personal use and don't binaries further (or you are just as lazy as me).

I provide no warranties, no liability to the fullest extent of the law. FSF & RMS please don't sue me.
