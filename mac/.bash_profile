#!/usr/bin/env bash

export MAVEN_OPTS="-Xms256m -Xmx512m"
export M2_HOME=~/develop/maven

export GOROOT=~/develop/go
export GOBIN=$GOROOT/bin
export GOPATH=~/develop/gowork
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct

export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export FLUTTER_HOME=~/develop/flutter

export ANDROID_HOME=~/develop/Android/sdk
export GRADLE_HOME=~/.gradle/wrapper/dists/gradle-5.6.4-all/ankdp27end7byghfw1q2sw75f/gradle-5.6.4

export NODE_HOME=~/develop/node

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

export REDIS_HOME=~/develop/redis

export PATH=$REDIS_HOME:$GRADLE_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$FLUTTER_HOME/bin:$M2_HOME/bin:$GOBIN:$GOPATH/bin:$NODE_HOME/bin:$PATH

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

http='http://127.0.0.1:1087'
socks5='socks5://127.0.0.1:1086'

function redis-start
{
    $REDIS_HOME/redis-server $REDIS_HOME/redis.conf
    echo "redis server started on 6379"
}

function redis-stop
{
    ps -ef | grep redis | grep -v 'grep' | awk '{print $2}' | xargs kill -9
    echo "redis server stoped"
}

function noproxy
{
    unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY all_proxy ALL_PROXY
    echo "clear proxy done"
}

function proxy
{
    http_proxy=$socks5
    HTTP_PROXY=$http_proxy
    https_proxy=$http_proxy
    HTTPS_PROXY=$https_proxy
    all_proxy=$http_proxy
    ALL_PROXY=$http_proxy
    echo "current proxy is ${http_proxy}"
    export http_proxy HTTP_PROXY https_proxy HTTPS_PROXY all_proxy ALL_PROXY
}

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh" 
