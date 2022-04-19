Config = {}

Config = Config or {}

Config.JobStart = {
	{ ["x"] = 95.46, ["y"] = 285.2, ["z"] = 110.21, ["h"] = 0 },
}

Config.JobStartGreen = {
	{ ["x"] = 98.189262, ["y"] = 280.39895, ["z"] = 110.2074, ["h"] = 0 },
}

Config.PickUpStuff = {
	{ ["x"] = 650.68, ["y"] = 2727.25, ["z"] = 41.99, ["h"] = 0 },
}

Config.PaymentTaco = math.random(150, 300)

Config.JobBusy = false

Config.JobData = {
--  ['mcd-meal'] = 100,
 ['register'] = 1,
 ['mcd-meal'] = 0,
 ['locations'] = {
  
	[1] = {
	  ['name'] = 'Shell', 
		x = 95.17,
		y = 294.37,
		z = 110.21,
	},
	[2] = {
		['name'] = 'Register', 
		x = 278.16,
		y = -974.4,
		z = -29.43,
	  },
	[3] = {
		['name'] = 'GiveTaco', 
		x = 87.72,
		y = 291.74,
		z = 110.21,
	  },
	  [4] = {
		['name'] = 'Coke', 
		x = 94.9,
		y = 289.33,
		z = 110.21,
	  },
	  [5] = {
		['name'] = 'Patty', 
		x = 95.17,
		y = 294.37,
		z = 110.21,
	  },
	  [6] = {
		['name'] = 'Wrap', 
		x = 92.02,
		y = 295.54,
		z = 110.21,
	  },
	   [7] = {
		['name'] = 'Burger', 
		x = 93.84,
		y = 294.96,
		z = 110.21,
	  },
	   [8] = {
		['name'] = 'Ice', 
		x = 89.65,
		y = 296.31,
		z = 110.21,
	  },
	   [9] = {
		['name'] = 'Mptato', 
		x = 96.65,
		y = 293.9,
		z = 110.21,
	  },
	   [10] = {
		['name'] = 'Cptato', 
		x = 96.65,
		y = 293.9,
		z = 110.21,
	  },
	    [11] = {
		['name'] = 'Meal', 
		x = 90.65,
		y = 292.29,
		z = 110.21,
	  },
  },
}

Config.Locations = {
    ["ogcarspawn"] = {
        label = "Car Spawn",
        coords = {x = 106.2, y = 282.83, z = 109.97, h = 257.25},
    },
    ["stash"] = {
        label = "MCD Stash",
        coords = {x = 93.39, y = 291.34, z = 110.21, h = 339.01},
    },
	["storage"] = {
        label = "MCD Storage",
        coords = {x = 91.87638, y = 291.93267, z = 110.20738, h = 337.05679},
    },
    
}

Config.Vehicles = {
    ["911turbos"] = "Porsche",
}

Config.Storage = {
    label = "MCD Storage",
    slots = 11,
    items = {
        [1] = {
            name = "potato",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "cone",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "vegpatty",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 3,
        },
		[4] = {
            name = "sauce",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 4,
        },
		[5] = {
            name = "cheese",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 5,
        },
		[6] = {
            name = "bun",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 6,
        },
		[7] = {
            name = "flour",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 7,
        },
		[8] = {
            name = "mashedp",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 8,
        },
		[9] = {
            name = "oil",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 9,
        },
		[10] = {
            name = "cutp",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 10,
        },
		[11] = {
            name = "emptyglass",
            price = 0,
            amount = 1000,
            info = {},
            type = "item",
            slot = 11,
        },
    }
}

