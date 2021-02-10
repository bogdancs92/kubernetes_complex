docker built -t bog754/fibo-client:latest -t bog754/fibo-client:$SHA -f ./client/Dockerfile ./client
docker built -t bog754/fibo-server:latest -t bog754/fibo-server:$SHA -f ./server/Dockerfile ./server
docker built -t bog754/fibo-worker:latest -t bog754/fibo-worker:$SHA -f ./worker/Dockerfile ./worker

docker push bog754/fibo-client:latest
docker push bog754/fibo-server:latest
docker push bog754/fibo-worker:latest

docker push bog754/fibo-client:$SHA 
docker push bog754/fibo-server:$SHA 
docker push bog754/fibo-worker:$SHA 

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=bog754/fibo-client:$SHA 
kubectl set image deployments/server-deployment server=bog754/fibo-server:$SHA 
kubectl set image deployments/worker-deployment worker=bog754/fibo-worker:$SHA 