def visit_endpoint(endpoint, data={}, params={})
  params[:format] ||= 'json'
  args = case endpoint
    when /^list of KSK$/i
      visit list_ksk_path(params), :get
    else raise "No endpoint mapping for '#{endpoint}'"
  end
  @response
end
