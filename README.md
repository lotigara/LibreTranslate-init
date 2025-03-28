# LibreTranslate-init

Shell scripts to install [LibreTranslate](https://libretranslate.com)

Uses WSGI with [Gunicorn and Nginx](https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-gunicorn-and-nginx-on-ubuntu-18-04).

Tested on Ubuntu 20.04.

[Known Python version bug with Ubuntu 24.04](https://github.com/LibreTranslate/LibreTranslate/issues/611#issuecomment-2415239429) and Python 3.12.

## Install

```
# Create libretranslate user
useradd libretranslate
mkdir /home/libretranslate
chown libretranslate:libretranslate /home/libretranslate
usermod -aG sudo libretranslate
passwd -d libretranslate
su libretranslate

# Download LibreTranslate-init
git clone https://github.com/argosopentech/LibreTranslate-init.git ~/LibreTranslate-init

# Download dependencies and run LibreTranslate on port 5000
~/LibreTranslate-init/setup.sh

# Add your hostname or IP address to this command
# When you run LibreTranslate for the first time it will download all of the language model packages
~/LibreTranslate/env/bin/libretranslate --host <your hostname or IP address>

# Add settings for LibreTranslate-init and LibreTranslate (latter is optional)
cp ~/LibreTranslate-init/.env.example ~/LibreTranslate-init/.env
# LT_DOMAIN is a domain name or an IP address, LT_DIR is the home directory of LT_USER and LT_USER is the user that LibreTranslate runs under
editor ~/LibreTranslate-init/.env

# Run LibreTranslate WSGI with nginx and systemd, this script also applies .env configuration to nginx
~/LibreTranslate-init/run.sh

# Check LibreTranslate status
sudo systemctl status libretranslate

# Enable https
~/LibreTranslate-init/get-cert.sh

```

#### Tutorials
- [Video tutorial](https://www.youtube.com/watch?v=mwacU-yqJwc)
- [Video tutorial 2](https://www.youtube.com/watch?v=SJ8lNcn4cjE)
- [Video tutorial 3](https://www.youtube.com/watch?v=dKR28QaaWLo)

#### Configuration
1. Find the setting you would like to change in the [LibreTranslate settings](https://github.com/LibreTranslate/LibreTranslate#arguments)
2. Add the setting to the `.env` file
