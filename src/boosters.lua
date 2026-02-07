SMODS.Atlas{
    key = 'greenpack',
    path = 'greenpack.png',
    px = 71,
    py = 96,
}

SMODS.ObjectType({
    key = "green_greenjokers", -- The prefix is not added automatically so it's recommended to add it yourself
    default = "j_green_greenday",
    cards = {
        j_green_greenlord = true,
        j_green_greenmangroup = true,
        j_green_gormus = true,
        j_green_greenback = true,
        j_green_greenday = true,
        j_green_kalechip = true,
        j_green_multjoker = true,
        j_green_greensteel = true,
        j_green_greenade = true,
        j_green_greenzero = true,
        j_green_greeneggs = true,
        j_green_greenthumb = true,
    },
})

SMODS.Booster {
    key = "greenpack",
    weight = 1,
    kind = 'Buffoon', -- You can also use Buffoon if you want it to belong to the vanilla kind
    cost = 6,
    atlas = 'greenpack',
    loc_txt= {
        name = 'GREENPACK',
        text = { "Pick {C:attention}#1#{} out of",
                "{C:attention}#2#{} {C:green}Green{} jokers", },
        group_name = {"Get greened on!"},
    },
    pos = { x = 0, y = 0 },
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.BUFFOON_PACK)
    end,
    create_card = function(self, card, i)
        return { set = "green_greenjokers", area = G.pack_cards, skip_materialize = true, soulable = true }
    end,
}