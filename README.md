# Haskell_Practice
Practice repository of static-typed, pure functional programming langugae Haskell.

## Getting Started
Docker image in windows platform behaves a little different from MacOS. 
- If Haskell script is successfully compiled on MacOS, it will compile on Windows as well. 
- While in execution level, windows ghci has more rigirous standard than MacOS, sometimes the instruction throws out an error on Windows but not on MacOS.
### Command
- `docker compose build`, build or rebuild all services speicified in docker compose file.
- `docker compose run --rm practice sh`, start ***practice*** service with default shell.

## Info check
### Image
```
$ uname -a
Linux 9173674cb975 5.10.104-linuxkit #1 SMP PREEMPT Thu Mar 17 17:05:54 UTC 2022 aarch64 GNU/Linux
```
### GHC
`ghc-pkg list`, to find packages installed in GHC

## Acknowledge
Dr. Lee provides the homework questions and class exercize on class CIS623, while I complete the requirements and notes in the files \
https://ecs.syracuse.edu/faculty-staff/andrew-c-lee