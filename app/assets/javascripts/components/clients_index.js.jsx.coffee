@ClientsIndex = React.createClass
  getInitialState: ->
    clients: @props.clients

  handleSearch: (clients) ->
    @setState clients: clients

  render: ->
    searchComponent =
      `<ClientSearch
        handleClients = {this.handleSearch}
      />`

    clientComponent = @state.clients.map (client, i) =>
      `<Client
        client = {client}
        key = {client.id}
      />`

    `<div>
      {searchComponent}
      <table className='table table-striped'>
        <thead>
          <tr>
            <th>First name</th>
            <th>Last name</th>
            <th>Date of birth</th>
            <th>Medical conditions</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {clientComponent}
        </tbody>
      </table>
    </div>`
