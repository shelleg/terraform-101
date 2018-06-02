## 4th form - modulize

### recap

* lab1 - all in one main.tf file ...
  ```text
  .
  |-- README.md       # readme
  `-- main.tf         # our root / main module
  ```

* lab2 - refactor "separation of concerns"
  ```text
  .
  |-- README.md       # readme
  |-- main.tf         # our root / main module
  |-- provider.tf     # provider related
  `-- variables.tf    # module variables
  ```

* lab3 - refactor - use data sources
```text
.
|-- README.md
|-- main.tf
|-- output.tf          # discuss in this lab
|-- provider.tf
`-- variables.tf
```




- [shell recording](shell-recording) available below

In the 3rd lab we did some refactoring, and dat sources to find the latest ubuntu 16.04 ami id.
In this lab we are going to make a module out of our terraform code like so:

create a modules directory (you can call it anything you want but `modules` sounds right ;))

#### shell recording
[![asciicast](https://asciinema.org/a/eMjgjNUlUDaf7SnF4tu7L6Voe.png)](https://asciinema.org/a/eMjgjNUlUDaf7SnF4tu7L6Voe)
