#!/bin/bash

# 도커 이미지 빌드하는 스크립트
# 무조건 stop_bang_msa 디렉토리 위치에서 실행할 것

PRE="stopbang-"

for dir in $PWD/*
do
	if [ -d $dir ]; then
		cd $dir
		BASENAME=$(basename "$PWD")
		PICK=${BASENAME#*stop_bang_}
		IMAGENAME=""
		if [ $PICK = "auth_DB" ]; then
			IMAGENAME="ywonchae1/stopbang-auth-api"
		elif [ $PICK = "review_DB" ]; then
			IMAGENAME="ywonchae1/stopbang-review-api"
		elif [ $PICK = "sub_DB" ]; then
			IMAGENAME="ywonchae1/stopbang-sub-api"
		elif [ $PICK = "login_logout" ]; then
			IMAGENAME="ywonchae1/stopbang-login-logout-ms"
		else
			IMAGENAME="ywonchae1/stopbang-${PICK}-ms"
		fi
		docker build --platform linux/amd64 -t $IMAGENAME .
		docker push $IMAGENAME
		cd ..
	fi
done
