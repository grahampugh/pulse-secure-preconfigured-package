# pulse-secure-preconfigured-package

Creates a preconfigured package for deploying Juniper Network's Pulse Secure client. This 
installer is based on [@rtrouton]'s blog post 
[Deploying a pre-configured Junos Pulse VPN client on OS X][1].

Requirements
---------

1. Downloaded Pulse Secure installer from Juniper Networks. At the time of writing, the 
   current version is named `ps-pulse-mac-5.2r5.0-b869-installer.dmg`.
2. A jnprpreconfig config file from your organisation.  A non-working example is provided 
   in this repo.

Operation
---------

**1. Install The Luggage:**

If you don't already have The Luggage, install it as follows (as per [@grahamgilbert]'s blog post [The Luggage: An Introduction][2]:

```bash
cd
git clone https://github.com/unixorn/luggage.git
```

At this point, if you don't already have git installed, you will be prompted to do so. If that happens, install git and rerun the last command. Then continue:

```bash
$ cd luggage
$ make bootstrap_files
```

**2. Clone this repo:**

```bash
cd
git clone https://github.com/grahampugh/munki-with-config.git
```

**3. Copy the Pulse Secure DMG and jnprpreconfig file into the cloned directory and edit config as necessary:**

   * cd into the created directory
   * Copy your downloaded Pulse Secure DMG into this directory. Make sure there are no 
     other DMGs in the directory.
   * If the DMG you downloaded from the Pulse Secure website has a name in the form 
     `ps-pulse-mac-5.2r5.0-b869-installer.dmg`, the version number will be automatically
     extracted from the name. If you've renamed it in some way, or if future releases are
     named in a different way, you'll need to edit the `PACKAGE_VERSION` variable in 
     `Makefile`.
   * Copy your `.jnprpreconfig` file into this directory. Make sure there is only one 
     `.jnprpreconfig` file in this directory.
   * If you wish to "brand" the installer, edit `Makefile` and change the BRANDING 
     variable to match your Organisation's Name.  The default is "Preconfigured", 
     resulting in a package name of "Pulse-Secure-Preconfigured.pkg".
   * If you wish to sign the package, uncomment the following line in `Makefile` and 
     change `Your Org` to match your Developer ID name:

```#PB_EXTRA_ARGS+= --sign "Your Org"```

**4. Make the package:**
```bash
make pkg
```

[1]: https://derflounder.wordpress.com/2015/03/13/deploying-a-pre-configured-junos-pulse-vpn-client-on-os-x/
[2]: http://grahamgilbert.com/blog/2013/08/09/the-luggage-an-introduction/
[@grahamgilbert]: https://twitter.com/grahamgilbert
[@rtrouton]: https://twitter.com/rtrouton
