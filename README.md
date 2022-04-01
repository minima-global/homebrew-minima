# homebrew-minima

If you're using MacOS and you're familiar with [homebrew](https://brew.sh/), then this guide will explain how to get Minima up and running on it.

Three use cases:

* You want to run Minima as a background service (maybe as an Incentive Program participant) and poke it with commands once in a while

* You want to run Minima from your shell as and when you need it

* You want to be doing both the above at the same time

This homebrew installation will allow you to do all three.

For running Minima in the background, `brew services` will use MacOS's launchd. This is configured to run Minima in the background when your OS boots up on default ports. Logs, data and config all use specific locations. (They can be seen under **Caveats** section during installation).

For running Minima adhoc, you can run `minima` which will be available on your bin path. This command will start minima in-line using default ports unless specified otherwise. Logs are output in-line. Commands can also be run in-line (type `help` after running). Running Minima ad-hoc will not use the same config or data as the one run by `brew services`. Neither will it use the same log location.

If you want to do both, you need to run `minima` but with different ports to the one run by `brew services`.
i.e. `minima -port 7001 -rpc 7002`

### Installation

1. Add a tap (It's like a package repository. Points to this repo)
```sh
brew tap minima-global/minima
```

2.
```sh
brew install minima-global/minima/minima
```

3. Installation output tells you where your default log (for minima as a service only) and config files are.


### Starting, restarting, stopping minima (as with brew services)
```sh
brew services start minima  # start
```
```sh
brew services restart minima  # restart, avoid using as brew services does not give minima enough time to stop sometimes
```
```sh
brew services stop minima  # stop
```
```sh
brew services list  # to flag any errors preventing successful start
```

### Starting minima (ad-hoc)
```sh
minima # with parameters i.e. -rpcenable
```

### Using mcli
Examples:
```sh
mcli help
```

```sh
mcli incentivecash uid:xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

### Updating
Unfortunately without setting our tap to auto-update, it seems brew only allows you to run update on all taps at once including homebrew iteself. After the new formula has been pulled down we can run reinstall.
```sh
brew update
brew reinstall minima

brew services stop minima
brew services start minima

```
