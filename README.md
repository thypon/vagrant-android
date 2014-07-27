vagrant-android
===============

Automatic Build Server for Android ROMs.

This creates a build Virtualmachine with [Vagrant](http://vagrantup.com/).

Hardware Requirements
---------------------

- CPU: Quad Core or more
- Memory: 16GB or more
- Hard Drive: 100GB or more

Software Requirements
---------------------

- [Install Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [Install Vagrant](http://downloads.vagrantup.com/)

Get Started
-----------

Create the virtual machine and installs all the needed packages:

    user@host> vagrant up # It can takes several hours depending on your internet connection
    
Connect to the vm with:

    user@host> vagrant ssh
    
Your android build distribution is ready to be use:

    vagrant@guest> # do whatever you want
    
Real World Android Build
------------------------

    user@host> vagrant up # Creates and Configure the VM
    user@host> vagrant ssh # Connects to the VM
    vagrant@guest> mkdir aosp && cd aosp # Make and Move to aosp directory 
    vagrant@guest:aosp> repo init -u https://android.googlesource.com/platform/manifest -b android-4.4.4_r2
    vagrant@guest:aosp> repo sync \
      # It can takes several hours depending on your internet connection
    vagrant@guest:aosp> lunch 1 # Selects the generic arm build
    vagrant@guest:aosp> make -j4 \
      # It can takes several hours depending on your horsepowers

Usefull Links
-------------

- [Android Build Informations](https://source.android.com/source/building-running.html)
- [Vagrant Docs](http://docs.vagrantup.com/v2/)
- [Virtualbox Docs](https://www.virtualbox.org/wiki/Documentation)