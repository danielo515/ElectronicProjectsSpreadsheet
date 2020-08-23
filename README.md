# Google apps Script with Ocaml

This project uses Ocaml to enhance the experience on google apps script.
It targets a very specific spreadsheet of mine, but it is an interesting experiment.

## Technologies used

It uses parcel for an easy, (almost) setup free building experience.
As standard library we use `reason-standard`.
In the future, when TableCloth gets its latest version published we may migrate to it.
Also, we are using an older version of bucklescript (bs-platform) because `reason-standard` does not work on newer ones (`7.3` and up)

## How it is built

The google apps script main file needs to be kept in JS, that is the index.js file.
The rest of the files are under `src` and are all OCaml files that get compiled to an UMD file.
The reason to do this is because GAS does not allow `import` or `require`, only global functions and variables.
So, all the Ocaml files are (for now) compiled under a global variable named Util using the `--global` option of parcel (that is effectively UMD).

## How to develop

Of course all the required scripts to build are under package.json scripts section, so all you need to do is:

```
yarn deploy
```

For the entire flow (build and publish)
or just `yarn build` if you only want to build.

In order to publish/deploy you need to have clasp globally installed and you need to be logged in with `clasp login`.
