for shim in shims
	unless window[shim.name]
		if shim::subClasses?
			# @private
			class window[shim.name] extends window[shim::__superclass]
		else
			# @private
			class window[shim.name]
	
	shimInternals = ['__example', '__superclass']
	
	for name, shimFunction of shim.prototype
		continue if name in shimInternals
		
		console.log name
		
		unless name of shim::__example()
			window[shim.name].prototype[name] = shimFunction
