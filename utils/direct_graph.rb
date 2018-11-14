class DirectGraph < UndirectGraph
	attr_reader :reverse_edges

	def initialize
		super
		@reverse_edges = {}
	end

	def add_edge(v, w)
		@edges[v] ||= []
		@edges[w] ||= []
		@edges[v] << w

		@reverse_edges[w] ||= []
		@reverse_edges[w] << v

		if !(@vertics.include? v)
			@vertics << v
		end

		if !(@vertics.include? w)
			@vertics << w
		end
	end

end
