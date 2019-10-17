# Build
docker build -t mistydev/multi-client:latest -t mistydev/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t mistydev/multi-server:latest -t mistydev/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t mistydev/multi-worker:latest -t mistydev/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# Push
docker push mistydev/multi-client:latest
docker push mistydev/multi-server:latest
docker push mistydev/multi-worker:latest
docker push mistydev/multi-client:$SHA
docker push mistydev/multi-server:$SHA
docker push mistydev/multi-worker:$SHA

# Apply
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=mistydev/multi-client:$SHA
kubectl set image deployments/server-deployment server=mistydev/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=mistydev/multi-worker:$SHA
