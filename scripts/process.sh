#!/bin/bash
for file in /competition/train/*
do
	aws s3api put-object --bucket train-kaggle-microsoft-big2015 --key $(basename $file) --body train/$(basename $file)
done

