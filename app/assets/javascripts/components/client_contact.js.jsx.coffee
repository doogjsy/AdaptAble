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

  handleClick: ->
    swal
      title: 'Send Client Contact'
      html: '<div class="form-group">
              <label>Email</label>
              <input type="email" id="swal-input1" class="form-control" placeholder="Addressee">
            </div>
            <div class="form-group">
              <label>Message</label>
              <textarea id="swal-input2" class="form-control">
              </textarea>
            </div>',
      preConfirm: () =>
        new Promise (resolve, reject) =>
          email = $('#swal-input1').val()
          message = $('#swal-input2').val()
          if !email
            swal.showValidationError 'Please enter an email address'
            reject()
          else if !message.trim()
            swal.showValidationError 'Please enter a message'
            reject()
          else
            $.ajax
              url: "/client_contacts/#{@props.contact.id}/send_email"
              type: 'POST'
              dataType: 'json'
              data: { email: email, message: message }
              beforeSend: =>
                resolve()
    .then (message) =>
      true
    , =>
      null


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
        <a className='fa-clickable' onClick={this.handleClick} target='_blank'>
          <span style={{marginLeft: '20px', color: '#444'}}>Send as PDF</span>
        </a>
        <i className="fa fa-plus card-more js-more"></i>
      </div>
      <div className='js-hidden-body'>
        <div className="card-content">
          {this.formattedNote()}
        </div>
      </div>
    </div>`
