# 概要
- ローカル環境にてデータ分析環境を構築する。コンテナ起動時にJupyterLabが立ち上がる。

## 手順
1. Dockerfileを任意のディレクトリに配置
2. Dockerfileをbuildする。以下はDockerfileを配置したディレクトリで実行
<br>
``` docker build . ```
3. コンテナを実行
<br>
``` docker run -p 8888:8888 <イメージID> ```
<br>
4. コンテナ起動時にターミナルに出力されるリンクをクリック
``` http://127.0.0.1:8888/lab?token=<token> ```
5. ファイルシステムを共有する際は以下のコマンドを実行
<br>
``` docker run -p 8888:8888 -v ~/hoge/moge/:/work --name hoge  <イメージID> ```