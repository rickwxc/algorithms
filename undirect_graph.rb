
class UndirectGraph
	attr_reader :edges
	attr_reader :vertics

	def initialize()
		@vertics = []
		@edges = {}
	end

	def add_edge(v, w)
		@edges[v] ||= []
		@edges[v] << w

		@edges[w] ||= []
		@edges[w] << v

		if !(@vertics.include? v)
			@vertics << v
		end

		if !(@vertics.include? w)
			@vertics << w
		end
	end

end
