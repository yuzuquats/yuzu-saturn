<!-- ```toml
[global.environment.variables.types]
MY_ENVIRONMENT_VARIABLE = "any"
MY_NUMBER = "u16"
MY_FILE = "file"
MY_DIRECTORY = "file"

[global.environment.variables.defaults]
MY_ENVIRONMENT_VARIABLE = "abc"
MY_NUMBER = "123"
MY_DIRECTORY = "directory"
-->

Test Commands
---

### Getting Started
---

#### Core Commands

##### Setup/Workflow Commands


This is some long set up command
<!-- environment variable types are derived by the global -->
<!-- ```toml
[environment.variables.defaults]
MY_ENVIRONMENT_VARIABLE = "abc"
MY_NUMBER = 123
MY_DIRECTORY = "directory"
-->
```bash
echo $MY_ENVIRONMENT_VARIABLE
echo starting
curl https://google.com
pwd
ls
python3 -m pip install boxprint
echo finish
```

Environment Variables
<!-- ```toml
[environment]
variables = [
  ["MY_ENVIRONMENT_VARIABLE", "any", "abc"],
  ["MY_NUMBER", "number", "123"],
  ["MY_FILE", "number", "/path/to/some/file"],
]
-->
```
echo $MY_ENVIRONMENT_VARIABLE
echo $MY_NUMBER
echo $MY_FILE
```

<!-- ```toml
[environment.variables.types]
MY_ENVIRONMENT_VARIABLE = "any"
MY_NUMBER = "u16"
MY_FILE = "file"
MY_DIRECTORY = "file"

[environment.variables.defaults]
MY_ENVIRONMENT_VARIABLE = "abc"
MY_NUMBER = 123
MY_DIRECTORY = "directory"
-->
```
echo $MY_ENVIRONMENT_VARIABLE
echo $MY_NUMBER
echo $MY_FILE
```

Here is some script I need to run very frequently but forget what it exactly does because documenting scripts suck
```bash
python3 --version
```

##### Basic

```bash
pwd
```

```bash
ls
```

```bash
cd ..
```

##### Git

Git status shows the working tree status. Specifically, displays differences
between the working tree and the index file.
```bash
git status
```

```bash
git log
```

---
### Other

Left empty
```bash
```

Something
```bash
echo hello
```

