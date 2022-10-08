# Haskell_Practice
Practice repository of static-typed, pure functional programming langugae Haskell.

## Note
### Command
- `docker compose build`, build or rebuild all services speicified in docker compose file.
- `docker compose run --rm practice sh`, start ***practice*** service with default shell.

## Environment
```
$ ghci
Prelude> :show paths
current working directory: 
  /app
module import search paths:
  .
Prelude> :cd dir
Prelude> :load SCRIPT.lhs
[1 of 1] Compiling Main     ( SCRIPT.lhs, interpreted )
Ok, one module loaded.

Prelude> :show packages              
show the currently active package flags
$ ghc-pkg list
find packages installed in GHC
```
### Docker
#### Image
- `uname -a`
    - Linux 9173674cb975 5.10.104-linuxkit #1 SMP PREEMPT Thu Mar 17 17:05:54 UTC 2022 aarch64 GNU/Linux

#### GHC
- `ghci --version`
    - The Glorious Glasgow Haskell Compilation System, version 8.10.7
- `cabal --version`
    - cabal-install version 3.8.1.0
    - compiled using version 3.8.1.0 of the Cabal library 

### MacOS
- `uname -a`
    - Darwin MacBook-Air-M2.local 21.6.0 Darwin Kernel Version 21.6.0: Mon Aug 22 20:20:07 PDT 2022; root:xnu-8020.140.49~2/RELEASE_ARM64_T8110 arm64 
#### GHC
- `ghci --version`
    - The Glorious Glasgow Haskell Compilation System, version 9.2.4
- `Cabal --version`
    - cabal-install version 3.8.1.0
    - compiled using version 3.8.1.0 of the Cabal library 


## Acknowledge
Dr. Lee provides the homework questions and class exercize on class CIS623, while I complete the requirements and notes in the files \
https://ecs.syracuse.edu/faculty-staff/andrew-c-lee