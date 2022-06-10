#create source repo
gcloud source repos create build-example

#Clone Repo into Cloud Shell
gcloud source repos clone build-example

# already their in your repo pls remove the files 
cd build-example/
ls -la
cd ..
rm -rf build-example/

# pull the code into the github 

git pull https://github.com/subrahmanyam1216/Gcp-cloudbuild-poc.git

git push origin master

# set the projectid in this project

export PROJECT_ID=$(gcloud config list --format 'value(core.project)')


#submit using cloudbuild.yaml file in current cloud shell directory
gcloud builds submit --config cloudbuild.yaml



-----------------------------------------------------------------------------------
#Submit manual build using Dockerfile to build the container, and push to Container Registry as 'build-run-image'
gcloud builds submit --tag gcr.io/$PROJECT_ID/build-run-image:v1


#Deploy to Cloud Run
gcloud run deploy cloud-run-deploy --image gcr.io/$PROJECT_ID/build-run-image:v1 --platform managed --region us-central1 --allow-unauthenticated

