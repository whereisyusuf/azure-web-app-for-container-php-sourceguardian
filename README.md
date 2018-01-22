# Enabling Source Guardian (or other similar) loaders in your PHP application on Azure App Service using docker containers

Sample Azure Web App in PHP using Web App for Containers and Sourceguardian extension

This repo contains sample index.php that is protected by SourceGuardian. If you try to open this locally, you will get a message to download and register SourceGuardian loaders. 

The application files are saved in www folder, where as the extension files are stored in the ext folder. 

## Local Docker Build

To deploy, download the files to a local folder. Install docker and then run the following command to build your docker image

``` sudo docker build -t mysite . ```

To run the container locally to validate use the docker run command as below and then browsing to the dns url of your VM on port 8080 e.g. http://<yourpublicIP>:8080.

``` docker run -p 8080:80 -d mysite ```

## Push to Registry

Finally, you can push the docker image to your Azure Container Registry (or dockerhub). For this - login into the registry using the docker login command 

``` docker login <your registry>.azurecr.io -u xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx -p myPassword ```

Tag your image to the registry

``` docker tag mysite <your registry>.azurecr.io/mysite ```

Finally push the image

``` docker push mysite ```

## Create Web App from Image

Now go to Azure Portal and create a Web App for Containers resource. In the Configure Container blade - click on Azure Container Registry and select your registry and image. You can browse to your web app url and your application will be up and running!
