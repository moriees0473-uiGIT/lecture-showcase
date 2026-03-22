---
theme: default
routeAlias: components-sample
layout: center
---

# 🛠️ 授業用コントロール・サンプル集
スライドを作成する際は、以下のコードをMarkdownに**コピペ**するだけで実装できます。

---

## 1. 音声読み上げプレーヤー (SentencePlayer)
単語のハイライト（`[n]名詞[/n]`, `[v]動詞[/v]`）と、英語・日本語の読み上げを行います。

```html
<SentencePlayer
  jp="[n]アルゴリズム[/n]を[v]理解する[/v]"
  en="Understand the algorithm"
/>
```

<div class="mt-4 p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
  <SentencePlayer
    jp="[n]アルゴリズム[/n]を[v]理解する[/v]"
    en="Understand the algorithm"
  />
</div>

---

## 2. ターミナル風デモ (TerminalDemo)
コマンドラインの入力例を、かっこいい黒画面で表示します。

```html
<TerminalDemo cmd="docker run hello-world" />
```

<div class="mt-4 p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
  <TerminalDemo cmd="docker run hello-world" />
</div>

---

## 3. クイズボックス (QuizBox)
JSONファイルを読み込んで、インタラクティブなクイズを展開します。
※事前に `public/quizzes/` の中にJSONファイルを作成しておく必要があります。

```html
<QuizBox src="/quizzes/fe_01.json" />
```

<div class="mt-4 p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
  <QuizBox src="/quizzes/fe_01.json" />
</div>

---

## 4. キャプション付き画像 (ImageStack)
画像の下に説明文を添えて、見やすく表示します。
※画像は `public/images/` の中に入れておきます。

```html
<ImageStack 
  src="/images/p010.png" 
  caption="図1: システムの全体構成" 
/>
```

<div class="mt-4 p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
  <ImageStack src="https://placehold.co/600x200?text=Sample+Image" caption="図1: システムの全体構成" />
</div>