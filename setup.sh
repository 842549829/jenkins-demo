rm -rf ./publish
dotnet publish -o ./publish
docker build -t netcore-demo .