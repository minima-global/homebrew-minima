# homebrew-minima

*Makes a minima executable available on $PATH. Also runs minima as a service on startup.*

### Instructions

1. Add a tap (It's like a package repository. Points to this repo)
```sh
brew tap minima-global/minima
```

2. Install from a jar which has code from the latest dev branch but might not always be up-to-date.
```sh
brew install --HEAD minima-global/minima/minima
```

3. Installation output tells you were your default log (for minima as a service only) and config files are.


### Starting, restarting, stopping minima (as a service)
```sh
brew services start minima
brew services restart minima
brew services stop minima
brew services list  # to flag any errors preventing successful start
```

### Starting minima (ad-hoc)
`minima`

### Updating
Unfortunately without setting our tap to auto-update, it seems brew only allows you to run update all taps at once including homebrew iteself. After the new formula has been pulled down we can run reinstall. Changes to minima (as a serivce) only take effect after restart.
```sh
brew update
brew reinstall minima-global/minima/minima
```

