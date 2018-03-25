# Effective SQL 勉強用

## 準備

Docker で MySQL の環境を用意する。
サンプルの DB などがあるので起動時にセットアップするイメージを作成する

```console
$ EFFECTIVE_SQL_DB_PORT=13306
$ docker build -t effective-sql-study .
$ docker run --detach \
  --name effective-sql-study \
  --publish $EFFECTIVE_SQL_DB_PORT:3306 \
  effective-sql-study
```

## 接続

CLI から繋ぐには以下のようにする。(`--protocol tcp` とするのは macOS 上で Unix ドメインソケットを優先させないため)

```console
$ mysql --protocol tcp --port $EFFECTIVE_SQL_DB_PORT -u root
```

# 各章リンク

- [第1章 データモデルの設計](Chapter01/README.md)
- [第2章 プログラム可能性とインデックスの設計](Chapter02/README.md)
- [第3章 設計を変更できないときはどうするか](Chapter03/README.md)
- [第4章 フィルタリングとデータの検索](Chapter04/README.md)
- [第5章 集約](Chapter05/README.md)
- [第6章 サブクエリ](Chapter06/README.md)
- [第7章 メタデータの取得と分析](Chapter07/README.md)
- [第8章 直積](Chapter08/README.md)
- [第9章 タリーテーブル](Chapter09/README.md)
- [第10章 階層型データモデルの作成](Chapter10/README.md)

