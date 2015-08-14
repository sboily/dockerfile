Docker image for Siremis
========================

If you want to play with the siremis configuration interfaces for kamailio.

On jessie, install docker.

    curl -sSL https://get.docker.com/ | sh    

Easy version
============

    docker run --rm --name siremis -p 8080:80 quintana/siremis

With the sources
================

    mkdir ~tmp
    cd ~tmp
    wget http://siremis.asipto.com/pub/downloads/siremis/siremis-4.2.0.tgz
    tar xfvz siremis-4.2.0.tgz
    cd siremis-4.2.0
    make prepare
    make chown
    cd ..
    docker run --rm --name siremis -v $(pwd):/var/www/ -p 8080:80 quintana/siremis

Open your browser to http://<your_ip>:8080 and enjoy!
