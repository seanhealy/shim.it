@shims = []

# Base Class for Shims
#
# ``` coffeescript
# shims.push [Shim]
# ```
#
# notifies the manager of the shim's existance
#
# @example How to make a shim
#   shims.push 
#     _example: -> # Return an example of the Prototype you are shiming
class Shim
	# Example of Prototype to be shimmed
	# @return [Object] example
	__example: ->
	
	# @property [Object] Shim's superclass (optional)
	__superclass: null
	
