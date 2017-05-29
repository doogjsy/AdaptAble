@ClientContactForm = React.createClass
  getInitialState: ->
    date: ''
    contactType: ''
    notes: ''
    clientId: @props.clientId
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    data = client_contact: { date: @state.date, contact_type: @state.contactType, notes: @state.notes }, client_id: @state.clientId
    $.ajax
      url: '/client_contacts'
      data: data
      type: 'POST'

      success: (data) =>
        @props.handleNewContact data
        @getInitialState()

  valid: ->
    @state.date
    @state.contactType
    @state.notes
  increaseRows: () ->
    textArea = $('.js-text-area')
    textArea.attr("rows", textArea.val().split("\n").length+1||2);
  render: ->
    if @props.open
      `<form className='form-bordered' onSubmit={this.handleSubmit}>
        <h4>New Contact</h4>
        <div className='form-group'>
          <label htmlFor="date">
            Date
          </label>
          <input onChange={this.handleChange} className='form-control' id='date' type="date" name='date'
            value={this.state.date}
          />
        </div>
        <div className='form-group'>
          <label htmlFor="type">
            Type
          </label>
          <select onChange={this.handleChange} className='form-control' id='type' type="select" name='contactType'
            value={this.state.contactType}>
            <option>Please Select</option>
            <option value='phone'>Phone</option>
            <option value='email'>Email</option>
            <option value='home-visit'>Home Visit</option>
            <option value='technical-support'>Technical Support</option>
            <option value='other'>Other</option>
          </select>
        </div>
        <div className='form-group'>
          <label htmlFor="notes">
            Notes
          </label>
          <textarea onChange={this.handleChange} className='form-control js-text-area' type="text" rows='2'
            cols='5' name='notes' value={this.state.notes} onKeyUp={this.increaseRows}>
          </textarea>
        </div>
        <div className='form-group'>
          <button className='btn btn-primary btn-block' type="submit" disabled={!this.valid()}>
            Add New Contact
          </button>
        </div>
      </form>`
    else
      null
