@ClientContact = React.createClass
  getInitialState: ->
    contact: @props.contact
  renderTypeIcon: ->
    if @state.contact.contact_type == 'phone'
      `<i className="fa fa-2x fa-phone card-contact-icon"></i>`
    else if @state.contact.contact_type == 'email'
      `<i className="fa fa-2x fa-envelope card-contact-icon"></i>`
    else if @state.contact.contact_type == 'home-visit'
      `<i className="fa fa-2x fa-home card-contact-icon"></i>`
    else if @state.contact.contact_type == 'technical-support'
      `<i className="fa fa-2x fa-desktop card-contact-icon"></i>`
    else
      `<i className="fa fa-2x fa-comments card-contact-icon"></i>`

  formattedNote: ->
    lines = @state.contact.notes.split('\n')
    formatted = lines.map (line, index) ->
      `<span key={index}>{line}<br /></span>`
    `<div>{formatted}</div>`

  render: ->
    `<div className='card'>
      <div className='card-header'>
        {this.renderTypeIcon()}
        <p className= 'card-text'>{moment(this.state.contact.date).format('MMMM D, YYYY')}</p>
        <i className="fa fa-plus card-more js-more"></i>
      </div>
      <div className='js-hidden-body'>
        <div className="card-content">
          {this.formattedNote()}
        </div>
      </div>
    </div>`
