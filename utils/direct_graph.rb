# child of undirect graph
class DirectGraph < UndirectGraph
  attr_reader :reverse_edges

  def initialize
    super
    @reverse_edges = {}
  end

  def add_edge(vertex_v, vertex_w)
    @edges[vertex_v] ||= []
    @edges[vertex_w] ||= []
    @edges[vertex_v] << vertex_w

    @reverse_edges[vertex_v] ||= []
    @reverse_edges[vertex_w] ||= []
    @reverse_edges[vertex_w] << vertex_v

    add_vertex(vertex_v)
    add_vertex(vertex_w)
  end
end
