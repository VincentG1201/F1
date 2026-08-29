module ApplicationHelper
    def flag_emoji(alpha2_code)
        return "" if alpha2_code.blank?
        alpha2_code.upcase.chars.map { |c| (0x1F1E6 + (c.ord - "A".ord)).chr(Encoding::UTF_8) }.join
    end
end
