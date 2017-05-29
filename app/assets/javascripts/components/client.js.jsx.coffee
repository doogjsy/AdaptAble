@Client = React.createClass
  getInitialState: ->
    client: @props.client
  deleteClient: ->
    if confirm('Are you sure you want to do that?')
      $.ajax
        type: 'DELETE'
        url: @state.client.show_path
  render: ->
    clientId = @state.client.id
    `<tr>
      <td>{this.state.client.first_name}</td>
      <td>{this.state.client.last_name}</td>
      <td>{moment(this.state.client.date_of_birth).format('MMMM D, YYYY')}</td>
      <td>{this.state.client.medical_condition}</td>
      <td>
        <a href={this.state.client.show_path} className='fa fa-button fa-search'></a>
        <a href={this.state.client.edit_path} className='fa fa-button fa-pencil'></a>
        <form className='fa fa-button fa-trash' onClick={this.deleteClient} data-confirm='Are you sure?'>
          <input type='hidden' />
        </form>
      </td>
    </tr>`
