require 'bibtex'
require 'citeproc'

module Jekyll

  class BibtexBlock < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
    end

    # Bibtex code may use {{ }} markups which interfere with liquid.
    # Therefore, we override parse to completely ignore the content
    # of the {% bibtex %} blocks.
    def parse(tokens)
      @nodelist ||= []
      @nodelist.clear
      while token = tokens.shift
        if token =~ IsTag and token =~ FullToken and block_delimiter == $1
            end_tag
            return
        else
          @nodelist << token
        end
      end
      assert_missing_delimitation!
    end

    def render(context)
      # get the content of the {% bibtex %} block
      content = super
      @config = context.registers[:site].config['citation'] || {}
      @config['citation_style'] ||= 'apa'
      @config['citation_locale'] ||= 'en'
      out = BibTeX.parse(content, :include => [:meta_content]).map do |b|
        if b.respond_to?(:to_citeproc)
          CiteProc.process b.to_citeproc, :style => @config['citation_style'], :locale => @config['citation_locale'], :format => 'html'
        else
            b.is_a?(BibTeX::MetaContent) ? b.to_s : ''
        end
      end
      out
    end
  end
end

Liquid::Template.register_tag('bibtex', Jekyll::BibtexBlock)
