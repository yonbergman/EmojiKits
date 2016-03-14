class @Emoji extends React.Component
  @propTypes =
    name: React.PropTypes.string
    image: React.PropTypes.string

  render: ->
    `<div className='emojiItem'>
      <img className='emoji' src={this.props.image}/>
      <span>:{this.props.name}:</span>
    </div>`


class @Emojis extends React.Component

  render: ->
    emojiList = this.props.emoji
    if (emojiList.length == 0)
      return `<span/>`
    else
      e = emojiList.map((e) ->
        `<Emoji key={e.id} name={e.name} image={e.image}/>`
      )
      `<div className='emojis' >{e}</div>`
