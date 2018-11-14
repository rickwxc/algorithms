# undirect graph
class UndirectGraph
  attr_reader :edges
  attr_reader :vertics

  def initialize
    @vertics = []
    @edges = {}
  end

  def add_vertex(vertex_v)
    @vertics << vertex_v unless @vertics.include? vertex_v
  end

  def add_edge(vertex_v, vertex_w)
    @edges[vertex_v] ||= []
    @edges[vertex_v] << vertex_w

    @edges[vertex_w] ||= []
    @edges[vertex_w] << vertex_v

    add_vertex(vertex_v)
    add_vertex(vertex_w)
  end

  alias addEdge add_edge
end
