# SpinalHDL_Kit
SpinalHDL Development Kit for linux, it has some usefull scripts for spinalhdl.
## create an empty project
as follow, create a spinalhdl project, the first param is project name.
```shell
./tools/create_prj.sh test
cd test
sbt "runMain test.myVerilogTop"
```
