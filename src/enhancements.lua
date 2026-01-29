SMODS.Atlas{
    key = 'Green',
    path = 'green.png',
    px = 71,
    py = 95,
}

-- Green
SMODS.Enhancement {
    key = 'green',
    atlas = 'Green',
    pos = { x = 0, y = 0 },
    loc_txt= {
        name = 'Green',
        text = { 
            'Has been{C:green}#6#{}','{C:green}#1##3##2#{}#4#{C:money}#5#{}'
            }
    }, 
    config = { extra = { num = 0, odds = 20 } },
    loc_vars = function(self, info_queue, card)
        if card.ability.extra.num > 0 then
            local num, odds = SMODS.get_probability_vars(card, card.ability.extra.num,
                card.ability.extra.odds, 'green_green_green')
            return { vars = { num, odds, ' in ', ' chance to win ','$20', ' Greened'} }
        else
            return { vars = { 'Greened', '', '', '','', ''} }
        end

    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'green_luck', card.ability.extra.num, card.ability.extra.odds) then
                card.lucky_trigger = true
				return {
                    dollars = 20,
					message = 'Big Jackpot!'
				}
            end
        end
    end,
}