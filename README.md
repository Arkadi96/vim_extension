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

## Dependencies

If you do not have **Universal Ctags** installed, install it with:

```bash
sudo apt install universal-ctags
```

Verify the installation:

```bash
ctags --version
```

## Notes

Some terminal emulators may display underlines beneath variable names, function names, or types. This is caused by Vim's spell checker.

To disable spell checking for syntax elements while keeping spell checking enabled for comments, comment out the following line in your `vimrc`:

```vim
autocmd FileType c,cpp,hpp syntax spell toplevel
```

This disables spell checking for C/C++ syntax while preserving spell checking in comments.
