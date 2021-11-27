if [[ -n $TOKEN_PICKLE_URL ]]; then
 wget -q $TOKEN_PICKLE_URL -O /usr/src/app/token.pickle
fi

gunicorn wserver:start_server --bind 0.0.0.0:$PORT --worker-class aiohttp.GunicornWebWorker & qbittorrent-nox -d --webui-port=8090 & python3 alive.py & ./aria.sh; python3 -m bot
