
Baby.prototype.disqus_load = ->
  disqus_shortname = 'fishingtackleheroku'
  dsq = document.createElement('script')
  dsq.type = 'text/javascript'
  dsq.async = true
  dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js'
  (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq)



