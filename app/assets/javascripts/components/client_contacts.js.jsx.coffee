@ClientContacts = React.createClass
  getInitialState: ->
    contacts: @props.contacts
    clientId: @props.clientId
    open: false
    errors: []
  toggleForm: ->
    @setState open: @state.open = !@state.open
  addContact: (contact) ->
    if contact.id != null
      contacts = @state.contacts.slice()
      contacts.unshift contact
      @setState contacts: contacts
    else
      errors = @state.errors.push contact.errors
      @setState errors: errors
  render: ->
    clientContactComponent = @state.contacts.map (contact, i) =>
      `<ClientContact
        contact = {contact}
        key = {contact.id}
      />`
    clientContactForm =
      `<ClientContactForm
        clientId = {this.state.clientId}
        handleNewContact = {this.addContact}
        open = {this.state.open}
        errors = {this.state.errors}
      />`

    `<div>
      <div className="frow frow--justify-between frow--items-center">
        <h5>Contact</h5>
        <span onClick={this.toggleForm} className="btn btn-primary btn-sm">{this.state.open ? 'Hide Form' : 'Add New' }</span>
      </div>
      {clientContactForm}
      {clientContactComponent}
    </div>`

