echo "project name $1, $2"
DIR="$PWD/$1"
DOCKERDIR="$DIR/docker"
if [[ -z $2 ]]
then
 SHOP="b2c"
else
SHOP=$2
fi
if [[ -z $3 ]]
then
 VERSION="202204.0-p2"
else
SHOP=$3
fi

echo "dir =$DIR, docker dir=$DOCKERDIR, shop=$SHOP"
URL="https://github.com/spryker-shop/$SHOP-demo-shop.git -b $VERSION --single-branch $DIR"
echo $URL
git clone $URL
cd $DIR
echo $PWD
git clone https://github.com/spryker/docker-sdk.git --single-branch docker
echo $DOCKERDIR
$DOCKERDIR/sdk bootstrap $DIR/deploy.dev.yml
$DOCKERDIR/sdk up -x
