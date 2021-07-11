# tt, codeのsingle quoteがどうやっても直らない問題の対応
# kmutoさんから提供いただいたパッチにちょっと手を加えている
# https://gist.github.com/kmuto/99748f999acb7bfa140ded5672f0c3ea
module ReVIEW
  module LATEXBuilderOverride
    def inline_tt(s)
      super(s)
        .gsub(" ", '\ ')
        .gsub("'", '\textquotesingle ').sub(/(textquotesingle) (?!.*textquotesingle)$/, '\1')
        .gsub("`", '\textasciigrave ').sub(/(textasciigrave) (?!.*textasciigrave)$/, '\1')
    end

    def inline_code(s)
      super(s)
        .gsub(" ", '\ ')
        .gsub("'", '\textquotesingle ').sub(/(textquotesingle) (?!.*textquotesingle)$/, '\1')
        .gsub("`", '\textasciigrave ').sub(/(textasciigrave) (?!.*textasciigrave)$/, '\1')
    end
  end

  class LATEXBuilder
    prepend LATEXBuilderOverride
  end
end
