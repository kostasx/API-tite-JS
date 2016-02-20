# CONFIGURATION

application = 'EVAL_<NUMBER>'
username    = 'EVAL_VAAS'
password    = '<PASSWORD>'

# IGNORE THESE COMMENTED LINES. THEY ARE INTENTED FOR LOCAL TESTING ONLY
# config   = require("fs").readFileSync("../_RAW/API_KEYS.json", "utf8"); 
# username = JSON.parse(config).acapela.username
# password = JSON.parse(config).acapela.password
# sender   = JSON.parse(config).acapela.sender

API_URL     = 'http://vaas.acapela-group.com/Services/Synthesizer'

options = 
  'prot_vers'          : '2'
  'cl_env'             : 'PHP_APACHE_2.2.3_LINUX_SUSE'    # TODO replace with you environment description
  'cl_vers'            : '1-30'
  'cl_login'           : username
  'cl_app'             : application
  'cl_pwd'             : password
  'req_type'           : ''
  'req_snd_id'         : ''
  'req_voice'          : 'graham22k' # 'heather22k'    # TODO select a voice
  'req_text'           : ''
  'req_vol'            : ''
  'req_spd'            : ''
  'req_vct'            : ''
  'req_eq1'            : ''
  'req_eq2'            : ''
  'req_eq3'            : ''
  'req_eq4'            : ''
  'req_snd_type'       : ''
  'req_snd_ext'        : ''
  'req_snd_kbps'       : ''
  'req_alt_snd_type'   : ''
  'req_alt_snd_ext'    : ''
  'req_alt_snd_kbps'   : ''
  'req_wp'             : ''
  'req_bp'             : ''
  'req_mp'             : ''
  'req_comment'        : 'That\'s what I call a comment!'
  'req_start_time'     : ''
  'req_timeout'        : ''
  'req_asw_type'       : ''
  'req_asw_as_alt_snd' : ''
  'req_err_as_id3'     : ''
  'req_echo'           : 'ON' #  replace with '' when no more needed (suitable for debug but not often for normal usage)

textToSpeech = (text)->

  results = {}

  return new Promise((fulfill, reject)->

    console.log "Converting #{text} into speech..."
    options.req_text = text

    require('superagent')
      .post(API_URL)
      .type('form')
      .send(options)
      .end((err,res)->
        if err 
          return reject(err)
        else
          result = res.text.split("&")
          results = result.reduce((prev,curr)-> 
            attr  = curr.split("=")
            prev[attr[0]] = attr[1]
            return prev 
          ,{})
          if results['res'] is 'NOK'
            return reject({ 'err_code' : results['err_code'], 'err_msg' : decodeURIComponent(results['err_msg']) })
          else
            return fulfill({ 'snd_url' : results['snd_url'] })
          # console.log results
      )
  )

# COMMAND LINE USAGE
text = process.argv.splice(2)[0]

if text isnt undefined 
  textToSpeech(text)
  .then( (res)-> console.log res )
  .catch( (e)-> console.log e )

### USAGE:

textToSpeech('Testing some text')
.then( (res)-> console.log res )
.catch( (e)-> console.log e ) 

###