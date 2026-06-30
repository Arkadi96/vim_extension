# Vim Configuration

A user-friendly, multi-functional Vim configuration for **C** and **C++** development.

## Features

- Custom (non-default) color scheme
- Automatic tag generation for C/C++ projects
- Fast navigation to declarations and definitions using `ctags`
- Project-wide search shortcuts
- Automatic indentation and formatting
- Highlighting of:
  - Trailing whitespace
  - Lines exceeding 80 characters
- Spell checking for comments
- AI Code Completion (Codeium)

## Dependencies

If you do not have **Universal Ctags**, **curl** installed, install it with:

```bash
sudo apt install universal-ctags
sudo apt install curl
```

Verify the installation:

```bash
ctags --version
curl --version
```

Install Plugins (vim-plug): Open vim and run:

```bash
:PlugInstall
```

AI Code Completion (Codeium): This setup includes Codeium plugin support via vim-plug:

```bash
:Codeium Auth
```

Paste your token once. It will be stored locally in:

```bash
~/.codeium/config.json
```

## Notes

Some terminal emulators may display underlines beneath variable names, function names, or types. This is caused by Vim's spell checker.

To disable spell checking for syntax elements while keeping spell checking enabled for comments, comment out the following line in your `vimrc`:

```vim
autocmd FileType c,cpp,hpp syntax spell toplevel
```

This disables spell checking for C/C++ syntax while preserving spell checking in comments.
