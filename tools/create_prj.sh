#!/bin/sh

## parameter 
proj_name=$(basename $1)
proj_ver="1.0"
sbt_ver="1.3.3"
scala_ver="2.11.12"
spinal_ver="1.4.0"

## create dir
if [ ! -d $proj_name ]; then
	mkdir -p $proj_name
else
	echo "Folder already exists!"
	exit 1
fi

cd $proj_name
mkdir -p project
mkdir -p src/main/scala/$proj_name

## create config
echo "sbt.version=$sbt_ver" > project/build.properties
echo -e "addSbtPlugin(\"com.typesafe.sbteclipse\" % \"sbteclipse-plugin\" % \"5.2.4\")" > project/plugins.sbt

echo -e "name := \"$proj_name\"" > build.sbt
echo -e "version := \"$proj_ver\"" >> build.sbt
echo -e "scalaVersion := \"$scala_ver\"" >> build.sbt
echo -e "val spinalVersion = \"$spinal_ver\"\n" >> build.sbt
echo -e "libraryDependencies ++= Seq(" >> build.sbt
echo -e "  \"com.github.spinalhdl\" % \"spinalhdl-core_2.11\" % spinalVersion," >> build.sbt
echo -e "  \"com.github.spinalhdl\" % \"spinalhdl-lib_2.11\" % spinalVersion," >> build.sbt
echo -e "  compilerPlugin(\"com.github.spinalhdl\" % \"spinalhdl-idsl-plugin_2.11\" % spinalVersion)" >> build.sbt
echo -e ")\n" >> build.sbt
echo "fork := true" >> build.sbt
echo "EclipseKeys.withSource := true" >> build.sbt



