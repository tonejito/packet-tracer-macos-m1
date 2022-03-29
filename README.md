# Open Packet Tracer on macOS M1

This repo contains a wrapper script that enables using Packet Tracer on a Mac with M1 processor (ARM) using Rosetta 2.

Packet Tracer is not optimized for M1 (ARM), and there is no "Open with Rosetta" option in the app info, so a manual solution needs to be used.

Author: Andrés Hernández - _tonejito_ - `= ^ . ^ =`

This software is released under the terms of the "BSD 2-Clause License", see [LICENSE] for more information.

--------------------------------------------------------------------------------

Packet Tracer for macOS (Intel) 64 bit can be downloaded from the NedAcad or Skills for All websites (**free** registration required):

- https://www.netacad.com/portal/resources/packet-tracer
- https://skillsforall.com/resources/lab-downloads

Open the DMG, and run the installer as usual, you will have a folder in `/Applications/Cisco\ Packet\ Tracer\ ${VERSION}`

You will need to install Rosetta 2, you may use the `--agree-to-license` command line option if desired.

```
# softwareupdate --install-rosetta
```

- https://osxdaily.com/2020/12/04/how-install-rosetta-2-apple-silicon-mac/

There is no "Open using Rosetta" option in the Packet Tracer app, so you will have to use the provided launcher

- https://support.apple.com/en-us/HT211861

```
% xcode-select --install
```

- https://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/

Then install the wrapper script with `make`.
You can also check the `Makefile` and use the `install` command from there if you don't want to install the XCode command line utilities.

```
% make install
sudo install -o root -g wheel packet-tracer /usr/local/bin
Password:
which packet-tracer
/usr/local/bin/packet-tracer
which packet-tracer | xargs -r ls -l
-rwxr-xr-x  1 root  wheel  505 Mar 28 19:14 /usr/local/bin/packet-tracer
```

You can run the `packet-tracer` wrapper script to open Packet Tracer on a M1 Mac.

```
% ./packet-tracer
+./packet-tracer:13> /usr/bin/arch -x86_64 /bin/zsh -c 'open --wait-apps /Applications/Cisco\ Packet\ Tracer\ 8.1.1/Cisco\ Packet\ Tracer\ 8.1.1.app'
```

You can use the wrapper script to create a __wrapper app__ with Automator or Script Editor, but that is entirely up to you.
