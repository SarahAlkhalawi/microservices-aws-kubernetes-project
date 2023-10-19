# microservices-aws-kubernetes-project

#How to deploy:

##Step 1: Create EKS cluster.

##Step 2: Install Helm Postgres Chart into cluster
`$ helm install postgresql bitnami/postgresql --set primary.persistence.enabled=false`

##Step 3: Get the password
`export POSTGRES_PASSWORD=$(kubectl get secret --namespace default postgresql -o jsonpath="{.data.postgres-password}" | base64 -d)
`

`echo $POSTGRES_PASSWORD
`
##Step 4: Run port forwarding
`kubectl port-forward --namespace default svc/postgresql 5432:5432
`
##Step 5: running the seed files
`psql --host 127.0.0.1 -U postgres -d postgres -p 5432 < 1_create_tables.sql
psql --host 127.0.0.1 -U postgres -d postgres -p 5432 < 2_seed_users.sql
psql --host 127.0.0.1 -U postgres -d postgres -p 5432 < 3_seed_tokens.sql`

##Step 6: Create a Dockerfile for the application and build codeBuild to create and push image into AWS ECR.

##Step 7: Apply service, deployment, secret and configMap yaml files

`Kubectl apply -f ./deployment
`




