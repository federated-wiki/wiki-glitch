Welcome to Federated Wiki
=========================
This app provides an example of how to run a Federated Wiki. If you don't know what that is, run it to give it a try. If you decide you would like to create your own, do the following:

1. Remix this app.
2. Edit `.env` to set _OWNER_ and _PASSWORD_ and _COOKIE_SECRET_
3. Click `Show` in the header to open your wiki in another tab.
4. Follow instructions in the wiki itself to get started.

GitHub / Git Integration Notes
==============================
Glitch allows you to import and export projects from / to GitHub. It turns out that this isn't overly useful given how this project saves the data on your wiki. Any import or export results in wiki data not being included.

If, however, you want to experiment with modifying the source code to the wiki itself without going through the Glict interface, read below for some notes.

* A GitHub export will check in changes to the "glitch" branch on the remote repo.
* A subsequent import will overwrite files. It will not do a merge.
* Files not under git control are preserved during this operation.
* The .env file and .data directory are excluded by the global git ignore. See /etc/gitignore-global in the glitch project console.
* The data directory contains all of your wiki's pages.
* Note: The .data folder cannot be added to git. There's some protection that will prune it from git even if you do a force add.
* You do not need to worry about deleting the "glitch" branch, though you are free to do so. Neither will impact future imports, from what I can tell.

* You can also check out your glitch project via its native git endpoint. Note that files not under git control will not be included.
* Any scripts written to work in the glitch environment will need to be reworked to handle a plain git checkout.

Running Locally Outside of Glitch
=================================
The current version of this project does not support this capability. Research is underway on how to change that.

<hr>

_Hosted by **Glitch**, the friendly commmunity where you'll build the app of your dreams. Glitch lets you instantly create, remix, edit, and host an app, bot or site, and you can invite collaborators or helpers to simultaneously edit code with you._

_Find out more [about Glitch](https://glitch.com/about)._
