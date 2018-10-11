![screenshot of htop running on tmux+bash in ssh client](https://cloud.githubusercontent.com/assets/1160582/21764312/b1fbc84a-d662-11e6-931d-b3b674470019.png)

Binaries included in this repository
====================================

* htop-2.0.2 (https://hisham.hm/htop/)
* bash-4.4 (https://www.gnu.org/software/bash/)
* ethtool-4.8 (http://sourceforge.net/projects/gkernel/)
* tmux-1.9-6 (https://github.com/ThomasAdam/tmux, http://tmux.sf.net)
* tor-0.3.0.1-alpha (https://www.torproject.org/)
* "vim" wrapper for busybox
* nano-2.7.4 (https://www.nano-editor.org/)
* ... (missing some nice commandline utility? create Issue) 

Libraries included for some binaries
----------------------------------

* libncursesw-5.9 (needed for htop&nano, http://invisible-island.net/ncurses/)
* libtinfo-5.9 (needed for htop&tmux, https://www.gnu.org/software/ncurses/)
* libevent (needed for tmux, http://www.monkey.org/~provos/libevent/)

Installation instructions
=========================

Just copy files via scp:
``` scp -r etc usr root@<steamlink_ip:/```

You will need sshd access to your steamlink, feel free to follow guide on how to go about that here:

http://mcd1992.blogspot.cz/2015/10/alright-this-was-lot-easier-than-i.html

To get use bash automatically upon ssh login either copy ```./home/steam/.profile``` or modify ```/etc/passwd``` (former is probably preferable since /etc/passwd change might modify system behavior outside login shell - not tested).

Tor proxy
=========

To run tor proxy automatically, add following to your ```/home/steam/rc.local```:

```
#make rootfs rw
mount -o remount,rw /

#make sure we have working dns services
echo "nameserver 8.8.8.8
nameserver 127.0.0.1
nameserver ::1" >> /etc/resolv.conf

#make sure network time isn't 1970
ln -s /etc/ntpd.conf /etc/ntp.conf >/dev/null 2>&1
ntpd -q

nice -n 10 /usr/local/sbin/tor -f /etc/torrc >/tmp/tor.log 2>&1 &
```

Please note that steamlink only has about 200MB of RAM available which isn't enough to run Tor as relay/bridge,
memory usage in this case might cause your device to run out of memory (proxy client should be fine - steamlink can run at roughly ~20Mbit speeds).

Known issues
============

If you get linking problems with external libraries please run ```ldconfig``` in your ssh shell.

If something else doesn't work, please file a issue report.

LICENSING WARNING
=================

Please note that this distro uses third-party compiled (debian, ubuntu or my own) software distributed in binary form.
For licensing, please refer to each package listed above. I haven't done any modifications to source code,
merely crosscompiled it (if that). Feel free to distrust this repository and choose not to use it in any way.
I could have provided build scripts that would build it from source from original repos, but I'm too lazy for that.
Hence don't use this for things other than personal use and don't binaries further (or you are just as lazy as me).

I provide no warranties, no liability to the fullest extent of the law. FSF & RMS please don't sue me.
