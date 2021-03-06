<!-- TOC -->

- [第1章 データモデルの設計](#第1章-データモデルの設計)
    - [項目1 全てのテーブルに主キーが定義されていることを確認する](#項目1-全てのテーブルに主キーが定義されていることを確認する)
    - [項目2 冗長なデータを取り除く](#項目2-冗長なデータを取り除く)
        - [RDB 設計に関する本:](#rdb-設計に関する本)
    - [項目3 繰り返しグループを取り除く](#項目3-繰り返しグループを取り除く)
    - [項目4 列ごとにプロパティを 1 つだけ格納する](#項目4-列ごとにプロパティを-1-つだけ格納する)
    - [項目5 計算値の格納は一般にまずい考えであることを理解する](#項目5-計算値の格納は一般にまずい考えであることを理解する)
    - [項目6 参照整合性を確保するために外部キーを定義する](#項目6-参照整合性を確保するために外部キーを定義する)
    - [項目7 テーブル間の関係を意味のあるものにする](#項目7-テーブル間の関係を意味のあるものにする)
    - [項目8 第三正規形で十分でなければ、さらに正規化する](#項目8-第三正規形で十分でなければさらに正規化する)
    - [項目9 データウェアハウスでは非正規化を使用する](#項目9-データウェアハウスでは非正規化を使用する)

<!-- /TOC -->

# 第1章 データモデルの設計


## 項目1 全てのテーブルに主キーが定義されていることを確認する

## 項目2 冗長なデータを取り除く

- 行ごとにデータの重複が生じうるテーブルは、更新不整合などを防ぐため論理的に分割(正規化)する。
- CTE(Common Table Expression)という表現が出てきた。6章で扱うらしい。

### RDB 設計に関する本:

- Database Design for Mere Mortals, Third Edition
- Handbook of Relational Database Design

## 項目3 繰り返しグループを取り除く

- 繰り返しグループ(Repeating Group): ある行に同じ種類のデータが複数個含まれたもの
  - 例: (QuantityN, ItemDescriptionN, PriceN), (CategoryN), (カラムがCSVであるもの)
- 配列があればそれが使われるようなものと解釈した。
- こういうことをする場合は1対他の関係に正規化する

> 列は高くつく <br>
> 行は安上がりである

## 項目4 列ごとにプロパティを 1 つだけ格納する

- カラムに保存するデータは最小単位(atomic data)になるようにする
  - 例: (FirstName, LastName)

## 項目5 計算値の格納は一般にまずい考えであることを理解する

- 一般的にはよくないが、インデックスとして活用したい場合は計算列やトリガーなどで更新することもある。

## 項目6 参照整合性を確保するために外部キーを定義する

## 項目7 テーブル間の関係を意味のあるものにする

- 一見正規化をした方が良いように見えても、実際はしない方がいいこともある
- EAV(Entity-Attribute-Value)がフィットすることもある。
  - ある種類の商品データを格納するとして、その商品ジャンルしか扱わないアプリケーションと、その他の商品ジャンルも扱うアプリケーションで適するデータ構造は違う
  - 扱うビジネスによって使うべきデータ構造は違う
- 構造化データ(RDB)は構造を決めてからでないとデータを追加できないが、半構造化データ(JSON, XML)ではそうではない

## 項目8 第三正規形で十分でなければ、さらに正規化する

- 最初の三つの正規形(およびボイスコッド正規形)
  - 関数従属性(functional dependency)に関するもの
- 第四正規形(4NF)
  - 多値従属性(multivalued dependency)に関するもの

TODO: この項目は改めて読み返す

### 補足

> DB の設計において、重要なものは BCNF と 5NF です。そのほかの正規形は歴史的な経緯から残っているだけで、それらを目指した正規化は、ほとんどありません。一般化された従属性という概念を用いて、正規化を行うことで、BCNF と 5NF 以外の正規化については、考えなくて済むのです。
(奥野幹也(2015) 理論から学ぶデータベース実践入門 技術評論社, p71)

## 項目9 データウェアハウスでは非正規化を使用する
