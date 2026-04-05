# --- ビルド用 ---
FROM node:20-slim AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# --- 実行用 ---
FROM node:20-slim
WORKDIR /app
RUN npm install -g serve
# package.jsonで指定した ../dist (つまり /app/dist) からコピー
COPY --from=builder /app/dist ./dist

EXPOSE 3032
ENV PORT=3032
CMD ["serve", "-s", "dist", "-l", "3032"]