FROM redhat/ubi8  
# we are using redhat 8 image from docker hub
# if this image is not available in docker server it will pull it
RUN dnf install dotnet-sdk-8.0 -y  
RUN mkdir /madhuriapp
# uses to run any command during docker build time
COPY . /madhuriapp/
# we are copying code from folder to inside docker image
WORKDIR /madhuriapp
# we are changing directory like cd command in linux / windows
RUN dotnet build -o madhuribin
# we are building / compiling dotnet sample app
CMD ./madhuribin/ashu-webapp  --urls=http://0.0.0.0:5000
# must be the final keyword of dockerfile which will run your app
