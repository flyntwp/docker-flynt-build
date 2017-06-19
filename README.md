# docker-flynt-build

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Docker image to build Flynt projects.

This docker image is intended to be used on a CI or CD server. With it you can install all composer PHP packages, install npm and bower dependencies, and run the `gulp build` task.

## Table of Contents

- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

## Usage

To find out how to work with docker and how to run a container from an image, please refer to the extensive [docker documentation](https://docs.docker.com).

The following is one example how to build all vendor and theme files.

```bash
APP_DIR="/usr/src/app"
docker run --rm -e UID=`id -u $USER` -e GID=`id -g $USER` -v /path/to/your/source/folder:$APP_DIR -w $APP_DIR bleech/flynt-build:php7.0-node6 \
	bash -c "composer install \
    && cd web/app/themes/yourThemeFolder \
    && npm install -g gulp bower \
    && yarn \
    && bower --allow-root install \
    && yarn build \
    && chown -R \$UID:\$GID $APP_DIR"
```

## Contribute

To contribute, please use GitHub [issues](https://github.com/flyntwp/docker-flynt-build/issues). Pull requests are accepted. Please also take a moment to read the [Contributing Guidelines](https://github.com/flyntwp/guidelines/blob/master/CONTRIBUTING.md) and [Code of Conduct](https://github.com/flyntwp/guidelines/blob/master/CODE_OF_CONDUCT.md).

If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

MIT © bleech
