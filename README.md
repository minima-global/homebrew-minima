# homebrew-minima

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

### Upgrading
TODO
