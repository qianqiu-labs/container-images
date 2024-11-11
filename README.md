# The Qianqin Containers Library

Popular applications, provided by [Qianqiu](https://github.com/qianqiu-labs), containerized and ready to launch.

## Get an image

The recommended way to get any of the Qianqiu Images is to pull the prebuilt image from the Docker Hub Registry.

```shell
docker pull qianqiu/APP
```

To use a specific version, you can pull a versioned tag.

```shell
docker pull qianqiu/APP:[TAG]
```

If you wish, you can also build the image yourself by cloning the repository, changing to the directory containing the Dockerfile, and executing the docker build command.

```shell
git clone https://github.com/qianqiu-labs/container-images.git
cd qianqiu/APP/VERSION/OPERATING-SYSTEM
docker build -t qianqiu/APP .
```

> Remember to replace the APP, VERSION, and OPERATING-SYSTEM placeholders in the example command above with the correct values.

## Contributing

We'd love for you to contribute to those container images. You can request new features by creating an [issue](https://github.com/qianqiu-labs/container-images/issues/new), or submit a [pull request](https://github.com/qianqiu-labs/container-images/pulls) with your contribution.

## License

Copyright © 2024 Qianqiu Labs.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
