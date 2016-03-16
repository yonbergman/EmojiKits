@KitsPage = React.createClass
  getInitialState: ->
    {
      query: '',
      showModal: false
    }

  render: ->
    modal = if this.state.showModal then `<CreateModal/>` else `<span/>`
    `<div>
        <Search onChange={this.searchUpdated} onShowModal={this.showModal}/>
        <Kits kits={this.props.kits} query={this.state.query} />
        {modal}
    </div>
    `

  showModal: (toggle) ->
    this.setState({showModal: toggle})

  searchUpdated: (q) ->
    this.setState({query: q.toLowerCase()})

class @CreateModal extends React.Component

  $el: =>
    return $(ReactDOM.findDOMNode(this))

  componentDidMount: =>
    @$el().modal({backdrop: "static", keyboard: true, show: true})

  componentWillUnmount: =>
    @$el().off("hidden", this.handleHidden)

  open: =>
    @$el().modal("show")

  close: =>
    @$el().modal("hide")

  render: ->
    `<div className='modal fade'>
      <div className='modal-dialog'>
        <div className='modal-content'>
          <div className="modal-header">
            <button type="button" className="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <h4 className="modal-title">Modal title</h4>
          </div>
          <div className="modal-body">
            <h2>hi</h2>
          </div>
        </div>
      </div>
    </div>
    `

class @Search extends React.Component
  render: ->
    `<div className='search-bar'>
        <div className='container'>
            <div className='col-xs-9 col-sm-10'>
              <input type='search' className='form-control' placeholder='🔍 Search for emoji'onChange={this.searchUpdated} />
        </div>
            <button className='btn btn-primary col-xs-3 col-sm-2' onClick={this.showModal}>
              Create Kit
            </button>
        </div>
    </div>
    `

  showModal: =>
    this.props.onShowModal(true)

  searchUpdated: (ev) =>
    query = ev.target.value.trim()
    this.props.onChange(query)

class @Kits extends React.Component
  render: ->
    query = this.props.query
    kits = this.props.kits.filter((x) -> x.emoji.length > 0).map((x) -> `<Kit key={x.id} name={x.name} emoji={x.emoji} query={query}/> `)
    `<div>
    {kits}
    </div>`


class @Kit extends React.Component
  @propTypes =
    name: React.PropTypes.string

  render: ->
    query = this.props.query
    emojis = this.props.emoji.filter((x) -> x.name.toLowerCase().indexOf(query) >= 0)
    emojiDiv = if emojis.length == 0 then `<div>No emoji matched</div>` else `<Emojis emoji={emojis}/>`
    `<div className='kit'>
      <div className='container'>
        <h3> {this.props.name} </h3>
        {emojiDiv}
      </div>
    </div>`


