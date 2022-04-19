# McDonalds-Job
Simple McDonalds Job with deliveries 

Add the items in the items.lua into your qb-core/shared/items.lua

Add the item images from inv_images to your respected inventory

Add the job to qb-core/shared/jobs.lua
```	
  ['mcd'] = {
		label = 'McDonalds',
		defaultDuty = true,
		grades = {
			['0'] = {
				name = 'Worker',
				payment = 150
			},
		},
	},
```
