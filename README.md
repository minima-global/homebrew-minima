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

3. Follow instructions from the output


### Restarting
Noticed that minima needs a few seconds to stop. Avoid using `brew services restsart minima` does allow for the `stop` to to complete before `start` is run.

### Updating
Unfortunately without setting our tap to auto-update, it seems brew only allows you to run update all taps at once including homebrew iteself. After the new formula has been pulled down we can run reinstall.
```sh
brew update
brew reinstall minima-global/minima/minima
```

