type ffmpeg # ffmpeg is a dependency
. ./config.sh

mkdir $APP_DIR
files_to_delete=`ls $APP_DIR | grep -v resources`
for file in $files_to_delete; do
    rm -rv $APP_DIR/$file
done;

# Web Application
cd ./WebApplication
dotnet restore
dotnet publish -c Release -o $APP_DIR
cp ./game-platform.service /etc/systemd/system
cd ..
systemctl stop game-platform.service
systemctl enable game-platform.service
systemctl start game-platform.service
# systemctl status rfcx-espol-server.service

chmod -R 755 $APP_DIR/resources
chown -R $ICE_USER $APP_DIR/resources

