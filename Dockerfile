FROM node:20-slim AS builder
WORKDIR /app

# 1. package.json だけ先にコピー
COPY package.json package-lock.json ./

# 2. パッケージのインストール
RUN --mount=type=cache,target=/root/.npm \
    npm install --no-audit

# 3. ソースコードをコピー
COPY . .

# 4. ビルド段階でスライドをビルド
RUN npm run build

# ========== 本番用ステージ ==========
FROM node:20-slim
WORKDIR /app

COPY package.json package-lock.json ./

# serve のみをインストール
RUN npm install --no-save serve

# ビルダーステージから dist をコピー
COPY --from=builder /app/dist ./dist

EXPOSE 3032
ENV HOST=0.0.0.0
ENV PORT=3032

# 起動コマンド（静的ファイルサーバーのみ）
CMD ["npx", "serve", "-s", "dist", "-l", "3032"]
