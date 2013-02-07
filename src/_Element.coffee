shims.push class Element extends Shim
	# Does element match selector?
	# 
	# @param [String] selector
	# @return [Boolean] Matches Selector
	# @see https://developer.mozilla.org/en-US/docs/DOM/Element.mozMatchesSelector
	matchesSelector: (selector) ->
		console.log 'bob'
		if window.Element::hasOwnProperty 'webkitMatchesSelector'
			return @webkitMatchesSelector(selector)
		if window.Element::hasOwnProperty 'mozMatchesSelector'
			return @mozMatchesSelector(selector)
	
	# Registers a single event listener on a single target
	# 
	# @param [String] type
	# @param [Function] listener
	# @param [Boolean] useCapture Unsupported on IE8 and lower
	# 
	# @example
	#   target.addEventListener(type, listener, useCapture);
	#   
	# @see https://developer.mozilla.org/en-US/docs/DOM/element.addEventListener
	addEventListener: (type, listener, useCapture) ->
		if 'attachEvent' of window.Element.prototype
			return @attachEvent(type,listener)
	
	# Get element's offset from document root
	# 
	# @return [Object <top, left>] Offset
	# @example
	#   foo._cumulativeOffset()
	#   # => {top: 0, left: 0}
	_cumulativeOffset: ->
		offset =
			top: 0
			left: 0
		
		current = this
		while current
			offset.top += current.offsetTop
			offset.left += current.offsetLeft
			
			current = current.offsetParent
		
		return offset
	
	# Set an element's style using browser prefixes
	# 
	# @return this
	# @example
	#   foo._setXStyle 'transform', 'scale(3)'
	#   # => foo
	_setXStyle: (styleName, value) ->
		capitalizedStyleName = styleName.charAt(0).toUpperCase() + styleName.slice(1)
		
		this.style[styleName] = value
		this.style["O#{capitalizedStyleName}"] = value
		this.style["ms#{capitalizedStyleName}"] = value
		this.style["Moz#{capitalizedStyleName}"] = value
		this.style["webkit#{capitalizedStyleName}"] = value
		
		return this
	
	__example: -> document.createElement 'a'
