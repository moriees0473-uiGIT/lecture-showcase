# 強力な掃除コマンド
# docker system prune -f

# 1. Vite と Slidev のキャッシュフォルダを強制削除（先頭の # を消す！）
rm -r -Force node_modules/.vite -ErrorAction SilentlyContinue
rm -r -Force .slidev -ErrorAction SilentlyContinue

# 1. 実行中のコンテナを強制停止・削除
docker rm -f lecture-showcase-container

# 2. 最新のファイル（slides/内）をイメージに焼き込むためにビルド
# これにより、初期起動時のパス不整合を防ぎます
docker build -t lecture-showcase .

# 3. 実行（slidesフォルダのみをマウント）
# これにより、起動後の「編集→保存→即反映」が可能になります
docker run -it -p 3032:3032 `
  -v "${PWD}/slides:/app/slides" `
  --name lecture-showcase-container lecture-showcase