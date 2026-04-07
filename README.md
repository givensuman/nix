Since starting to use Linux 2-3 years ago I've done a lot of distro-hopping. Eventually I got tired of reinstalling and configuring a system every other week so I created a system of scripts and services to automate the process.

Then I discovered atomic SilverBlue and built my own operating system on top of it, which was nice because the configuration was declarative and didn't require management. However, as a container image this means all changes to my system needed to run through a remote `docker-buildx` job.

So I bootstrapped the image within itself and got `bootc` to be able to rebase to itself locally. This worked okay, but I realized I was just reinventing NixOS. So now I use NixOS. Thanks for coming to my TED talk.
