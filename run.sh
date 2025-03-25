# Setup systemd
sudo cp ~/LibreTranslate-init/libretranslate.service /etc/systemd/system/
sudo systemctl start libretranslate
sudo systemctl enable libretranslate
# sudo systemctl status libretranslate

# Configure Nginx
set -a
. ~/LibreTranslate-init/.env
set +a
envsubst < ~/LibreTranslate-init/nginx > ~/LibreTranslate-init/nginx
sudo cp ~/LibreTranslate-init/nginx /etc/nginx/sites-available/default
sudo nginx -t
sudo systemctl restart nginx

