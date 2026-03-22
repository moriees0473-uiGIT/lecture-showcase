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

# 起動コマンド（直前に package.json の predev が走り、ローカルのUIライブラリがリンクされます）
#CMD ["npm", "run", "dev"]
COPY ./slides /app/slides
CMD ["npx", "slidev", "slides/history.md", "--port", "3032", "--remote"]
#CMD ["npx", "slidev", "slides/history.md", "--port", "3032"]
