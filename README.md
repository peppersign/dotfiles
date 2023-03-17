# dotfiles

This is huge. Newest update of my Arch Linux system. There's really a ton of **improvementes** and **additions**, I hope
you enjoy it. With enough talk, here is the *preview*

> If you are looking for the most recent changelog, then please
> look at [CHANGELOGS][changelog].
> Also, here is the [wallpaper][wall]

**Fetch:**

- **Windows Manager ➤** [`i3-gaps`](https://github.com/catsploit/dotfiles/tree/master/.config/i3)
- **Text Editor** ➤ [`neovim`](https://github.com/catsploit/dotfiles/tree/master/.config/nvim)
- **Notification Manager** ➤ [`dunst`](https://github.com/catsploit/dotfiles/tree/master/.config/dunst)
- **Application Launcher** ➤ `rofi`
- **Terminal** ➤ [`alacritty`](https://github.com/catsploit/dotfiles/tree/master/.config/alacritty)
- **Shell** ➤ [`bash`](https://github.com/catsploit/dotfiles/tree/master/.bashrc)
- **Statusbar** ➤ [`polybar`](https://github.com/catsploit/dotfiles/tree/master/.config/polybar)


![sus](https://github.com/peppersign/dotfiles/blob/master/finally.png  "amogus")


## ❖ CHANGELOGS

<details>
    <summary><strong>Alpha 0.1</strong></summary>

```markdown
CHANGELOG
---------

+ Switch from dwm to i3
+ Add git bash prompt
+ Use polybar instead of dwmbar
+ Update vimrc
+ Add archguide.md
+ Add script utilities
    * assembly: compile and link asm files
    * c: compile C files
    * shanime: anime list manager
    * shoot: wrapper around the mss screenshoot tool
    * soydev: fetch tool
```

</details>


<details>
    <summary><strong>Alpha 0.2</strong> <kbd>latest</kbd></summary>

```markdown
CHANGELOG
---------

+ Improve current configuration
    * alacritty
    * placeholder
    * polybar
    * picom (ibhagwan fork)
    This fork provides support for both rounded corners and dual-kawase blur

+ Add notification manager dunst
+ Switch from dmenu to rofi
+ Switch from vim to neovim
+ Add new scripts
    * btw: Replace fetch tool
    * shoot: Rewrite screenshoot tool in bash
    * lang: Easily switch from X to Y keyboard layout

+ New powerline bash prompt (GIT support)
+ Add application launcher
+ Add powermenu
+ Add fonts dir
+ Replace wallpaper
+ The rest are just some quality of life features that I do not think deserve to be shown.
  There is just a ton of new things in each change mentioned here, but I will not mention them
  for the sake of readibility
```

</details>


## ❖ Setup

> As of the time being there's no installation script, I made this with the purpose of people looking at it
> so they can get a little bit of help when *ricing*. There are some [issues][issue] that I need to solve first in order
> to make this **usable for anyone.**

> Even so, I'm currently working on documenting how to install it by yourself. It won't be hard I guess.
> Expect me to focus on solving known issues first so that building this configuration is easier.


## ❖ Keybinds

`Work in progress!`


## ❖ TODO

| Task                                                   | Status                 | Priority        |
| ------------------------------------------------------ | ----------------------:| --------------: |
| .files highly dependent on absolute paths              | `working on`           | :red_circle:    |
| installation script                                    | `pending`              | :red_circle:    |
| nvim statusbar highly dependent on gruvbox             | `pending`              | :yellow_circle: |
| dependency list                                        | `pending`              | :yellow_circle: |
| manual installation documentation                      | `working on`           | :yellow_circle: |
| add help links for every tool mentioned here           | `pending`              | :green_circle:  |
| improvements                                           | `pending`              | :green_circle:  |
| theme-switcher                                         | `future`               | :black_circle:  |
| pywal support                                          | `future`               | :black_circle:  |


## ❖ Credits

`Work in progress!`


> Please keep in mind, these dotfiles are not made for someone to rip them off onto their systems.
> It won't work, unless you take some time to rewrite some paths which I think is the main issue.
> I will probably take up to 3 months until there is a proper installation script since I ~~wasted~~ spent 2 months
> on this. And honestly, I feel like taking a break.

[issue]: https://github.com/catsploit/dotfiles#-todo
[changelog]: https://github.com/catsploit/dotfiles#-changelogs
[wall]: https://github.com/catsploit/dotfiles/tree/master/something.jpg
