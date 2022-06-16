FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    vim
# ユーザで共有できるようにopt配下にインストールする
WORKDIR /opt

# Anacondaのインストール。
# anaconda3ディレクトリを作成して、配下にanacondaをインストール。バッチモードでの起動とインストーラの実行。
# PythonのPATHを通す。
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh && \
    bash /opt/Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -f Anaconda3-2019.10-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH

# コンテナ起動時にjupyterlabが立ち上がるようにデフォルトコマンドを設定。
# ローカルで起動する
# ルートユーザでの起動を明示的に許可する
# パスワードを指定する
RUN pip install --upgrade pip
WORKDIR /
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]