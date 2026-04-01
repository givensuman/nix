After installing Linux for the first time around 3 years ago it didn't take me long to start distro-hopping. I soon got tired of moving around my configs and re-installing all the software I need so I wrote some scripts to do that for me. It always felt fragile.

Then I started using Silverblue and other atomic solutions around a year ago. I was able to bake all system configuration into a container image. This was cool and technically declarative, but it required pushing to GitHub CI/CD just to rebuild my own operating system.

I started bootstrapping the image into itself and doing some `bootc` hacks to rebuild locally, only to realize I was essentially recreating NixOS. So now I'm using NixOS.
