## ClassiCube (not so Experimental anymore) Unofficial Flatpak

> [!IMPORTANT]
> The id has been changed (right now) from `net.classicube.Classicube` to `net.classicube.flatpak.client`, if you had existing data, [run this script to migrate it](migrate-install.sh)

### How you can help

You can help by:

- Testing the Flatpak (and heavily if you want, we need the bugs ironed out :D)
- Spreading awareness (so people could test it)
- Something else here maybe?

### Why aren't you hosting this on Codeberg you Forgejo fanboy?
idk

### How to build the Flatpak

#### What you will need:
- Flatpak (obviously)

- [Flathub](https://flathub.org/setup) set up properly, no weird filters... (*cough cough fedora 37 and under cough cough*)

- Flatpak Builder:

```bash
flatpak install org.flatpak.Builder
```

(Add `--user` if you install your Flatpaks with a user install, see https://docs.flathub.org/docs/for-users/user-vs-system-install)

- A brain (can be small, medium, large or ***extra*** large)

- A terminal open and available

- This repo cloned and ready

Ready? Let's start.

#### Steps
(Like above, add `--user` if you install your Flatpaks with a user install, see [here](https://docs.flathub.org/docs/for-users/user-vs-system-install))

1. We will need to start the build and all that good stuff, this will require a internet connection.

```bash
flatpak run org.flatpak.Builder --install-deps-from=flathub --repo=repo --force-clean build-dir net.classicube.flatpak.client.yml
```

If you don't have the required dependencies installed, this should install them automatically.

2. Now, we need to build a bundle (`*.flatpak`).

```bash
flatpak build-bundle repo net.classicube.flatpak.client.flatpak net.classicube.flatpak.client
```

Note that you can call this bundle anything, but the last part ***has to be*** `net.classicube.flatpak.client`.

3. Final step, installing the bundle.
```bash
flatpak install --user net.classicube.flatpak.client.flatpak
```
I would recommend installing as user so you don't have to keep entering your password when testing and uninstalling builds, if you have a different name for your bundle, change it accordingly in this command.
