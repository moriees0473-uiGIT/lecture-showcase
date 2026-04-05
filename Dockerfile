FROM node:20-slim AS builder
WORKDIR /app

# 1. package.json だけ先にコピー
COPY package.json package-lock.json ./

# 2. パッケージのインストール（devDependencies を含む）
RUN --mount=type=cache,target=/root/.npm \
    npm install --no-audit --legacy-peer-deps

# 2b. インストール確認
RUN npm list cross-env

# 3. ソースコードをコピー
COPY . .

# 4. ビルド実行
RUN npm run build

# 5. dist ディレクトリ確認
RUN ls -la /app/ | head -20

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
