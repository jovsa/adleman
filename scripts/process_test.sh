#!/bin/bash
count=0
for file in /competition/test/*
do
	let count=count+1
	aws s3api put-object --bucket test-kaggle-microsoft-big2015 --key $(basename $file) --body test/$(basename $file)
	echo $count
done

