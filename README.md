# dotfiles

Configuration files and scripts for my development environment on macOS & Linux.

## How to install

Open a terminal and run the commands below.

### Step 1 - Install Homebrew (macOS only)

[Homebrew](https://brew.sh) is an easy and flexible way to install the UNIX tools Apple didn’t include with macOS.

Install Homebrew by running the following command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Once the installation is done, follow the given *Next steps* instructions.

### Step 2 - Install dotfiles

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/christoffercarlsson/dotfiles/HEAD/install.sh)"
```

**Warning:** Running the command above may overwrite your existing configuration files.

### Step 3 - Restart your terminal

After you've run the commands listed above, quit and re-open your terminal for all changes takes effect.

### Step 4 - Enter your Git credentials

Run the following command to configure your Git credentials:

```bash
set-git-author
```

Enter the name and email address that you want to associate your Git commits with. The script will then attempt to import your PGP public key from a keyserver automatically based on your email address (if your public key is not found on a keyserver you'll need to import it manually).

## License

These dotfiles are licensed under [The Unlicense](./LICENSE).
