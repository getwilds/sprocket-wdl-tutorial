This is the simplest WDL we could think of.

First let's check to see if our WDL is formatted correctly.

```zsh
sprocket format . --check
```

If we want to take Sprocket's formatted advice, we can apply it:

```zsh
sprocket format . --overwrite
```

Next let's check to make sure our WDL is actually valid:

```zsh
sprocket check .
```

When we feel good about the validity of our WDL, we can run it:

```zsh
sprocket run hello.wdl
```