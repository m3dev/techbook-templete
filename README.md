# README 

これはエムスリー株式会社のtechbook用テンプレートです。


# 参考情報

- Re:VIEW: https://github.com/kmuto/review/
- Re:VIEW image for Docker: https://github.com/vvakame/docker-review
- Re:VIEW フォーマットガイド: https://github.com/kmuto/review/blob/master/doc/format.ja.md


## PDFビルド

以下のコマンドでsrc配下にpdfが生成されます

```
docker run --rm -v $PWD/src:/work vvakame/review:5.1 /bin/sh -c "cd /work && review-pdfmaker config.yml"
```
