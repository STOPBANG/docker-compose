#!/bin/bash

# k8s 마이크로서비스 실행시키는 스크립트. 잘 안 되면 delete 주석 풀고 다시 실행

settings=("auth" "sub" "review")

for setname in ${settings[@]}
do
	# kubectl delete -f "${msname}-api-env.yml"
	kubectl apply -f "${setname}-api-env.yml"
	# kubectl delete -f "${setname}-api-credentials.yml"
	kubectl apply -f "${setname}-api-credentials.yml"
done

# ms settings
# kubectl delete -f "ms-env.yml"
kubectl apply -f "ms-env.yml"
# kubectl delete -f "ms-credentials.yml"
kubectl apply -f "ms-credentials.yml"


dbms=("auth" "sub" "review")

for msname in ${dbms[@]}
do
	# kubectl delete -f "${msname}-db.yml"
	kubectl apply -f "${msname}-db.yml"
	# kubectl delete -f "${msname}-api-deploy.yml"
	kubectl apply -f "${msname}-api-deploy.yml"
done

# rabbit
# kubectl delete -f "rabbitmq.yml"
kubectl apply -f "rabbitmq.yml"

ms=("bookmark" "login-logout" "main" "map" "mypage" "register" "review")

for msname in ${ms[@]}
do
	# kubectl delete -f "${msname}-ms-deploy.yml"
	kubectl apply -f "${msname}-ms-deploy.yml"
done