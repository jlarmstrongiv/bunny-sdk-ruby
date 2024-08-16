# Contributing

## Installing

- `gem signin`
- `gem install gem-release`

## Updating

- `bundler install`
- `git add -A`
- `git commit -m "message"`
- bump version in `lib/bunny/sdk/version.rb` or run `gem bump --version patch`
- `git push`
- `rake build`
- `rake release`
