--Horribly inefficient to give every card its own atlas, i horribly dont care lol
--SMODS.Atlas {
--	key = "greengary",
--	path = "greengary.png",
--	px = 71,
--	py = 95
--}

-- This section remains commented out in memory of my homie, Green Gary, who taught me what it means to make your first joker
--SMODS.Joker {
--	key = 'greengary',
--	loc_txt = {
--		name = 'Green Gary',
--		text = {
  --          "{C:green}Greenly {}gives {C:mult}+#1# {} Mult"
	--	}
	--},
--	config = { extra = { mult = 69 } },
--	loc_vars = function(self, info_queue, card)
--		return { vars = { card.ability.extra.mult } }
--	end,
--	rarity = 1,
--	atlas = 'greengary',
--	pos = { x = 0, y = 0 },
--	cost = 2,
--	calculate = function(self, card, context)
--		if context.joker_main then
--			return {
--				mult_mod = card.ability.extra.mult,
--				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
  --          }
	--	end
--	end
--}

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
    rarity = 4,
    cost = 20,
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
	rarity = 3,
	atlas = 'gmg',
	pos = { x = 0, y = 0 },
	cost = 6,
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
	rarity = 2,
	atlas = 'gormus',
	pos = { x = 0, y = 0 },
	cost = 5,
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
	rarity = 2,
	atlas = 'greenback',
	pos = { x = 0, y = 0 },
	cost = 4,
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

SMODS.Atlas {
	key = "greenday",
	path = "greenday.png",
	px = 71,
	py = 95
}


SMODS.Joker {
	key = 'greenday',
    blueprint_compat = false,
	loc_txt = {
		name = 'Green Day',
		text = {
            "If played card walks a lonely road",
            "it walks these empty streets",
            "On the boulevard of being {C:green}Green{}",
			"{C:inactive}(Playing a single card{} {C:green}Greens{}{C:inactive} it){} "
		}
	},
	rarity = 1,
	atlas = 'greenday',
	pos = { x = 0, y = 0 },
	cost = 2,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return 
    end,
	calculate = function(self, card, context)
		if context.before and #context.full_hand == 1 then
            for _, scored_card in ipairs(context.scoring_hand) do
                scored_card:set_ability('m_green_green', nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        scored_card:juice_up()
                        return true
                    end
                }))
            end

            return {
                message = 'Sometimes, I wish someone out there will find me'
            }
        end
	end
}

SMODS.Atlas {
	key = "kalechip",
	path = "kalechip.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'kalechip',
    blueprint_compat = true,
	loc_txt = {
		name = 'Kale Chip',
		text = {
            "Played{C:green} Green{} cards eat a {C:red,E:2}kale chip{}",
            "making them healthier which causes them to",
            "permanently give {C:chips}+15{} chips"
		}
	},
	config = { extra = { chips = 15 } },
	rarity = 1,
	atlas = 'kalechip',
	pos = { x = 0, y = 0 },
	cost = 3,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return {}
    end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, 'm_green_green') then
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
                card.ability.extra.chips
				return {
					message = 'Yum!'
				}
			end
		end
	end
}

SMODS.Atlas {
	key = "multjoker",
	path = "multjoker.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'multjoker',
    blueprint_compat = true,
	loc_txt = {
		name = 'multcardjoker_1',
		text = {
            "The{C:legendary} Mod Creator{} needs to come up with a {C:edition}good idea{}",
            "for a joker that adds {C:mult}+5{} mult to played {C:green}green{} cards",
            "so all the base enhancements are covered"
		}
	},
	config = { extra = { mult = 5 } },
	rarity = 1,
	atlas = 'multjoker',
	pos = { x = 0, y = 0 },
	cost = 3,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return {}
    end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, 'm_green_green') then
                context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                card.ability.extra.mult
				return {
					message = 'trigger_multadded'
				}
			end
		end
	end
}

SMODS.Atlas {
	key = "greensteel",
	path = "greensteel.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'greensteel',
    blueprint_compat = true,
	loc_txt = {
		name = 'Greensteel the Hedgehog',
		text = {
            "This joker\'s {C:legendary}Cold-as-Steel{} demeanor seeps into played {C:green}green{} cards,",
            "granting them {X:mult,C:white}X0.1{} Mult{} when held in hand"
		}
	},
	config = { extra = { xmult = 0.1 } },
	rarity = 2,
	atlas = 'greensteel',
	pos = { x = 0, y = 0 },
	cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return {}
    end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, 'm_green_green') then
                context.other_card.ability.perma_h_x_mult = (context.other_card.ability.perma_h_x_mult or 1) +
                card.ability.extra.xmult
				return {
					message = 'nothing personnel, kid'
				}
			end
		end
	end
}

