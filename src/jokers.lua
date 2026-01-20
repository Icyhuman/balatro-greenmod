--Horribly inefficient, i horribly dont care lol
SMODS.Atlas {
	key = "greengary",
	path = "greengary.png",
	px = 71,
	py = 95
}


SMODS.Joker {
	key = 'greengary',
	loc_txt = {
		name = 'Green Gary',
		text = {
            "{C:green}Greenly {}gives {C:mult}+#1# {} Mult"
		}
	},
	config = { extra = { mult = 69 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'greengary',
	pos = { x = 0, y = 0 },
	cost = 2,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
            }
		end
	end
}

SMODS.Atlas {
	key = "greenlord",
	path = "greenlord.png",
	px = 71,
	py = 95
}
-- Greenlord
SMODS.Joker {
    key = "greenlord",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    atlas = 'greenlord',
    pos = { x = 0, y = 0 },
    loc_txt = {
		name = 'Greenlord Glash\'talar',
		text = {
            "{C:green}Green {}cards give {X:mult,C:white}X3{} Mult{}"
		}
	},
    config = { extra = { xmult = 3 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_green_green') then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}

SMODS.Atlas {
	key = "gmg",
	path = "greenmangroup.png",
	px = 71,
	py = 95
}


SMODS.Joker {
	key = 'greenmangroup',
    blueprint_compat = true,
	loc_txt = {
		name = 'Green Man Group',
		text = {
            "{C:green}Green {}cards are retriggered {C:attention}2 {}times"
		}
	},
	config = { extra = { repetitions = 2 } },
	rarity = 1,
	atlas = 'gmg',
	pos = { x = 0, y = 0 },
	cost = 2,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return { vars = { card.ability.extra.dollars } }
    end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if SMODS.has_enhancement(context.other_card, 'm_green_green') then
				return {
					message = 'Greentriggered!',
					repetitions = card.ability.extra.repetitions,
					card = context.other_card
				}
			end
		end
	end
}

SMODS.Atlas {
	key = "gormus",
	path = "gormus.png",
	px = 71,
	py = 95
}


SMODS.Joker {
	key = 'gormus',
    blueprint_compat = true,
	loc_txt = {
		name = 'Gormus the Green',
		text = {
            "{C:green}Green {}cards are infused with potent magic,",
            "granting them {X:mult,C:white}X0.1{} Mult{}{C:green} permanently{}"
		}
	},
	config = { extra = { xmult = 0.1 } },
	rarity = 1,
	atlas = 'gormus',
	pos = { x = 0, y = 0 },
	cost = 2,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return { vars = { card.ability.extra.dollars } }
    end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, 'm_green_green') then
                context.other_card.ability.perma_x_mult = (context.other_card.ability.perma_x_mult or 1) +
                card.ability.extra.xmult
				return {
					message = 'Greenchanted!'
				}
			end
		end
	end
}

SMODS.Atlas {
	key = "greenback",
	path = "greenback.png",
	px = 71,
	py = 95
}


SMODS.Joker {
	key = 'greenback',
    blueprint_compat = true,
	loc_txt = {
		name = 'Greenback',
		text = {
            "The {C:green}Federal Greeserve {}issues {C:green} Green{}-backed securities,",
            "increasing the value of played {C:green}Green{} cards by {C:money}3${}",
            "when held in hand"
		}
	},
	config = { extra = { cash = 3 } },
	rarity = 1,
	atlas = 'greenback',
	pos = { x = 0, y = 0 },
	cost = 2,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return { vars = { card.ability.extra.dollars } }
    end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, 'm_green_green') then
                context.other_card.ability.perma_h_dollars = (context.other_card.ability.perma_h_dollars or 0) +
                card.ability.extra.cash
				return {
					message = 'This will surely have no negative impact on the economy!'
				}
			end
		end
	end
}