echo 'start'

# 变量
GITHASH=`git rev-parse --short HEAD`
IMGNAME=netcore-demo
CONTAINER=netcore-demo-web
# 发布
rm -rf ./publish
dotnet publish -o ./publish
# image
docker build -t $IMGNAME:$GITHASH .
docker tag $IMGNAME:$GITHASH $IMGNAME:latest
docker rmi -f $(docker images -q -f dangling=true)
# container
docker stop $CONTAINER || true && docker rm -f $CONTAINER || true
docker run --name $CONTAINER $IMGNAME