docker build -t leansolutionsllc/gke-client:latest -t leansolutionsllc/gke-client:$SHA  -f ./client/Dockerfile ./client
docker build -t leansolutionsllc/gke-server:latest -t leansolutionsllc/gke-server:$SHA  -f ./server/Dockerfile ./server
docker build -t leansolutionsllc/gke-worker:latest -t leansolutionsllc/gke-worker:$SHA -f ./worker/Dockerfile ./worker
docker push leansolutionsllc/gke-client:latest
docker push leansolutionsllc/gke-client:$SHA
docker push leansolutionsllc/gke-server:latest
docker push leansolutionsllc/gke-server:$SHA
docker push leansolutionsllc/gke-worker:latest
docker push leansolutionsllc/gke-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=leansolutionsllc/gke-server:$SHA
kubectl set image deployments/client-deployment client=leansolutionsllc/gke-client:$SHA
kubectl set image deployments/worker-deployment worker=leansolutionsllc/gke-worker:$SHA