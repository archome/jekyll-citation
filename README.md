jekyll-citation
===============

This is a plugin for [Jekyll](https://github.com/mojombo/jekyll) and [Octopress](http://octopress.org) that is designed to render citations encoded in [BibTeX](http://bibtex.org/) as part of posts and pages.

This plugin is based on Pablo Oliveira's [bibjekyll](https://github.com/pablooliveira/bibjekyll) plugin and Sylvester Keil's [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) gem, but uses neither.

Setup
-----

* Install the `citeproc-ruby` and `bibtex-ruby` gems.

* Copy `citation.rb` to your `_plugins/` directory (or `plugins/` for Octopress)

* Add the following lines to your `_config.yml` file for Jekyll:

    # BibTeX Citation plugin
    citation:
        citation_style: apa
        citation_locale: en

* Optionally, you can use other citation styles encoded in the [Citation Style Language (CSL)](http://citationstyles.org/). The entire CSL 1.0 Style Repository is available on Github at [citation-style-language/styles](https://github.com/citation-style-language/styles). For example, if you wanted to use the Chicago Manual of Style "author-date" format, you would save [this file](https://github.com/citation-style-language/styles/raw/master/chicago-author-date.csl) locally to `_plugins` and change your `_config.yml` to read:

    # BibTex Citation plugin
    citation:
        citation_style: _plugins/chicago-author-date.csl
        citation_locale: en

Usage
-----

This plugin parses BibTeX entries that are enclosed in a special Liquid block:

    {% bibtex %}
      ....
    {% endbibtex %}

For example:

    ---
    layout: post
    title: "Test"
    date: 2012-02-26 17:27
    comments: true
    ---

    This is an example citation of Brothman's 1991 article.

    {% bibtex %}
    @article{brothman1991orders,
      title={Orders of value: probing the theoretical terms of Archival Practice},
      author={Brothman, B.},
      journal={Archivaria},
      volume={32},
      number={1},
      year={1991}
    }
    {% endbibtex %}

As a result you would get the following output (dependent on the templates you use, of course):

    <h1>Test</h1>
    
    <p>This is an example citation of Brothman's 1991 article.</p>
    
    <p><p>Brothman, B. (1991). Orders of value: probing the theoretical terms of Archival Practice. <i>Archivaria</i>, <i>32</i>(1).</p>

License
-------

This plugin is released under the MIT License, the same license as Jekyll.
