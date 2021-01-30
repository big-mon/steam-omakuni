# Steam-Omakuni

Steam の地域差を可視化

# Getting Started

## Step 1: Installation

```bash
git clone git@github.com:big-mon/steam-omakuni.git steam-omakuni

cd steam-omakuni

touch .env
echo "MYSQL_ROOT_PASSWORD=[YOUR_PASSWORD]" > .env
echo "TZ='[YOUR_TIMEZONE]'" >> .env
```

## Step 2: Run

```bash
docker-compose up
```

## Tips

コンテナ間通信にて DB へ接続するためにはサーバー「db」、ポート「3306」を指定すればよい。
