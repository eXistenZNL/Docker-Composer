# Composer

This image holds Composer together with Git, Subversion and PHP 5.6 + required modules.

[![](https://badge.imagelayers.io/existenz/composer:latest.svg)](https://imagelayers.io/?images=existenz/composer:latest 'Get your own badge on imagelayers.io')

It makes use of the runas functionality found in [my base image](https://hub.docker.com/r/existenz/base/) so this means we can enjoy both caching and token authentication, both of which use the .composer directory in your home folder.

## TL;DR:

Run composer right away without any headache!

```bash
alias composer='docker run --rm -i -t -e UID=$(id -u) -v ~/.composer:/home/.composer -v $(pwd):/cwd existenz/composer'

composer help
```

## Usage

Running Composer as the current logged in user can be done like this:

```
docker run --rm -i -t \
-e UID=$(id -u) \
-v ~/.composer:/home/.composer \
-v $(pwd):/cwd \
existenz/composer
```

Of course, it's much easier to put the above in an alias like so: alias composer="docker command goes here"

Now you can just run `composer install`, `composer update`, etc. It's magic!

## Limitations

Some packages or frameworks might require a specific PHP module which can be missing from this image, or want to run a post install command which might be failing because of the limited list of modules.

It was a choice between creating a huge image with all PHP modules and more, or having to specify one or two flags sometimes, and I chose the latter. Hence the size of this image.

So, whenever you run into this situation, simply add the flags `--ignore-platform-reqs`, `--no-scripts`, etc. depending on your needs.

## Bugs, questions, and improvements

If you found a bug or have a question, please open an issue on the GitHub Issue tracker. Improvements can be sent by a Pull Request against the develop branch and are greatly appreciated!

