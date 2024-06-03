# .dotfiles
A repository containing my personal system dotfiles, organised by application, for use with [GNU Stow](https://www.gnu.org/software/stow/).

## Summary
[GNU Stow](https://www.gnu.org/software/stow/) empowers you to easily manage application configuration files (AKA dotfiles) by replacing existing configuration files in your home directory with symbolic links pointing to the actual file content stored within a centrally managed, well-organised git repository. This allows for granular management of system configuration on a per-application basis, ensuring a clean, maintainable, and repeatable environment with all configuration content under version control.

## Dependencies
Ensure you have the following installed on your system:
- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

### Installing Dependencies
#### Debian/Ubuntu and derivatives:
```bash
sudo apt install git stow
```

#### macOS:
```bash
brew install git stow
```

#### Windows (MSYS2):
```bash
pacman -S git stow
```

## Usage
Clone the `.dotfiles` repository into your `$HOME` directory using [Git](https://git-scm.com/) and then navigate to the newly cloned repo:

```bash
git clone git@github.com:justJackjon/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### Adding Configuration
Inside the `~/.dotfiles` directory, you will find subdirectories for each application. Use [GNU Stow](https://www.gnu.org/software/stow/) to create symlinks for the desired application configurations. For example, to `stow` the configuration for Bash, Starship, and SpaceVim:

```bash
stow bash
stow starship
stow spacevim
```

To stow all configurations at once, from the `~/.dotfiles` directory execute:

```bash
stow */
```

The `stow` command creates symbolic links in your home directory that point to the actual configuration files stored in the `.dotfiles` directory. This setup allows applications to follow the newly created symlinks to the actual file content under source control, enabling you to manage system configuration centrally whilst preserving the expected file system locations applications will look for when searching for your dotfiles.

### Removing Configuration
You can easily manage which configurations are active by using Stow. For example, if you need to remove the symlinks for an application's configuration, you can use the `--delete` or shorthand `-D` option. Ensure you are in the `~/.dotfiles` directory when running this command:

```bash
cd ~/.dotfiles

# NOTE: This example removes any symlinks added for Bash configuration
#       without deleting any actual config files in `~/.dotfiles/bash.`
stow -D bash
```

### Advanced Usage
For advanced usage run `stow --help` to see all available options, or for more detailed information from the command line, execute `man stow`.

## Version Control
By keeping all system config files within a git repository and committing any changes to the remote, you can easily track changes over time and share configurations between different systems.
