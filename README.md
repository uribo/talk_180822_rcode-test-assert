転ばぬ先のテスト・アサートの導入〜再現性の保証対策として〜
================

Author: Shinya Uryu ([\@uribo](https://github.com/uribo))

## Slide

https://speakerdeck.com/s_uryu/rcode-test-assert

![](inst/slide_overview.png)

- [inst/slide.key](https://github.com/uribo/talk_180822_rcode-test-assert/blob/master/inst/slide.key)
- [inst/slide.pdf](https://github.com/uribo/talk_180822_rcode-test-assert/blob/master/inst/slide.pdf)

## Running

**On Binder**

Click build start at binder!

[![Binder](http://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/uribo/talk_180822_rcode-test-assert/master)


## References

- http://testthat.r-lib.org
- https://github.com/ropensci/assertr
- https://github.com/lionel-/vdiffr
- [Rでアサートする系のパッケージ：ensurer, assertthat, assertr](https://notchained.hatenablog.com/entry/2015/03/22/140656)
- [アサートを使って堅牢なデータ設計をしよう](https://uribo.hatenablog.com/entry/2016/03/19/110000)
- [RStudio と vdiffr でプロットもテストしよう](https://qiita.com/kozo2/items/62193e74ab2239e3a1be)

## Session Information

```r
sessioninfo::session_info()
─ Session info ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.6.0 (2019-04-26)
 os       Debian GNU/Linux 9 (stretch)
 system   x86_64, linux-gnu           
 ui       RStudio                     
 language (EN)                        
 collate  en_US.UTF-8                 
 ctype    en_US.UTF-8                 
 tz       Etc/UTC                     
 date     2020-02-06                  

─ Packages ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 ! package           * version    date       lib source    
   assertr           * 2.6.9000   2020-02-06 [1] Github (ropensci/assertr@e69e369)
   assertthat          0.2.1      2019-03-21 [1] CRAN (R 3.6.0)
   backports           1.1.4      2019-04-10 [1] CRAN (R 3.6.0)
   callr               3.3.0      2019-07-04 [1] CRAN (R 3.6.0)
   cli                 1.1.0      2019-03-19 [1] CRAN (R 3.6.0)
   colorspace          1.4-1      2019-03-18 [1] CRAN (R 3.6.0)
   crayon              1.3.4      2017-09-16 [1] CRAN (R 3.6.0)
   desc                1.2.0      2018-05-01 [1] CRAN (R 3.6.0)
   devtools            2.0.2      2019-04-08 [1] CRAN (R 3.6.0)
   digest              0.6.20     2019-07-04 [1] CRAN (R 3.6.0)
   dplyr               0.8.3      2019-07-04 [1] CRAN (R 3.6.0)
   evaluate            0.14       2019-05-28 [1] CRAN (R 3.6.0)
   fontBitstreamVera   0.1.1      2017-02-01 [1] CRAN (R 3.6.0)
   fontLiberation      0.1.0      2016-10-15 [1] CRAN (R 3.6.0)
   fontquiver          0.2.1      2017-02-01 [1] CRAN (R 3.6.0)
   freetypeharfbuzz    0.2.5      2018-10-30 [1] CRAN (R 3.6.0)
   fs                  1.3.1      2019-05-06 [1] CRAN (R 3.6.0)
   gdtools           * 0.1.9      2019-06-18 [1] CRAN (R 3.6.0)
   ggplot2           * 3.2.0      2019-06-16 [1] CRAN (R 3.6.0)
   glue                1.3.1      2019-03-12 [1] CRAN (R 3.6.0)
   gtable              0.3.0      2019-03-25 [1] CRAN (R 3.6.0)
   here                0.1        2017-05-28 [1] CRAN (R 3.6.0)
   htmltools           0.3.6      2017-04-28 [1] CRAN (R 3.6.0)
   htmlwidgets         1.3        2018-09-30 [1] CRAN (R 3.6.0)
   httpuv              1.5.1      2019-04-05 [1] CRAN (R 3.6.0)
   jsonlite            1.6        2018-12-07 [1] CRAN (R 3.6.0)
   knitr               1.23       2019-05-18 [1] CRAN (R 3.6.0)
   labeling            0.3        2014-08-23 [1] CRAN (R 3.6.0)
   later               0.8.0      2019-02-11 [1] CRAN (R 3.6.0)
   lazyeval            0.2.2      2019-03-15 [1] CRAN (R 3.6.0)
   magrittr            1.5        2014-11-22 [1] CRAN (R 3.6.0)
   memoise             1.1.0      2017-04-21 [1] CRAN (R 3.6.0)
   mime                0.7        2019-06-11 [1] CRAN (R 3.6.0)
   munsell             0.5.0      2018-06-12 [1] CRAN (R 3.6.0)
   pillar              1.4.2      2019-06-29 [1] CRAN (R 3.6.0)
   pkgbuild            1.0.3      2019-03-20 [1] CRAN (R 3.6.0)
   pkgconfig           2.0.2      2018-08-16 [1] CRAN (R 3.6.0)
   pkgload             1.0.2      2018-10-29 [1] CRAN (R 3.6.0)
   prettyunits         1.0.2      2015-07-13 [1] CRAN (R 3.6.0)
   processx            3.4.0      2019-07-03 [1] CRAN (R 3.6.0)
   promises            1.0.1      2018-04-13 [1] CRAN (R 3.6.0)
   ps                  1.3.0      2018-12-21 [1] CRAN (R 3.6.0)
   purrr               0.3.2      2019-03-15 [1] CRAN (R 3.6.0)
   R6                  2.4.0      2019-02-14 [1] CRAN (R 3.6.0)
   Rcpp                1.0.1      2019-03-17 [1] CRAN (R 3.6.0)
   remotes             2.1.0      2019-06-24 [1] CRAN (R 3.6.0)
   rlang               0.4.0      2019-06-25 [1] CRAN (R 3.6.0)
   rmarkdown           1.13       2019-05-22 [1] CRAN (R 3.6.0)
   rprojroot           1.3-2      2018-01-03 [1] CRAN (R 3.6.0)
   rsconnect           0.8.13     2019-01-10 [1] CRAN (R 3.6.0)
   rstudioapi          0.10       2019-03-19 [1] CRAN (R 3.6.0)
   scales              1.0.0      2018-08-09 [1] CRAN (R 3.6.0)
   sessioninfo         1.1.1      2018-11-05 [1] CRAN (R 3.6.0)
   shiny             * 1.3.2      2019-04-22 [1] CRAN (R 3.6.0)
 R TalkNiesr3        * 0.0.0.9000 <NA>       [?] <NA>          
   testthat          * 2.1.1      2019-04-23 [1] CRAN (R 3.6.0)
   tibble              2.1.3      2019-06-06 [1] CRAN (R 3.6.0)
   tidyselect          0.2.5      2018-10-11 [1] CRAN (R 3.6.0)
   usethis             1.5.1      2019-07-04 [1] CRAN (R 3.6.0)
   vdiffr              0.3.1      2019-06-24 [1] CRAN (R 3.6.0)
   withr               2.1.2      2018-03-15 [1] CRAN (R 3.6.0)
   xfun                0.8        2019-06-25 [1] CRAN (R 3.6.0)
   xtable              1.8-4      2019-04-21 [1] CRAN (R 3.6.0)
   yaml                2.2.0      2018-07-25 [1] CRAN (R 3.6.0)

[1] /usr/local/lib/R/site-library
[2] /usr/local/lib/R/library

 R ── Package was removed from disk.
```



