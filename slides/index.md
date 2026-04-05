---
layout: full
# 基本のナビゲーションをオフ
navbars: false
# ページ一覧（ドロワー）を完全に無効化
canvas:
  drawers: false
# プレゼンターモード自体の権限を制限（生徒に触らせない）
presenter: false
# キーボード・マウス操作の禁止
keyboard: false
selectable: false
---

<LectureCover 
  title="基本情報技術者試験対策講座"
  description="本セクションでは、試験の全体像と最も重要な『アルゴリズム』の基礎概念について学習します。"
  :items="[
    '試験の全体構成と配点の把握',
    'アルゴリズムとは何かを理解する',
    'フローチャートの基本記号を覚える'
  ]"
/>

---
layout: center
---

<script setup>
import SettingsPanel from './components/SettingsPanel.vue'
import PortalMenu from './components/PortalMenu.vue'
import ImageStack from './components/ImageStack.vue'
import SentencePlayer from './components/SentencePlayer.vue'
import TerminalDemo from './components/TerminalDemo.vue'
import ScrollBox from './components/ScrollBox.vue'
import QuizBox from './components/QuizBox.vue'
</script>

# 🎨 カスタムUIコンポーネント リファレンス
今回作成した7つのテーマ連動型コンポーネントの使い方をご紹介します。

---
layout: two-cols
---

# ⚙️ 1. SettingsPanel
テーマカラー、ダークモード、音声設定を一括管理する心臓部です。

* **特徴**: 
  * ここで選んだ色がすべてのコンポーネントに波及します。
  * `setting.md` に配置し、エイリアスで呼び出すのがおすすめです。

```html
<SettingsPanel />
```

::right::

# 🗂️ 2. PortalMenu
学習のトップページ（ポータル）に配置するメニューカードです。

* **特徴**:
  * ホバー時にテーマカラーの枠線とアクセントが光ります。
  * `vue-router` を使い、設定したエイリアス（ページ）へジャンプします。

```html
<PortalMenu />
```
<div class="mt-8 transform scale-75 origin-top-left">
  <PortalMenu />
</div>

---
layout: two-cols
---

# 🖼️ 3. ImageStack
画像とキャプションを美しく配置するコンポーネントです。

* **使い方**:
  * `src`: 画像のパス（またはURL）
  * `caption`: 画像の下に表示するテキスト

```html
<ImageStack 
  src="[https://picsum.photos/seed/slidev/400/200](https://picsum.photos/seed/slidev/400/200)" 
  caption="テーマカラーの枠線が付きます" 
/>
```

::right::

<div class="mt-12">
  <ImageStack 
    src="https://picsum.photos/seed/slidev/400/200" 
    caption="テーマカラーの枠線が付きます" 
  />
</div>

---
layout: two-cols
---

# 🔊 4. SentencePlayer
英語・日本語の読み上げ機能がついた学習用ブロックです。

* **機能**:
  * `[n]名詞[/n]` や `[v]動詞[/v]` で文字色をハイライトできます。
  * アイコンホバー時の丸い背景色もテーマに連動します。

```html
<SentencePlayer 
  jp="Dockerは[n]コンテナ[/n]を[v]作成[/v]します。" 
  en="Docker creates containers." 
/>
```

::right::

<div class="mt-12">
  <SentencePlayer 
    jp="Dockerは[n]コンテナ[/n]を[v]作成[/v]します。" 
    en="Docker creates containers." 
  />
  <SentencePlayer 
    jp="テーマカラーが[n]背景[/n]にうっすらと[v]反映[/v]されます。" 
  />
</div>

---
layout: two-cols
---

# 💻 5. TerminalDemo
コマンド入力例をスタイリッシュに表示するターミナルです。

* **特徴**:
  * ハッカー風のグリーン文字に、テーマカラーの枠線と背景色が混ざります。
  * プロンプト（$）の色もテーマに連動。

```html
<TerminalDemo 
  cmd="docker run -it -p 3032:3032 ubuntu" 
/>
```

::right::

<div class="mt-12">
  <TerminalDemo 
    cmd="docker build -t my-app .
docker run -it -p 3032:3032 my-app" 
  />
</div>

---
layout: two-cols
---

# 📜 6. ScrollBox
長いテキストやコードを限られた高さに収めるラッパーです。

* **特徴**:
  * スクロールバーの「つまみ」が半透明のテーマカラーになります。
  * `height` で高さを指定します。

```html
<ScrollBox height="200px">
  <p>1行目...</p>
  <p>2行目...</p>
  <p>3行目...</p>
  <p>4行目...</p>
  <p>5行目...</p>
</ScrollBox>
```

::right::

<div class="mt-12 border border-gray-300 dark:border-gray-700 p-4 rounded-lg">
  <ScrollBox height="200px">
    <div class="space-y-4">
      <p>スクロールしてみてください。</p>
      <p>スクロールバーの色がテーマカラーの半透明になっています。</p>
      <p>Dummy Text 1</p>
      <p>Dummy Text 2</p>
      <p>Dummy Text 3</p>
      <p>Dummy Text 4</p>
      <p>Dummy Text 5</p>
    </div>
  </ScrollBox>
</div>

---
layout: center
---

# 📝 7. QuizBox
JSONファイルから問題を読み込むインタラクティブなクイズです。

* **使い方**:
  * `public` フォルダ等に `quiz.json` を配置します。
  * `src` にそのパスを指定するだけでクイズが生成されます。

```html
<QuizBox src="/data/fe-quiz.json" />
```

<div class="mt-4 text-left text-sm text-gray-500">
💡 注意: このプレビューでは実際に json ファイルへのパスが必要なため、コード表示のみとしています。
</div>

---
layout: center
---

# IT業界の歴史と変遷
クリック（または右矢印キー）で、次の時代の解説がふわっと表示されます。

<HistoryTimeline 
  :eras="[
    { 
      title: 'メインフレーム期', 
      desc: '巨大な汎用機による集中処理の時代', 
      image: 'https://picsum.photos/seed/mainframe/200/200' 
    },
    { 
      title: 'クラサバ期', 
      desc: 'PCの普及と分散処理への移行', 
      image: 'https://picsum.photos/seed/pc/200/200' 
    },
    { 
      title: 'Web・クラウド期', 
      desc: 'インターネットと仮想化の爆発的普及', 
      image: 'https://picsum.photos/seed/cloud/200/200' 
    },
    { 
      title: 'AI・IoT期', 
      desc: 'あらゆるモノが繋がり、データが知能を持つ時代', 
      image: 'https://picsum.photos/seed/ai/200/200' 
    }
  ]"
/>