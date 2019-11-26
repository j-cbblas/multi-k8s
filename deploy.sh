docker build -t thejuan23/multi-client:latest -t thejuan23/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t thejuan23/multi-server:latest -t thejuan23/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t thejuan23/multi-worker:latest -t thejuan23/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push thejuan23/multi-client:latest
docker push thejuan23/multi-server:latest
docker push thejuan23/multi-worker:latest

docker push thejuan23/multi-client:$SHA
docker push thejuan23/multi-server:$SHA
docker push thejuan23/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=thejuan23/multi-server:$SHA
kubectl set image deployments/client-deployment client=thejuan23/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=thejuan23/multi-worker:$SHA
