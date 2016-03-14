@KitsPage = React.createClass
  getInitialState: ->
    {
      query: ''
    }

  render: ->
    `<div>
        <Search onChange={this.searchUpdated}/>
        <Kits kits={this.props.kits} query={this.state.query} />
    </div>
    `

  searchUpdated: (q) ->
    this.setState({query: q.toLowerCase()})

class @Search extends React.Component
  render: ->
    `<div className='search-bar'>
        <div className='container'>
            <div className='col-xs-9 col-sm-10'>
              <input type='search' className='form-control' placeholder='🔍 Search for emoji'onChange={this.searchUpdated} />
        </div>
            <button className='btn btn-primary col-xs-3 col-sm-2'>
              Create Kit
            </button>
        </div>
    </div>
    `

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


