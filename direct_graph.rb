
require '../undirect_graph'

class DirectGraph < UndirectGraph
	def add_edge(v, w)
		@edges[v] ||= []
		@edges[v] << w

		if !(@vertics.include? v)
			@vertics << v
		end

		if !(@vertics.include? w)
			@vertics << w
		end
	end

end
