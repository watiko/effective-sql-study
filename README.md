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
