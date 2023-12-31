# final_test_project

My final test project from course Test Automation Selenium and Python

## Commands for test runner

1. Use the following command to run all tests

```shell
pytest -v --tb=line --language=en .
```

2. Check test_login_page.py, test_main_page.py, test_product_page.py for page specific test run commands.

## Used tools

+ [Python 3.11](https://www.python.org/downloads/)
+ [Selenium WebDriver](https://www.selenium.dev/documentation/webdriver/)
+ [ChromeDriver](https://chromedriver.chromium.org/downloads)
+ [geckodriver](https://github.com/mozilla/geckodriver/releases)
+ [pytest](https://docs.pytest.org/en/7.2.x/getting-started.html)
+ [docker](https://docs.docker.com/desktop/install/linux-install/)

## Link to the course

[Автоматизация тестирования с помощью Selenium и Python](https://stepik.org/course/575/syllabus)

## How to run the tests on your machine

1. Create a local project using Virtualenv
2. Clone this repository using following command

```shell
git clone https://github.com/Lexxx42/final_test_project.git
```

3. Install [Python 3.11](https://www.python.org/downloads/) if you haven't already
4. Install [ChromeDriver](https://chromedriver.chromium.org/downloads)

+ Work tested for Chrome Version 110.0.5481.178 (Official Build) (64-bit)

5. Install [GeckoDriver](https://github.com/mozilla/geckodriver/releases/)

+ Work tested for Firefox Version 110.0 (64-bit)

6. Add drivers to the Environment Variables based on your OS settings

+ [Windows] [computerhope](https://www.computerhope.com/issues/ch000549.htm)

7. Install requirements using the following command

```shell
pip install -r requirements.txt
```

8. Run the following command to start the tests

```shell
pytest -v --tb=line --language=en .
```

9. You can change webdriver to firefox

```shell
pytest -v --tb=line --language=en --browser_name=firefox .
```

9. You can change language to

```python
['ru', 'en', 'fr', 'es']
```

Example:

```shell
pytest -v --tb=line --language=fr .
```

## Use this sequence of commands to run the container:

1. To run the application in docker, you need to install docker-compose:

```shell
sudo apt install docker-compose 
```

2. Clone the repository

```shell
git clone https://github.com/Lexxx42/final_test_project.git
```

3. Change directory to project dir

```shell
cd final_test_project/
```

4. Create folder `logs` in clonned repository

```shell
mkdir logs
```

5. Start the build

```shell
docker-compose up --build
```

6. You can set ENTRYPOIN in docker-compose.yaml to start tests right away. Or use the commands with your docker image.

With volume if you need logs in a file. (Directory `logs` must be created before use of the command)

```shell
docker run -v ~/logs:/autotests/test_project/logs autotest_pytest pytest -v -s -rx -m negative --browser_name=firefox
```

And without volume.

```shell
docker run autotest_pytest pytest -v -s -rx -m negative
```

You are free to use all the test markings and/or files in this repository in a docker container.

## Added feature to create html test reports

> All reports saved to `/logs` directory

+ To use the feature use pytest commands without `-s` argument to capture the logs

```shell
pytest -m negative --tb=line
```

```shell
pytest -m negative --tb=line --browser_name=firefox
```

+ You can use those commands with docker container

```shell
docker run autotest_pytest pytest -m negative --tb=line
```

```shell
docker run autotest_pytest pytest -m negative --tb=line --browser_name=firefox
```

> Reports will be saved to `/logs` directory so mount a volume
> You will need to create a directory `logs` in your current user's home directory
> ```shell
> mkdir logs
>```

```shell
docker run -v ~/logs:/autotests/test_project/logs autotest_pytest pytest -m negative --tb=line --browser_name=firefox
```

```shell
docker run -v ~/logs:/autotests/test_project/logs autotest_pytest pytest -m negative --tb=line
```