SMODS.Atlas {
	key = "greenade",
	path = "greenade.png",
	px = 71,
	py = 95
}


SMODS.Joker {
	key = 'greenade',
    blueprint_compat = false,
	loc_txt = {
		name = 'Greenade',
		text = {
            "Cards in first discard of round are either",
            "{C:red,E:2}destroyed{} or {C:green}greened{}"
		}
	},
	rarity = 3,
	atlas = 'greenade',
	pos = { x = 0, y = 0 },
	cost = 4,
	config = { },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return {}
    end,
	calculate = function(self, card, context)
		if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.discard and
            G.GAME.current_round.discards_used <= 0 then
					if SMODS.pseudorandom_probability(card, 'green_greenade', 1, 2) then
						return{remove = true}
					else
						context.other_card:set_ability('m_green_green', nil, true)
				end
			end
	end
}

SMODS.Atlas {
	key = "greenzero",
	path = "greenzero.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'greenzero',
    blueprint_compat = true,
	loc_txt = {
		name = 'Green 0',
		text = {
            "Played {C:green}green{} cards gain a {C:green}1 in 20{}",
            "chance to win {C:money}$20{}"
		}
	},
	rarity = 1,
	atlas = 'greenzero',
	pos = { x = 0, y = 0 },
	cost = 3,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return {}
    end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, 'm_green_green') then
                context.other_card.ability.extra.num = context.other_card.ability.extra.num +
                1
				return {
					message = 'put it all on green, baby!'
				}
			end
		end
	end
}

SMODS.Atlas {
	key = "greeneggs",
	path = "greeneggs.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'greeneggs',
    blueprint_compat = false,
	loc_txt = {
		name = 'Green eggs (no ham)',
		text = {
            "Sell this to {C:green}green{} {C:money}#1#{} cards in your deck",
            "increases by {C:money}3{} each turn"
		}
	},
	config = { extra = { greens = 3 , gain = 3} },
	rarity = 1,
	atlas = 'greeneggs',
	pos = { x = 0, y = 0 },
	cost = 2,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return { vars = { card.ability.extra.greens } }
    end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.greens = card.ability.extra.greens + card.ability.extra.gain
            return {
                message = 'eggs!',
            }
        end
		if context.selling_self then
			if G.playing_cards then
				local greens = card.ability.extra.greens
				local cards = {}
				for _, playing_card in ipairs(G.playing_cards) do
					table.insert(cards, playing_card)
				end
				pseudoshuffle(cards, "green_shuffle")
            	for _, playing_card in ipairs(cards) do
                	if not SMODS.has_enhancement(playing_card, 'm_green_green') and greens > 0 then
						playing_card:set_ability('m_green_green', nil, true)
						greens=greens-1
					end
            	end
        	end
			return {
                message = 'greened!',
            }
		end
	end
}

SMODS.Atlas {
	key = "greenthumb",
	path = "greenthumb.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'greenthumb',
    blueprint_compat = true,
	loc_txt = {
		name = 'Green thumb',
		text = {
            "{C:green}Green{} cards held in hand are also",
            "improved by {C:green}green{} jokers"
		}
	},
	rarity = 2,
	atlas = 'greenthumb',
	pos = { x = 0, y = 0 },
	cost = 5,
	config = { extra = { xmult = 0.1 ,  cash = 3, chips = 15, mult = 5, hxmult = 0.1} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_green_green
        return {}
    end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.hand and not context.end_of_round and SMODS.has_enhancement(context.other_card, 'm_green_green') then
            for _, gormus in ipairs(SMODS.find_card("j_green_gormus")) do 
				context.other_card.ability.perma_x_mult = (context.other_card.ability.perma_x_mult or 1) +
                card.ability.extra.xmult
			end
			for _, dolar in ipairs(SMODS.find_card("j_green_greenback")) do 
				context.other_card.ability.perma_h_dollars = (context.other_card.ability.perma_h_dollars or 0) +
                card.ability.extra.cash
			end
			for _, kale in ipairs(SMODS.find_card("j_green_kalechip")) do 
				context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
                card.ability.extra.chips
			end
			for _, mult in ipairs(SMODS.find_card("j_green_multjoker")) do 
				context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                card.ability.extra.mult
			end
			for _, edgy in ipairs(SMODS.find_card("j_green_greensteel")) do 
				context.other_card.ability.perma_h_x_mult = (context.other_card.ability.perma_h_x_mult or 1) +
                card.ability.extra.hxmult
			end
            for _, gamba in ipairs(SMODS.find_card("j_green_greenzero")) do 
				context.other_card.ability.extra.num = context.other_card.ability.extra.num +
                1
			end
			return {
                message = 'Overgrowth!',
            }
        end
	end
}