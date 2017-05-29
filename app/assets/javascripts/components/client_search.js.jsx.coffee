@ClientSearch = React.createClass
  preventSubmission: (e) ->
    e.preventDefault()

  getInitialState: ->
    search: ''

  handleChange: (e) ->
    value = e.target.value
    @setState search: value
    @handleSearch(value)

  handleSearch: (search) ->
    $.ajax
      type: 'POST'
      data: search: search
      url: '/clients/index_search'
      success: (data) =>
        @props.handleClients data

  render: ->
    `<div className='col-md-4 col-no-left-padding'>
      <div className='form-group'>
        <form onSubmit={this.preventSubmission}>
          <input type='search' className='form-control' value={this.state.search}
            onChange={this.handleChange} placeholder='Search...'
          />
        </form>
      </div>
    </div>`
