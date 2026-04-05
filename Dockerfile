FROM node:20-slim
WORKDIR /app

# 1. package.json だけ先にコピー
COPY package.json ./

# 2. 基本パッケージのインストール（Gitは不要になったので削除）
# ※ここでは slidev や vue だけがインストールされます
RUN --mount=type=cache,target=/root/.npm \
    npm install --no-audit

# 3. ソースコードをコピー
COPY . .

EXPOSE 3032
ENV HOST=0.0.0.0
ENV PORT=3032

# 起動コマンド（本番環境では静的ファイルサーバーでサーブ）
CMD ["npm", "start"]
